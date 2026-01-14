#pragma once
#include "base_gate.h"
#include "gate_registry.h"
#include <cassert>

/**
 * STOREH gate - Store halfword to memory (selector-based approach)
 *
 * Takes a byte address and a value, stores the lowest 16 bits to memory.
 * Performs read-modify-write on the containing word.
 *
 * Uses selector-based halfword selection:
 * - Split word into 2 halfwords h_0, h_1 using 1 ZKSET
 * - Get v = value & 0xFFFF using 1 ZKSET
 * - Use 1 bit selector b_0 with b_1 = 1 - b_0
 * - Position: r = 0 means replace h_0, r = 2 means replace h_1
 * - new_h_i = h_i + b_i * (v - h_i)
 * - Uses MUL (not MUL32) for efficiency
 */
class StorehGate : public BaseGate {
public:
    OPTYPE get_type() const override {
        return OPTYPE::STOREH;
    }

    std::string get_name() const override {
        return "StorehGate";
    }

    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& registry) override {
        assert(op.wires.size() == 2);

        std::size_t addr_wire = op.wires[0];
        std::size_t value_wire = op.wires[1];

        // Step 1: Compute word address: q = addr >> 2
        std::size_t q_wire = emit_and_transform(
            BaseOp(OPTYPE::SRLI, {addr_wire}, {}, 2),
            circuit, ctx, registry);

        // Step 2: Compute byte-aligned address for load: load_addr = q * 4
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {q_wire}, {4}));
        std::size_t load_addr_wire = circuit.size() - 1;

        // Step 3: Load the full word from memory
        std::size_t word_wire = emit_and_transform(
            BaseOp(OPTYPE::LOAD, {load_addr_wire}),
            circuit, ctx, registry);

        // Step 4: Compute byte offset: r = addr - load_addr (should be 0 or 2)
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {addr_wire, load_addr_wire}, {1, f61::minor(1)}));
        std::size_t r_wire = circuit.size() - 1;

        // Step 5: Split word into 2 halfwords using ZKSET
        // word = h_0 + h_1 * 65536
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t h1_wire = circuit.size() - 1;
        ctx.set2id.push_back(h1_wire);

        // h_0 must be ZKSET to constrain to [0, 65535]
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t h0_wire = circuit.size() - 1;
        ctx.set2id.push_back(h0_wire);

        // Checkzero: word - h_1 * 65536 - h_0 == 0
        circuit.push_back(BaseOp(OPTYPE::LINEAR,
            {word_wire, h1_wire, h0_wire},
            {1, f61::minor(1ULL << 16), f61::minor(1)}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // Step 6: Get v = value & 0xFFFF using ZKSET
        // value = v + high_v * 65536
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t high_v_wire = circuit.size() - 1;
        ctx.set2id.push_back(high_v_wire);

        // v must be ZKSET to constrain to [0, 65535]
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t v_wire = circuit.size() - 1;
        ctx.set2id.push_back(v_wire);

        // Checkzero: value - high_v * 65536 - v == 0
        circuit.push_back(BaseOp(OPTYPE::LINEAR,
            {value_wire, high_v_wire, v_wire},
            {1, f61::minor(1ULL << 16), f61::minor(1)}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // Step 7: Prover inputs 1 bit selector b_0
        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t b0_wire = circuit.size() - 1;

        // Step 8: Verify b_0 is a bit: b_0 * (1 - b_0) == 0
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {ctx.wire_1, b0_wire}, {1, f61::minor(1)}));  // 1 - b_0
        std::size_t one_minus_b0 = circuit.size() - 1;
        circuit.push_back(BaseOp(OPTYPE::MUL, {b0_wire, one_minus_b0}));  // b_0 * (1 - b_0)
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // Step 9: b_1 = 1 - b_0
        std::size_t b1_wire = one_minus_b0;

        // Step 10: Verify position: 2*b_1 - r == 0
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {b1_wire, r_wire}, {2, f61::minor(1)}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // Step 11: Compute new halfwords: new_h_i = h_i + b_i * (v - h_i)
        // For h_0: diff_0 = v - h_0, term_0 = b_0 * diff_0, new_h_0 = h_0 + term_0
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {v_wire, h0_wire}, {1, f61::minor(1)}));
        std::size_t diff0_wire = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::MUL, {b0_wire, diff0_wire}));
        std::size_t term0_wire = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::LINEAR, {h0_wire, term0_wire}, {1, 1}));
        std::size_t new_h0_wire = circuit.size() - 1;

        // For h_1: diff_1 = v - h_1, term_1 = b_1 * diff_1, new_h_1 = h_1 + term_1
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {v_wire, h1_wire}, {1, f61::minor(1)}));
        std::size_t diff1_wire = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::MUL, {b1_wire, diff1_wire}));
        std::size_t term1_wire = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::LINEAR, {h1_wire, term1_wire}, {1, 1}));
        std::size_t new_h1_wire = circuit.size() - 1;

        // Step 12: Combine: new_word = new_h_0 + new_h_1 * 65536
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {new_h0_wire, new_h1_wire}, {1, 1ULL << 16}));
        std::size_t new_word_wire = circuit.size() - 1;

        // Step 13: Store the modified word back to memory
        std::size_t store_wire = emit_and_transform(
            BaseOp(OPTYPE::STORE, {load_addr_wire, new_word_wire}),
            circuit, ctx, registry);

        // STOREH doesn't produce a result
        circuit[op_index] = BaseOp(OPTYPE::LINEAR, {store_wire}, {0});
    }

    void execute(std::size_t op_index, const BaseOp& op,
                 std::vector<f61>& wire_val, ExecuteContext& ctx,
                 GateRegistry& registry) override {
        assert(op.wires.size() == 2);

        uint64_t addr = wire_val[op.wires[0]].val;
        uint64_t value = wire_val[op.wires[1]].val;

        // Step 1: Compute word address: q = addr >> 2
        uint64_t q = addr >> 2;
        std::size_t q_wire = alloc_and_execute(
            OPTYPE::SRLI, BaseOp(OPTYPE::SRLI, {op.wires[0]}, {}, 2), f61(q),
            wire_val, ctx, registry);

        // Step 2: LINEAR for load_addr = q * 4
        uint64_t load_addr = q * 4;
        std::size_t load_addr_wire = ctx.num_wires++;
        wire_val[load_addr_wire] = f61(load_addr);

        // Step 3: Load the full word from memory
        auto it = ctx.ram_map.find(load_addr);
        uint64_t word_val = 0;
        if (it != ctx.ram_map.end()) {
            word_val = it->second.val;
        }
        std::size_t word_wire = alloc_and_execute(
            OPTYPE::LOAD, BaseOp(OPTYPE::LOAD, {load_addr_wire}), f61(word_val),
            wire_val, ctx, registry);

        // Step 4: r = addr - load_addr (should be 0 or 2)
        uint64_t r = addr - load_addr;
        wire_val[ctx.num_wires++] = f61(r);

        // Step 5: Split word into 2 halfwords
        uint64_t h0 = word_val & 0xFFFF;
        uint64_t h1 = (word_val >> 16) & 0xFFFF;

        // h_1 (ZKSET)
        wire_val[ctx.num_wires++] = f61(h1);

        // h_0 (INPUT)
        wire_val[ctx.num_wires++] = f61(h0);

        // checkzero wire
        wire_val[ctx.num_wires++] = f61(0);

        // Step 6: Get v = value & 0xFFFF
        uint64_t v = value & 0xFFFF;
        uint64_t high_v = (value >> 16) & 0xFFFF;

        // high_v (ZKSET)
        wire_val[ctx.num_wires++] = f61(high_v);

        // v (INPUT)
        wire_val[ctx.num_wires++] = f61(v);

        // checkzero wire
        wire_val[ctx.num_wires++] = f61(0);

        // Step 7: Set bit selector based on r
        // r=0 → b_0=1, b_1=0; r=2 → b_0=0, b_1=1
        uint64_t b0 = (r == 0) ? 1 : 0;
        uint64_t b1 = 1 - b0;

        // b_0 (INPUT)
        wire_val[ctx.num_wires++] = f61(b0);

        // Step 8: Verify b_0 is a bit
        // 1 - b_0
        wire_val[ctx.num_wires++] = f61(b1);
        // b_0 * (1 - b_0) = 0
        wire_val[ctx.num_wires++] = f61(0);

        // Step 10: Position check (checkzero wire)
        wire_val[ctx.num_wires++] = f61(0);  // 2*b_1 - r = 0

        // Step 11: Compute new halfwords
        uint64_t new_h0 = (r == 0) ? v : h0;
        uint64_t new_h1 = (r == 2) ? v : h1;

        // diff_0, term_0, new_h_0
        wire_val[ctx.num_wires++] = f61((v - h0 + PR) % PR);  // diff_0
        wire_val[ctx.num_wires++] = f61(b0 * ((v - h0 + PR) % PR) % PR);  // term_0
        wire_val[ctx.num_wires++] = f61(new_h0);  // new_h_0

        // diff_1, term_1, new_h_1
        wire_val[ctx.num_wires++] = f61((v - h1 + PR) % PR);  // diff_1
        wire_val[ctx.num_wires++] = f61(b1 * ((v - h1 + PR) % PR) % PR);  // term_1
        wire_val[ctx.num_wires++] = f61(new_h1);  // new_h_1

        // Step 12: new_word
        uint64_t new_word = new_h0 + (new_h1 << 16);
        wire_val[ctx.num_wires++] = f61(new_word);

        // Step 13: STORE the modified word
        alloc_and_execute(
            OPTYPE::STORE, BaseOp(OPTYPE::STORE, {load_addr_wire, ctx.num_wires - 1}), f61(0),
            wire_val, ctx, registry);

        // STOREH doesn't produce a result
        wire_val[op_index] = f61(0);
    }
};

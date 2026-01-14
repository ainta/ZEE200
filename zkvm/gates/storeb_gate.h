#pragma once
#include "and32_gate.h"
#include "gate_registry.h"
#include <cassert>

/**
 * STOREB gate - Store byte to memory (selector-based approach)
 *
 * Takes a byte address and a value, stores the lowest byte to memory.
 * Performs read-modify-write on the containing word.
 *
 * Uses selector-based byte selection to avoid expensive AND32 operations:
 * - Prover inputs 3 bit selectors b_0, b_1, b_2
 * - b_3 = 1 - b_0 - b_1 - b_2
 * - Exactly one selector is 1, indicating which byte position to modify
 * - Uses MUL (not MUL32) for efficiency
 */
class StorebGate : public And32Gate {
public:
    OPTYPE get_type() const override {
        return OPTYPE::STOREB;
    }

    std::string get_name() const override {
        return "StorebGate";
    }

    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& registry) override {
        assert(op.wires.size() == 2);

        std::size_t addr_wire = op.wires[0];
        std::size_t value_wire = op.wires[1];

        // Step 1: Compute byte offset using MOD4: r = addr % 4
        std::size_t r_wire = emit_and_transform(
            BaseOp(OPTYPE::MOD4, {addr_wire}),
            circuit, ctx, registry);

        // Step 2: Compute word-aligned address: load_addr = addr - r
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {addr_wire, r_wire}, {1, f61::minor(1)}));
        std::size_t load_addr_wire = circuit.size() - 1;

        // Step 3: Load the full word from memory
        std::size_t word_wire = emit_and_transform(
            BaseOp(OPTYPE::LOAD, {load_addr_wire}),
            circuit, ctx, registry);

        // Step 4: Split word into 4 bytes using HIGH8 ROM byte decomposition
        std::vector<std::size_t> a_wires = create_byte_decomposition(word_wire, circuit, ctx, registry);
        // a_wires = [a_0, a_1, a_2, a_3] where word = a_0 + a_1*256 + a_2*65536 + a_3*16777216

        // Step 5: Extract v = value & 0xFF efficiently
        // value = low16 + high16 * 65536, low16 = v + byte1 * 256
        // Only need 1 ZKSET + 1 INPUT + 1 LOAD (vs full decomposition's 1 ZKSET + 3 INPUT + 2 LOAD)

        // high16 via ZKSET
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t v_high16_wire = circuit.size() - 1;
        ctx.set2id.push_back(v_high16_wire);

        // low16 via INPUT
        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t v_low16_wire = circuit.size() - 1;

        // Checkzero: value - high16 * 65536 - low16 == 0
        circuit.push_back(BaseOp(OPTYPE::LINEAR,
            {value_wire, v_high16_wire, v_low16_wire},
            {1, f61::minor(1ULL << 16), f61::minor(1)}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // LOAD byte1 = HIGH8[low16]
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {v_low16_wire, ctx.wire_1},
                                 {1, RomOffsets::HIGH8_OFFSET}));
        std::size_t v_addr_wire = circuit.size() - 1;

        std::size_t v_byte1_wire = emit_and_transform(
            BaseOp(OPTYPE::LOAD, {v_addr_wire}),
            circuit, ctx, registry);

        // v = low16 - byte1 * 256
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {v_low16_wire, v_byte1_wire}, {1, f61::minor(256)}));
        std::size_t v_wire = circuit.size() - 1;

        // Step 6: Prover inputs 3 bit selectors b_0, b_1, b_2
        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t b0_wire = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t b1_wire = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t b2_wire = circuit.size() - 1;

        // Step 7: Verify each b_i is a bit: b_i * (1 - b_i) == 0
        // For b_0:
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {ctx.wire_1, b0_wire}, {1, f61::minor(1)}));  // 1 - b_0
        std::size_t one_minus_b0 = circuit.size() - 1;
        circuit.push_back(BaseOp(OPTYPE::MUL, {b0_wire, one_minus_b0}));  // b_0 * (1 - b_0)
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // For b_1:
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {ctx.wire_1, b1_wire}, {1, f61::minor(1)}));  // 1 - b_1
        std::size_t one_minus_b1 = circuit.size() - 1;
        circuit.push_back(BaseOp(OPTYPE::MUL, {b1_wire, one_minus_b1}));  // b_1 * (1 - b_1)
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // For b_2:
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {ctx.wire_1, b2_wire}, {1, f61::minor(1)}));  // 1 - b_2
        std::size_t one_minus_b2 = circuit.size() - 1;
        circuit.push_back(BaseOp(OPTYPE::MUL, {b2_wire, one_minus_b2}));  // b_2 * (1 - b_2)
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // Step 8: Define b_3 = 1 - b_0 - b_1 - b_2
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {ctx.wire_1, b0_wire, b1_wire, b2_wire},
                                 {1, f61::minor(1), f61::minor(1), f61::minor(1)}));
        std::size_t b3_wire = circuit.size() - 1;

        // Step 9: Verify sum s = b_0 + b_1 + b_2 is 0 or 1: s * (1 - s) == 0
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {b0_wire, b1_wire, b2_wire}, {1, 1, 1}));  // s
        std::size_t s_wire = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::LINEAR, {ctx.wire_1, s_wire}, {1, f61::minor(1)}));  // 1 - s
        std::size_t one_minus_s = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::MUL, {s_wire, one_minus_s}));  // s * (1 - s)
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // Step 10: Verify position: b_1 + 2*b_2 + 3*b_3 - r == 0
        // Expanding: b_1 + 2*b_2 + 3*(1 - b_0 - b_1 - b_2) - r
        //          = b_1 + 2*b_2 + 3 - 3*b_0 - 3*b_1 - 3*b_2 - r
        //          = 3 - 3*b_0 - 2*b_1 - b_2 - r
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {ctx.wire_1, b0_wire, b1_wire, b2_wire, r_wire},
                                 {3, f61::minor(3), f61::minor(2), f61::minor(1), f61::minor(1)}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // Step 11: Compute new bytes: new_byte_i = a_i + b_i * (v - a_i)
        std::vector<std::size_t> new_byte_wires;
        std::size_t b_wires[4] = {b0_wire, b1_wire, b2_wire, b3_wire};

        for (int i = 0; i < 4; i++) {
            // diff_i = v - a_i
            circuit.push_back(BaseOp(OPTYPE::LINEAR, {v_wire, a_wires[i]}, {1, f61::minor(1)}));
            std::size_t diff_wire = circuit.size() - 1;

            // term_i = b_i * diff_i (using MUL)
            circuit.push_back(BaseOp(OPTYPE::MUL, {b_wires[i], diff_wire}));
            std::size_t term_wire = circuit.size() - 1;

            // new_byte_i = a_i + term_i
            circuit.push_back(BaseOp(OPTYPE::LINEAR, {a_wires[i], term_wire}, {1, 1}));
            new_byte_wires.push_back(circuit.size() - 1);
        }

        // Step 12: Combine: new_word = new_byte_0 + 256*new_byte_1 + 65536*new_byte_2 + 16777216*new_byte_3
        circuit.push_back(BaseOp(OPTYPE::LINEAR,
            {new_byte_wires[0], new_byte_wires[1], new_byte_wires[2], new_byte_wires[3]},
            {1, 1 << 8, 1 << 16, 1 << 24}));
        std::size_t new_word_wire = circuit.size() - 1;

        // Step 13: Store the modified word back to memory
        std::size_t store_wire = emit_and_transform(
            BaseOp(OPTYPE::STORE, {load_addr_wire, new_word_wire}),
            circuit, ctx, registry);

        // Replace the original STOREB op with a dummy LINEAR (produces 0)
        circuit[op_index] = BaseOp(OPTYPE::LINEAR, {store_wire}, {0});
    }

    void execute(std::size_t op_index, const BaseOp& op,
                 std::vector<f61>& wire_val, ExecuteContext& ctx,
                 GateRegistry& registry) override {
        assert(op.wires.size() == 2);

        uint64_t addr = wire_val[op.wires[0]].val;
        uint64_t value = wire_val[op.wires[1]].val;

        // Step 1: Compute byte offset: r = addr % 4
        uint64_t r = addr % 4;
        std::size_t r_wire = alloc_and_execute(
            OPTYPE::MOD4, BaseOp(OPTYPE::MOD4, {op.wires[0]}), f61(r),
            wire_val, ctx, registry);

        // Step 2: LINEAR for load_addr = addr - r
        uint64_t load_addr = addr - r;
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

        // Step 4: Split word into 4 bytes
        uint64_t a[4] = {
            word_val & 0xFF,
            (word_val >> 8) & 0xFF,
            (word_val >> 16) & 0xFF,
            (word_val >> 24) & 0xFF
        };
        set_byte_decomposition_witnesses(word_val, a, wire_val, ctx, registry);

        // Step 5: Extract v = value & 0xFF efficiently
        uint64_t v_high16 = value >> 16;
        uint64_t v_low16 = value & 0xFFFF;
        uint64_t v_byte1 = (value >> 8) & 0xFF;
        uint64_t v = value & 0xFF;

        // v_high16 (ZKSET)
        wire_val[ctx.num_wires++] = f61(v_high16);

        // v_low16 (INPUT)
        wire_val[ctx.num_wires++] = f61(v_low16);

        // checkzero wire
        wire_val[ctx.num_wires++] = f61(0);

        // v_addr (LINEAR)
        uint64_t v_addr = RomOffsets::HIGH8_OFFSET + v_low16;
        wire_val[ctx.num_wires++] = f61(v_addr);

        // LOAD for v_byte1
        alloc_and_execute(
            OPTYPE::LOAD, BaseOp(OPTYPE::LOAD, {ctx.num_wires - 1}), f61(v_byte1),
            wire_val, ctx, registry);

        // v_wire (LINEAR result)
        wire_val[ctx.num_wires++] = f61(v);

        // Step 6: Set bit selectors based on r
        // b_i = 1 if i == r, else 0
        uint64_t b[4] = {0, 0, 0, 0};
        b[r] = 1;

        // b_0 (INPUT)
        std::size_t b0_wire = ctx.num_wires++;
        wire_val[b0_wire] = f61(b[0]);

        // b_1 (INPUT)
        std::size_t b1_wire = ctx.num_wires++;
        wire_val[b1_wire] = f61(b[1]);

        // b_2 (INPUT)
        std::size_t b2_wire = ctx.num_wires++;
        wire_val[b2_wire] = f61(b[2]);

        // Step 7: Verify each b_i is a bit (wires for constraints)
        // For b_0: (1 - b_0), b_0 * (1 - b_0)
        wire_val[ctx.num_wires++] = f61(1 - b[0]);  // 1 - b_0
        wire_val[ctx.num_wires++] = f61(0);         // b_0 * (1 - b_0) = 0

        // For b_1: (1 - b_1), b_1 * (1 - b_1)
        wire_val[ctx.num_wires++] = f61(1 - b[1]);  // 1 - b_1
        wire_val[ctx.num_wires++] = f61(0);         // b_1 * (1 - b_1) = 0

        // For b_2: (1 - b_2), b_2 * (1 - b_2)
        wire_val[ctx.num_wires++] = f61(1 - b[2]);  // 1 - b_2
        wire_val[ctx.num_wires++] = f61(0);         // b_2 * (1 - b_2) = 0

        // Step 8: b_3 = 1 - b_0 - b_1 - b_2
        uint64_t b3 = 1 - b[0] - b[1] - b[2];
        wire_val[ctx.num_wires++] = f61(b3);        // b_3

        // Step 9: s = b_0 + b_1 + b_2, verify s * (1-s) == 0
        uint64_t s_val = b[0] + b[1] + b[2];
        wire_val[ctx.num_wires++] = f61(s_val);     // s
        wire_val[ctx.num_wires++] = f61(1 - s_val); // 1 - s
        wire_val[ctx.num_wires++] = f61(0);         // s * (1 - s) = 0

        // Step 10: Position check (checkzero wire)
        wire_val[ctx.num_wires++] = f61(0);         // 3 - 3*b_0 - 2*b_1 - b_2 - r = 0

        // Step 11: Compute new bytes
        uint64_t new_bytes[4];
        for (int i = 0; i < 4; i++) {
            new_bytes[i] = a[i] + b[i] * (v - a[i]);
            ctx.num_wires += 3;
        }

        // Step 12: new_word
        uint64_t new_word = new_bytes[0] + (new_bytes[1] << 8) + (new_bytes[2] << 16) + (new_bytes[3] << 24);
        wire_val[ctx.num_wires++] = f61(new_word);

        // Step 13: STORE the modified word
        alloc_and_execute(
            OPTYPE::STORE, BaseOp(OPTYPE::STORE, {load_addr_wire, ctx.num_wires - 1}), f61(0),
            wire_val, ctx, registry);

        // STOREB doesn't produce a result
        wire_val[op_index] = f61(0);
    }
};

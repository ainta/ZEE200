#pragma once
#include "base_gate.h"
#include "gate_registry.h"
#include <cassert>

/**
 * ULOADH gate - Unsigned load halfword from memory (selector-based approach)
 *
 * Takes a byte address and loads a 16-bit halfword (zero-extended to 32 bits)
 *
 * Uses selector-based halfword selection:
 * - Split word into 2 halfwords h_0, h_1 using 1 ZKSET
 * - Use 1 bit selector b_0 with b_1 = 1 - b_0
 * - Position: r = 0 means h_0, r = 2 means h_1
 * - Output: b_0*h_0 + b_1*h_1
 * - Uses MUL (not MUL32) for efficiency
 */
class UloadhGate : public BaseGate {
public:
    OPTYPE get_type() const override {
        return OPTYPE::ULOADH;
    }

    std::string get_name() const override {
        return "UloadhGate";
    }

    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& registry) override {
        assert(op.wires.size() == 1);

        std::size_t addr_wire = op.wires[0];

        // Step 1: Compute byte offset using MOD4: r = addr % 4 (should be 0 or 2)
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

        // Step 4: Split word into 2 halfwords using ZKSET
        // word = h_0 + h_1 * 65536
        // h_1 is verified to be in [0, 65535] by ZKSET
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t h1_wire = circuit.size() - 1;
        ctx.set2id.push_back(h1_wire);

        // h_0 = word - h_1 * 65536 (ZKSET to constrain to [0, 65535])
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t h0_wire = circuit.size() - 1;
        ctx.set2id.push_back(h0_wire);

        // Checkzero: word - h_1 * 65536 - h_0 == 0
        circuit.push_back(BaseOp(OPTYPE::LINEAR,
            {word_wire, h1_wire, h0_wire},
            {1, f61::minor(1ULL << 16), f61::minor(1)}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // Step 5: Prover inputs 1 bit selector b_0
        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t b0_wire = circuit.size() - 1;

        // Step 6: Verify b_0 is a bit: b_0 * (1 - b_0) == 0
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {ctx.wire_1, b0_wire}, {1, f61::minor(1)}));  // 1 - b_0
        std::size_t one_minus_b0 = circuit.size() - 1;
        circuit.push_back(BaseOp(OPTYPE::MUL, {b0_wire, one_minus_b0}));  // b_0 * (1 - b_0)
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // Step 7: b_1 = 1 - b_0
        std::size_t b1_wire = one_minus_b0;  // Reuse the wire

        // Step 8: Verify position: 2*b_1 - r == 0
        // When r=0: b_0=1, b_1=0 → 2*0 - 0 = 0 ✓
        // When r=2: b_0=0, b_1=1 → 2*1 - 2 = 0 ✓
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {b1_wire, r_wire}, {2, f61::minor(1)}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // Step 9: Compute output: result = b_0*h_0 + b_1*h_1
        // term_0 = b_0 * h_0
        circuit.push_back(BaseOp(OPTYPE::MUL, {b0_wire, h0_wire}));
        std::size_t term0_wire = circuit.size() - 1;

        // term_1 = b_1 * h_1
        circuit.push_back(BaseOp(OPTYPE::MUL, {b1_wire, h1_wire}));
        std::size_t term1_wire = circuit.size() - 1;

        // result = term_0 + term_1
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {term0_wire, term1_wire}, {1, 1}));
        std::size_t result_wire = circuit.size() - 1;

        // The original op_index wire should hold the result
        circuit[op_index] = BaseOp(OPTYPE::LINEAR, {result_wire}, {1});
    }

    void execute(std::size_t op_index, const BaseOp& op,
                 std::vector<f61>& wire_val, ExecuteContext& ctx,
                 GateRegistry& registry) override {
        assert(op.wires.size() == 1);

        uint64_t addr = wire_val[op.wires[0]].val;

        // Step 1: Compute byte offset: r = addr % 4 (should be 0 or 2)
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

        // Step 4: Split word into 2 halfwords
        uint64_t h0 = word_val & 0xFFFF;
        uint64_t h1 = (word_val >> 16) & 0xFFFF;

        // h_1 (ZKSET)
        wire_val[ctx.num_wires++] = f61(h1);

        // h_0 (INPUT)
        wire_val[ctx.num_wires++] = f61(h0);

        // checkzero wire
        wire_val[ctx.num_wires++] = f61(0);

        // Step 5: Set bit selector based on r
        // r=0 → b_0=1, b_1=0; r=2 → b_0=0, b_1=1
        uint64_t b0 = (r == 0) ? 1 : 0;
        uint64_t b1 = 1 - b0;

        // b_0 (INPUT)
        wire_val[ctx.num_wires++] = f61(b0);

        // Step 6: Verify b_0 is a bit
        // 1 - b_0
        wire_val[ctx.num_wires++] = f61(b1);
        // b_0 * (1 - b_0) = 0
        wire_val[ctx.num_wires++] = f61(0);

        // Step 8: Position check (checkzero wire)
        wire_val[ctx.num_wires++] = f61(0);  // 2*b_1 - r = 0

        // Step 9: Compute output terms
        uint64_t result = (r == 0) ? h0 : h1;

        // term_0 = b_0 * h_0
        wire_val[ctx.num_wires++] = f61(b0 * h0);

        // term_1 = b_1 * h_1
        wire_val[ctx.num_wires++] = f61(b1 * h1);

        // result = term_0 + term_1
        wire_val[ctx.num_wires++] = f61(result);

        // Set the final result at op_index
        wire_val[op_index] = f61(result);
    }
};

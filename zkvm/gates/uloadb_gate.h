#pragma once
#include "and32_gate.h"
#include "gate_registry.h"
#include <cassert>

/**
 * ULOADB gate - Unsigned load byte from memory (selector-based approach)
 *
 * Takes a byte address and loads a single byte (zero-extended to 32 bits)
 *
 * Uses selector-based byte selection to avoid expensive operations:
 * - Prover inputs 3 bit selectors b_0, b_1, b_2
 * - b_3 = 1 - b_0 - b_1 - b_2
 * - Exactly one selector is 1, indicating which byte to load
 * - Output: b_0*a_0 + b_1*a_1 + b_2*a_2 + b_3*a_3
 * - Uses MUL (not MUL32) for efficiency
 */
class UloadbGate : public And32Gate {
public:
    OPTYPE get_type() const override {
        return OPTYPE::ULOADB;
    }

    std::string get_name() const override {
        return "UloadbGate";
    }

    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& registry) override {
        assert(op.wires.size() == 1);

        std::size_t addr_wire = op.wires[0];

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

        // Step 5: Prover inputs 3 bit selectors b_0, b_1, b_2
        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t b0_wire = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t b1_wire = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t b2_wire = circuit.size() - 1;

        // Step 6: Verify each b_i is a bit: b_i * (1 - b_i) == 0
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

        // Step 7: Define b_3 = 1 - b_0 - b_1 - b_2
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {ctx.wire_1, b0_wire, b1_wire, b2_wire},
                                 {1, f61::minor(1), f61::minor(1), f61::minor(1)}));
        std::size_t b3_wire = circuit.size() - 1;

        // Step 8: Verify sum s = b_0 + b_1 + b_2 is 0 or 1: s * (1 - s) == 0
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {b0_wire, b1_wire, b2_wire}, {1, 1, 1}));  // s
        std::size_t s_wire = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::LINEAR, {ctx.wire_1, s_wire}, {1, f61::minor(1)}));  // 1 - s
        std::size_t one_minus_s = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::MUL, {s_wire, one_minus_s}));  // s * (1 - s)
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // Step 9: Verify position: b_1 + 2*b_2 + 3*b_3 - r == 0
        // Expanding: 3 - 3*b_0 - 2*b_1 - b_2 - r == 0
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {ctx.wire_1, b0_wire, b1_wire, b2_wire, r_wire},
                                 {3, f61::minor(3), f61::minor(2), f61::minor(1), f61::minor(1)}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // Step 10: Compute output: result = b_0*a_0 + b_1*a_1 + b_2*a_2 + b_3*a_3
        std::size_t b_wires[4] = {b0_wire, b1_wire, b2_wire, b3_wire};
        std::vector<std::size_t> term_wires;

        for (int i = 0; i < 4; i++) {
            // term_i = b_i * a_i (using MUL)
            circuit.push_back(BaseOp(OPTYPE::MUL, {b_wires[i], a_wires[i]}));
            term_wires.push_back(circuit.size() - 1);
        }

        // result = term_0 + term_1 + term_2 + term_3
        circuit.push_back(BaseOp(OPTYPE::LINEAR,
            {term_wires[0], term_wires[1], term_wires[2], term_wires[3]},
            {1, 1, 1, 1}));
        std::size_t result_wire = circuit.size() - 1;

        // The original op_index wire should hold the result
        circuit[op_index] = BaseOp(OPTYPE::LINEAR, {result_wire}, {1});
    }

    void execute(std::size_t op_index, const BaseOp& op,
                 std::vector<f61>& wire_val, ExecuteContext& ctx,
                 GateRegistry& registry) override {
        assert(op.wires.size() == 1);

        uint64_t addr = wire_val[op.wires[0]].val;

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

        // Step 5: Set bit selectors based on r
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

        // Step 6: Verify each b_i is a bit (wires for constraints)
        // For b_0: (1 - b_0), b_0 * (1 - b_0)
        wire_val[ctx.num_wires++] = f61(1 - b[0]);  // 1 - b_0
        wire_val[ctx.num_wires++] = f61(0);         // b_0 * (1 - b_0) = 0

        // For b_1: (1 - b_1), b_1 * (1 - b_1)
        wire_val[ctx.num_wires++] = f61(1 - b[1]);  // 1 - b_1
        wire_val[ctx.num_wires++] = f61(0);         // b_1 * (1 - b_1) = 0

        // For b_2: (1 - b_2), b_2 * (1 - b_2)
        wire_val[ctx.num_wires++] = f61(1 - b[2]);  // 1 - b_2
        wire_val[ctx.num_wires++] = f61(0);         // b_2 * (1 - b_2) = 0

        // Step 7: b_3 = 1 - b_0 - b_1 - b_2
        uint64_t b3 = 1 - b[0] - b[1] - b[2];
        wire_val[ctx.num_wires++] = f61(b3);        // b_3

        // Step 8: s = b_0 + b_1 + b_2, verify s * (1-s) == 0
        uint64_t s_val = b[0] + b[1] + b[2];
        wire_val[ctx.num_wires++] = f61(s_val);     // s
        wire_val[ctx.num_wires++] = f61(1 - s_val); // 1 - s
        wire_val[ctx.num_wires++] = f61(0);         // s * (1 - s) = 0

        // Step 9: Position check (checkzero wire)
        wire_val[ctx.num_wires++] = f61(0);         // 3 - 3*b_0 - 2*b_1 - b_2 - r = 0

        // Step 10: Compute output terms: b_i * a_i
        uint64_t result = a[r];  // The selected byte
        for (int i = 0; i < 4; i++) {
            wire_val[ctx.num_wires++] = f61(b[i] * a[i]);  // term_i = b_i * a_i
        }

        // result = sum of terms
        wire_val[ctx.num_wires++] = f61(result);

        // Set the final result at op_index
        wire_val[op_index] = f61(result);
    }
};

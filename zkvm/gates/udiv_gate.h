#pragma once
#include "base_gate.h"
#include <cassert>

/**
 * 32-bit unsigned division gate
 * Computes c = floor(a / b) and remainder d = a - b*c, with 0 <= d < b.
 *
 * Field is assumed to be p = 2^61 - 1. We add the limb constraint b16*c16 = 0
 * to ensure b*c < 2^61 (avoid wraparound), so the field equality matches integers.
 *
 * Constraints:
 *  - Decompose b = b0 + b16*2^16          (b0,b16 via ZKSET, 16-bit each)
 *  - Decompose c = c0 + c16*2^16          (output wire = c)
 *  - Decompose d = d0 + d16*2^16          (materialize d wire)
 *  - Limb product: z = b16 * c16 = 0      (avoid wraparound of b*c)
 *  - Main eq: a - b*c - d = 0
 *  - Let e = b - d - 1, decompose e = e0 + e16*2^16  (range check ⇒ d < b, b > 0)
 */
class UdivGate : public BaseGate {
public:
    OPTYPE get_type() const override {
        return OPTYPE::UDIV;
    }

    std::string get_name() const override {
        return "UdivGate";
    }

    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& /*registry*/) override {
        assert(op.wires.size() == 2);
        std::size_t a_id = op.wires[0];
        std::size_t b_id = op.wires[1];

        // --- b decomposition: b = b0 + b16*2^16 ---
        circuit.push_back(BaseOp(OPTYPE::ZKSET)); // b0
        std::size_t b0_id = circuit.size() - 1;
        ctx.set2id.push_back(b0_id);

        circuit.push_back(BaseOp(OPTYPE::ZKSET)); // b16
        std::size_t b16_id = circuit.size() - 1;
        ctx.set2id.push_back(b16_id);

        // b - b0 - 2^16*b16 = 0
        circuit.push_back(BaseOp(
            OPTYPE::LINEAR,
            {b_id, b0_id, b16_id},
            {1, f61::minor(1), f61::minor((1 << 16))}
        ));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // --- c decomposition: c = c0 + c16*2^16 (c is the gate output at op_index) ---
        circuit.push_back(BaseOp(OPTYPE::ZKSET)); // c0
        std::size_t c0_id = circuit.size() - 1;
        ctx.set2id.push_back(c0_id);

        circuit.push_back(BaseOp(OPTYPE::ZKSET)); // c16
        std::size_t c16_id = circuit.size() - 1;
        ctx.set2id.push_back(c16_id);

        // Write output wire as linear combo of c-limbs
        circuit[op_index] = BaseOp(OPTYPE::LINEAR, {c0_id, c16_id}, {1, (1 << 16)});

        // --- d decomposition: materialize d = d0 + d16*2^16 ---
        circuit.push_back(BaseOp(OPTYPE::ZKSET)); // d0
        std::size_t d0_id = circuit.size() - 1;
        ctx.set2id.push_back(d0_id);

        circuit.push_back(BaseOp(OPTYPE::ZKSET)); // d16
        std::size_t d16_id = circuit.size() - 1;
        ctx.set2id.push_back(d16_id);

        // d value wire
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {d0_id, d16_id}, {1, (1 << 16)}));
        std::size_t d_id = circuit.size() - 1;

        // --- Avoid wraparound: z = b16 * c16 must be 0 ---
        circuit.push_back(BaseOp(OPTYPE::MUL, {b16_id, c16_id}));
        std::size_t z_id = circuit.size() - 1;
        ctx.checkzero_wires.push_back(z_id); // enforce z == 0

        // --- Main equation: a - (b*c) - d = 0 ---
        // t = b * c
        circuit.push_back(BaseOp(OPTYPE::MUL, {b_id, op_index}));
        std::size_t t_id = circuit.size() - 1;

        // a - t - d = 0
        circuit.push_back(BaseOp(
            OPTYPE::LINEAR,
            {a_id, t_id, d_id},
            {1, f61::minor(1), f61::minor(1)}
        ));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // --- Enforce d < b and b > 0 via e = b - d - 1 in [0, 2^32-1] ---
        // e = b - d - 1
        circuit.push_back(BaseOp(
            OPTYPE::LINEAR,
            {b_id, d_id, ctx.wire_1},
            {1, f61::minor(1), f61::minor(1)}
        ));
        std::size_t e_id = circuit.size() - 1;

        // Decompose e: e = e0 + e16*2^16
        circuit.push_back(BaseOp(OPTYPE::ZKSET)); // e0
        std::size_t e0_id = circuit.size() - 1;
        ctx.set2id.push_back(e0_id);

        circuit.push_back(BaseOp(OPTYPE::ZKSET)); // e16
        std::size_t e16_id = circuit.size() - 1;
        ctx.set2id.push_back(e16_id);

        // e - e0 - 2^16*e16 = 0
        circuit.push_back(BaseOp(
            OPTYPE::LINEAR,
            {e_id, e0_id, e16_id},
            {1, f61::minor(1), f61::minor((1 << 16))}
        ));
        ctx.checkzero_wires.push_back(circuit.size() - 1);
    }

    void execute(std::size_t op_index, const BaseOp& op,
                 std::vector<f61>& wire_val, ExecuteContext& ctx,
                 GateRegistry& /*registry*/) override {
        assert(op.wires.size() == 2);

        uint64_t a = wire_val[op.wires[0]].val;
        uint64_t b = wire_val[op.wires[1]].val;

        // Inputs are 32-bit unsigned; also require b > 0 to define division
        assert(a < (1ULL << 32));
        assert(b < (1ULL << 32));
        assert(b != 0);

        // Compute quotient and remainder
        uint64_t c = a / b;
        uint64_t d = a - b * c;
        uint64_t e = b - d - 1; // must be in [0 .. 2^32-1]

        // --- Witness assignment mirrors transform order ---

        // b0, b16
        wire_val[ctx.num_wires++] = (b & 0xFFFFULL);
        wire_val[ctx.num_wires++] = ((b >> 16) & 0xFFFFULL);
        ctx.num_wires++; // skip (b - b0 - 2^16*b16) check wire

        // c0, c16
        wire_val[ctx.num_wires++] = (c & 0xFFFFULL);
        wire_val[ctx.num_wires++] = ((c >> 16) & 0xFFFFULL);

        // d0, d16, d
        wire_val[ctx.num_wires++] = (d & 0xFFFFULL);
        wire_val[ctx.num_wires++] = ((d >> 16) & 0xFFFFULL);
        wire_val[ctx.num_wires++] = d;

        // z = b16*c16   (constraint wire; we skip writing and just advance)
        ctx.num_wires++;

        // t = b*c       (constraint helper; skip assign)
        ctx.num_wires++;
        // a - t - d == 0 (check wire)
        ctx.num_wires++;

        // e = b - d - 1
        wire_val[ctx.num_wires++] = e;

        // e0, e16
        wire_val[ctx.num_wires++] = (e & 0xFFFFULL);
        wire_val[ctx.num_wires++] = ((e >> 16) & 0xFFFFULL);
        // (e - e0 - 2^16*e16) check wire
        ctx.num_wires++;

        // Output quotient
        wire_val[op_index] = c;
    }
};

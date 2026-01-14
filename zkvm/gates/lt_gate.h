#pragma once
#include "base_gate.h"
#include <cassert>

/**
 * 32-bit signed less-than gate
 * LT a b c
 *   c = 1 if (int32_t)a < (int32_t)b, else 0
 *
 * Implementation: Convert signed to unsigned comparison by adding 0x80000000
 * This flips the sign bit, making signed comparison equivalent to unsigned comparison
 */
class LtGate : public BaseGate {
public:
    OPTYPE get_type() const override { return OPTYPE::LT; }
    std::string get_name() const override { return "LtGate"; }

    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& /*registry*/) override {
        assert(op.wires.size() == 2);
        std::size_t a_id = op.wires[0];
        std::size_t b_id = op.wires[1];

        static const uint64_t SIGN_BIT = 0x80000000ULL;

        // --- Compute a_unsigned = (a + 0x80000000) mod 2^32 ---
        // Decompose a_unsigned = a_u0 + a_u16 * 2^16
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t a_u0_id = circuit.size()-1;
        ctx.set2id.push_back(a_u0_id);

        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t a_u16_id = circuit.size()-1;
        ctx.set2id.push_back(a_u16_id);

        circuit.push_back(BaseOp(OPTYPE::LINEAR, {a_u0_id, a_u16_id}, {1, 1<<16}));
        std::size_t a_unsigned = circuit.size()-1;

        // Overflow bit for a + SIGN_BIT
        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t o_a_id = circuit.size()-1;

        // Constraint: a + SIGN_BIT - a_unsigned - o_a*2^32 = 0
        circuit.push_back(BaseOp(OPTYPE::LINEAR,
            {a_id, ctx.wire_1, a_unsigned, o_a_id},
            {1, f61(SIGN_BIT), f61::minor(1), f61::minor(1ULL<<32)}));
        ctx.checkzero_wires.push_back(circuit.size()-1);

        // o_a is boolean: o_a*(1-o_a) = 0
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {o_a_id, ctx.wire_1}, {f61::minor(1), 1}));
        std::size_t one_minus_o_a = circuit.size()-1;
        circuit.push_back(BaseOp(OPTYPE::MUL, {o_a_id, one_minus_o_a}));
        ctx.checkzero_wires.push_back(circuit.size()-1);

        // --- Compute b_unsigned = (b + 0x80000000) mod 2^32 ---
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t b_u0_id = circuit.size()-1;
        ctx.set2id.push_back(b_u0_id);

        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t b_u16_id = circuit.size()-1;
        ctx.set2id.push_back(b_u16_id);

        circuit.push_back(BaseOp(OPTYPE::LINEAR, {b_u0_id, b_u16_id}, {1, 1<<16}));
        std::size_t b_unsigned = circuit.size()-1;

        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t o_b_id = circuit.size()-1;

        circuit.push_back(BaseOp(OPTYPE::LINEAR,
            {b_id, ctx.wire_1, b_unsigned, o_b_id},
            {1, f61(SIGN_BIT), f61::minor(1), f61::minor(1ULL<<32)}));
        ctx.checkzero_wires.push_back(circuit.size()-1);

        circuit.push_back(BaseOp(OPTYPE::LINEAR, {o_b_id, ctx.wire_1}, {f61::minor(1), 1}));
        std::size_t one_minus_o_b = circuit.size()-1;
        circuit.push_back(BaseOp(OPTYPE::MUL, {o_b_id, one_minus_o_b}));
        ctx.checkzero_wires.push_back(circuit.size()-1);

        // --- Now perform unsigned comparison: ULT(a_unsigned, b_unsigned) ---
        // Output c is a boolean
        circuit[op_index] = BaseOp(OPTYPE::INPUT);
        std::size_t c_id = op_index;

        // Boolean c: c*(1-c)=0
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {op_index, ctx.wire_1}, {f61::minor(1), 1}));
        std::size_t one_minus_c = circuit.size() - 1;
        circuit.push_back(BaseOp(OPTYPE::MUL, {op_index, one_minus_c}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // d = b_unsigned - a_unsigned - 1 (valid iff a_unsigned < b_unsigned)
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {b_unsigned, a_unsigned, ctx.wire_1},
                                 {1, f61::minor(1), f61::minor(1)}));
        std::size_t d_id = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::ZKSET)); std::size_t d0_id = circuit.size() - 1; ctx.set2id.push_back(d0_id);
        circuit.push_back(BaseOp(OPTYPE::ZKSET)); std::size_t d16_id = circuit.size() - 1; ctx.set2id.push_back(d16_id);

        circuit.push_back(BaseOp(OPTYPE::LINEAR, {d_id, d0_id, d16_id},
                                 {1, f61::minor(1), f61::minor((1<<16))}));
        std::size_t diff_d = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::MUL, {op_index, diff_d}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // e = a_unsigned - b_unsigned (valid iff a_unsigned >= b_unsigned)
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {a_unsigned, b_unsigned}, {1, f61::minor(1)}));
        std::size_t e_id = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::ZKSET)); std::size_t e0_id = circuit.size() - 1; ctx.set2id.push_back(e0_id);
        circuit.push_back(BaseOp(OPTYPE::ZKSET)); std::size_t e16_id = circuit.size() - 1; ctx.set2id.push_back(e16_id);

        circuit.push_back(BaseOp(OPTYPE::LINEAR, {e_id, e0_id, e16_id},
                                 {1, f61::minor(1), f61::minor((1<<16))}));
        std::size_t diff_e = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::MUL, {one_minus_c, diff_e}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);
    }

    void execute(std::size_t op_index, const BaseOp& op,
                std::vector<f61>& wire_val, ExecuteContext& ctx,
                GateRegistry& /*registry*/) override {
        assert(op.wires.size() == 2);
        uint64_t a = wire_val[op.wires[0]].val;
        uint64_t b = wire_val[op.wires[1]].val;
        assert(a < (1ULL << 32));
        assert(b < (1ULL << 32));

        static const uint64_t SIGN_BIT = 0x80000000ULL;

        // Convert to signed for comparison
        int32_t a_signed = static_cast<int32_t>(static_cast<uint32_t>(a));
        int32_t b_signed = static_cast<int32_t>(static_cast<uint32_t>(b));

        // Compute unsigned versions
        uint64_t a_plus = a + SIGN_BIT;
        uint64_t a_unsigned = a_plus & 0xFFFFFFFFULL;
        uint64_t o_a = a_plus >> 32;

        uint64_t b_plus = b + SIGN_BIT;
        uint64_t b_unsigned = b_plus & 0xFFFFFFFFULL;
        uint64_t o_b = b_plus >> 32;

        // Comparison result
        uint64_t c = (a_signed < b_signed) ? 1ULL : 0ULL;
        uint64_t d = (b_unsigned - a_unsigned - 1);
        uint64_t e = a_unsigned - b_unsigned;

        // --- Witness assignment mirrors transform order ---

        // a_unsigned decomposition
        wire_val[ctx.num_wires++] = (a_unsigned & 0xFFFF);
        wire_val[ctx.num_wires++] = ((a_unsigned >> 16) & 0xFFFF);
        ctx.num_wires++;  // a_unsigned wire (LINEAR)
        wire_val[ctx.num_wires++] = o_a;
        ctx.num_wires++;  // constraint wire
        ctx.num_wires++;  // one_minus_o_a
        ctx.num_wires++;  // boolean constraint

        // b_unsigned decomposition
        wire_val[ctx.num_wires++] = (b_unsigned & 0xFFFF);
        wire_val[ctx.num_wires++] = ((b_unsigned >> 16) & 0xFFFF);
        ctx.num_wires++;  // b_unsigned wire (LINEAR)
        wire_val[ctx.num_wires++] = o_b;
        ctx.num_wires++;  // constraint wire
        ctx.num_wires++;  // one_minus_o_b
        ctx.num_wires++;  // boolean constraint

        // Output c
        wire_val[op_index] = c;

        // one_minus_c
        ctx.num_wires++;
        ctx.num_wires++;  // boolean constraint

        // d = b_unsigned - a_unsigned - 1
        ctx.num_wires++;
        wire_val[ctx.num_wires++] = (d & 0xFFFF);
        wire_val[ctx.num_wires++] = ((d >> 16) & 0xFFFF);
        ctx.num_wires++;  // diff_d
        ctx.num_wires++;  // c * diff_d constraint

        // e = a_unsigned - b_unsigned
        ctx.num_wires++;
        wire_val[ctx.num_wires++] = (e & 0xFFFF);
        wire_val[ctx.num_wires++] = ((e >> 16) & 0xFFFF);
        ctx.num_wires++;  // diff_e
        ctx.num_wires++;  // (1-c) * diff_e constraint
    }
};

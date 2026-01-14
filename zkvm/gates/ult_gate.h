#pragma once
#include "base_gate.h"
#include <cassert>

/**
 * 32-bit unsigned less-than gate
 * ULT a b c
 *   c = 1 if a < b, else 0.
 */
class UltGate : public BaseGate {
public:
    OPTYPE get_type() const override { return OPTYPE::ULT; }
    std::string get_name() const override { return "UltGate"; }

    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& /*registry*/) override {
            assert(op.wires.size() == 2);
            std::size_t a_id = op.wires[0];
            std::size_t b_id = op.wires[1];

            // Output c is a boolean
            circuit[op_index] = BaseOp(OPTYPE::INPUT);
            std::size_t c_id = op_index;

            // Boolean c: c*(1-c)=0
            circuit.push_back(BaseOp(OPTYPE::LINEAR, {op_index, ctx.wire_1}, {f61::minor(1), 1}));
            std::size_t one_minus_c = circuit.size() - 1;
            circuit.push_back(BaseOp(OPTYPE::MUL, {op_index, one_minus_c}));
            ctx.checkzero_wires.push_back(circuit.size() - 1);

            // d = b - a - 1     (valid iff a < b)
            circuit.push_back(BaseOp(OPTYPE::LINEAR, {b_id, a_id, ctx.wire_1}, {1, f61::minor(1), f61::minor(1)}));
            std::size_t d_id = circuit.size() - 1;
            // d limbs
            circuit.push_back(BaseOp(OPTYPE::ZKSET)); std::size_t d0_id = circuit.size() - 1; ctx.set2id.push_back(d0_id);
            circuit.push_back(BaseOp(OPTYPE::ZKSET)); std::size_t d16_id = circuit.size() - 1; ctx.set2id.push_back(d16_id);
            // diff_d = d - d0 - 2^16*d16
            circuit.push_back(BaseOp(OPTYPE::LINEAR, {d_id, d0_id, d16_id}, {1, f61::minor(1), f61::minor((1<<16))}));
            std::size_t diff_d = circuit.size() - 1;
            // gate: c * diff_d = 0
            circuit.push_back(BaseOp(OPTYPE::MUL, {op_index, diff_d}));
            ctx.checkzero_wires.push_back(circuit.size() - 1);

            // e = a - b         (valid iff a >= b)
            circuit.push_back(BaseOp(OPTYPE::LINEAR, {a_id, b_id}, {1, f61::minor(1)}));
            std::size_t e_id = circuit.size() - 1;
            // e limbs
            circuit.push_back(BaseOp(OPTYPE::ZKSET)); std::size_t e0_id = circuit.size() - 1; ctx.set2id.push_back(e0_id);
            circuit.push_back(BaseOp(OPTYPE::ZKSET)); std::size_t e16_id = circuit.size() - 1; ctx.set2id.push_back(e16_id);
            // diff_e = e - e0 - 2^16*e16
            circuit.push_back(BaseOp(OPTYPE::LINEAR, {e_id, e0_id, e16_id}, {1, f61::minor(1), f61::minor((1<<16))}));
            std::size_t diff_e = circuit.size() - 1;
            // (1-c) * diff_e = 0
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

        // Compute c, d = b - a - 1, e = a - b (all as unsigned 64)
        uint64_t c = (a < b) ? 1ULL : 0ULL;
        uint64_t d = (b - a - 1);
        uint64_t e = a-b;

        // Output c
        wire_val[op_index] = c;

        // one_minus_c
        ctx.num_wires++;
        // MUL(c, one_minus_c) check -> skip storing (constraint wire)
        ctx.num_wires++;

        // --- d = b - a - 1 ---
        ctx.num_wires++;

        // d0, d16 limbs (always set to 32-bit decomposition witnesses)
        wire_val[ctx.num_wires++] = (d & 0xFFFFULL);               // d0
        wire_val[ctx.num_wires++] = ((d >> 16) & 0xFFFFULL);       // d16

        // diff_d = d - d0 - 2^16*d16
        ctx.num_wires++;

        // MUL(c, diff_d) -> skip storing (constraint wire)
        ctx.num_wires++;

        // --- e = a - b ---
        ctx.num_wires++;

        // e0, e16 limbs (32-bit decomposition witnesses)
        wire_val[ctx.num_wires++] = (e & 0xFFFFULL);               // e0
        wire_val[ctx.num_wires++] = ((e >> 16) & 0xFFFFULL);       // e16

        // diff_e = e - e0 - 2^16*e16
        ctx.num_wires++;


        // MUL(one_minus_c2, diff_e) -> skip storing (constraint wire)
        ctx.num_wires++;
    }

};
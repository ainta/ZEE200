#pragma once
#include "base_gate.h"
#include <cassert>

/**
 * 32-bit most significant bit gate
 * MSB a b
 *   b = 1 if a >= 2^31, else 0.
 **/
class MsbGate : public BaseGate {
public:
    OPTYPE get_type() const override { return OPTYPE::MSB; }
    std::string get_name() const override { return "MsbGate"; }

    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& /*registry*/) override {
            assert(op.wires.size() == 1);
            std::size_t a_id = op.wires[0];

            // Output c is a boolean
            circuit[op_index] = BaseOp(OPTYPE::INPUT);
            std::size_t c_id = op_index;

            // Boolean c: c*(1-c)=0
            circuit.push_back(BaseOp(OPTYPE::LINEAR, {op_index, ctx.wire_1}, {f61::minor(1), 1}));
            std::size_t one_minus_c = circuit.size() - 1;
            circuit.push_back(BaseOp(OPTYPE::MUL, {op_index, one_minus_c}));
            ctx.checkzero_wires.push_back(circuit.size() - 1);

            // a16 is in [0, 2^16)
            circuit.push_back(BaseOp(OPTYPE::ZKSET)); std::size_t a16_id = circuit.size() - 1; ctx.set2id.push_back(a16_id);

            // a0 is in [0, 2^16)
            circuit.push_back(BaseOp(OPTYPE::ZKSET)); std::size_t a0_id = circuit.size() - 1; ctx.set2id.push_back(a0_id);

            // diff_a = 2*a - a0 - 2^16*a16 - 2^32*c
            circuit.push_back(BaseOp(OPTYPE::LINEAR, {a_id, a0_id, a16_id, c_id}, {2, f61::minor(1), f61::minor(1ULL<<16), f61::minor(1ULL<<32)}));
            std::size_t diff_a = circuit.size() - 1;
            ctx.checkzero_wires.push_back(diff_a);
    }

    void execute(std::size_t op_index, const BaseOp& op,
                std::vector<f61>& wire_val, ExecuteContext& ctx,
                GateRegistry& /*registry*/) override {
        assert(op.wires.size() == 1);
        uint64_t a = wire_val[op.wires[0]].val;
        assert(a < (1ULL << 32));

        // Decompose 'a' based on the constraint: 2*a - a0 - 2^16*a16 - 2^32*c = 0
        uint64_t a_double = 2*a;
        uint64_t c = (a_double >> 32) & 1;
        uint64_t rem = a_double - (c << 32);
        uint64_t a16 = rem >> 16;
        uint64_t a0 = rem & ((1 << 16) - 1);

        // Set the output value on the original operation's wire index
        wire_val[op_index] = c;

        // Skip the two wires created for the boolean check (1-c and c*(1-c))
        ctx.num_wires += 2;

        // Set the witness values for a16, a0
        // These are the next three wires created in the transform function
        std::size_t a16_id = ctx.num_wires++;
        wire_val[a16_id] = a16;

        std::size_t a0_id = ctx.num_wires++;
        wire_val[a0_id] = a0;

        // Skip the final constraint wire (diff_a)
        ctx.num_wires++;
    }

};
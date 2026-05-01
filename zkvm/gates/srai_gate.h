#pragma once
#include "base_gate.h"
#include <cassert>

/**
 * Shift right arithmetic immediate gate.
 *
 * SRAI a imm result
 *   result = (int32_t)a >> imm
 */
class SraiGate : public BaseGate {
public:
    OPTYPE get_type() const override { return OPTYPE::SRAI; }
    std::string get_name() const override { return "SraiGate"; }

    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& registry) override {
        assert(op.wires.size() == 1);
        std::size_t a_id = op.wires[0];
        int64_t shift_amount = op.imm;

        assert(shift_amount >= 0 && shift_amount < 32);

        if (shift_amount == 0) {
            circuit[op_index] = BaseOp(OPTYPE::LINEAR, {a_id}, {1});
            return;
        }

        BaseOp logical_shift(OPTYPE::SRLI, {a_id});
        logical_shift.imm = shift_amount;
        std::size_t logical_id = emit_and_transform(logical_shift, circuit, ctx, registry);

        // Extract and constrain the sign bit from a without multiplying by 2^k.
        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t sign_bit_id = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::LINEAR, {sign_bit_id, ctx.wire_1},
                                {f61::minor(1), 1}));
        std::size_t one_minus_sign_id = circuit.size() - 1;
        circuit.push_back(BaseOp(OPTYPE::MUL, {sign_bit_id, one_minus_sign_id}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t a_lower_id = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t a_l0_id = circuit.size() - 1;
        ctx.set2id.push_back(a_l0_id);

        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t a_l15_id = circuit.size() - 1;
        ctx.set2id.push_back(a_l15_id);

        circuit.push_back(BaseOp(OPTYPE::LINEAR, {a_lower_id, a_l0_id, a_l15_id},
                                {1, f61::minor(1), f61::minor(1 << 15)}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t a_l0_scaled_id = circuit.size() - 1;
        ctx.set2id.push_back(a_l0_scaled_id);

        circuit.push_back(BaseOp(OPTYPE::LINEAR, {a_l0_id, a_l0_scaled_id},
                                {f61::minor(1 << 1), 1}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        circuit.push_back(BaseOp(OPTYPE::LINEAR, {a_id, a_lower_id, sign_bit_id},
                                {1, f61::minor(1), f61::minor(1ULL << 31)}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        uint64_t sign_extension = ((1ULL << shift_amount) - 1) << (32 - shift_amount);
        circuit[op_index] = BaseOp(OPTYPE::LINEAR, {logical_id, sign_bit_id},
                                   {1, f61(sign_extension)});
    }

    void execute(std::size_t op_index, const BaseOp& op,
                 std::vector<f61>& wire_val, ExecuteContext& ctx,
                 GateRegistry& registry) override {
        assert(op.wires.size() == 1);
        uint64_t a = wire_val[op.wires[0]].val;
        int64_t shift_amount = op.imm;

        assert(shift_amount >= 0 && shift_amount < 32);
        assert(a < (1ULL << 32));

        int32_t a_signed = static_cast<int32_t>(a);
        uint32_t result = static_cast<uint32_t>(a_signed >> shift_amount);
        wire_val[op_index] = result;

        if (shift_amount == 0) {
            return;
        }

        BaseOp logical_shift(OPTYPE::SRLI, {op.wires[0]});
        logical_shift.imm = shift_amount;
        alloc_and_execute(OPTYPE::SRLI, logical_shift, f61(a >> shift_amount),
                          wire_val, ctx, registry);

        uint64_t sign_bit = (a >> 31) & 1;
        uint64_t a_lower = a & 0x7FFFFFFFULL;
        uint64_t a_l0 = a_lower & ((1 << 15) - 1);
        uint64_t a_l15 = a_lower >> 15;

        std::size_t sign_bit_id = ctx.num_wires++;
        wire_val[sign_bit_id] = sign_bit;
        ctx.num_wires++; // one_minus_sign
        ctx.num_wires++; // boolean constraint

        std::size_t a_lower_id = ctx.num_wires++;
        wire_val[a_lower_id] = a_lower;
        wire_val[ctx.num_wires++] = a_l0;
        wire_val[ctx.num_wires++] = a_l15;
        ctx.num_wires++; // a_lower decomposition constraint
        wire_val[ctx.num_wires++] = a_l0 << 1;
        ctx.num_wires++; // a_l0 range check constraint
        ctx.num_wires++; // a = a_lower + sign_bit * 2^31
    }
};

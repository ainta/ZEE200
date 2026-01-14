#pragma once
#include "base_gate.h"
#include <cassert>

/**
 * 32-bit shift right logical bit gate
 * SRLI a b
 * b = a >> imm
 **/
class SrliGate : public BaseGate {
public:
    OPTYPE get_type() const override { return OPTYPE::SRLI; }
    std::string get_name() const override { return "SrliGate"; }

    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& /*registry*/) override {
        assert(op.wires.size() == 1);
        assert(op.imm < 32 && op.imm >= 0);
        
        if (op.imm == 0) {
            circuit[op_index] = BaseOp(OPTYPE::LINEAR, {op.wires[0]}, {1});
            return;
        }
        if (op.imm == 16) {
            transform_16(op_index, op, circuit, ctx);
            return;
        }
        if (op.imm < 16) {
            transform_low_imm(op_index, op, circuit, ctx);
            return;
        }
        if (op.imm > 16) {
            transform_high_imm(op_index, op, circuit, ctx);
            return;
        }
    }

    void execute(std::size_t op_index, const BaseOp& op,
                std::vector<f61>& wire_val, ExecuteContext& ctx,
                GateRegistry& /*registry*/) override {
        assert(op.wires.size() == 1);
        assert(op.imm < 32 && op.imm >= 0);

        // The final result is always set here, regardless of the path taken.
        wire_val[op_index] = wire_val[op.wires[0]].val >> op.imm;

        if (op.imm == 0) {
            return;
        }
        if (op.imm == 16) {
            execute_16(op_index, op, wire_val, ctx);
            return;
        }
        if (op.imm < 16) {
            execute_low_imm(op_index, op, wire_val, ctx);
            return;
        }
        if (op.imm > 16) {
            execute_high_imm(op_index, op, wire_val, ctx);
            return;
        }
    }

    void transform_16(std::size_t op_index, const BaseOp& op,
                      std::vector<BaseOp>& circuit, GateContext& ctx) {
        std::size_t a_id = op.wires[0];
        //a0
        circuit.push_back(BaseOp(OPTYPE::ZKSET)); std::size_t a0_id = circuit.size() - 1; ctx.set2id.push_back(a0_id);
        //a16 will be the output
        circuit[op_index] = BaseOp(OPTYPE::ZKSET); std::size_t a16_id = op_index; ctx.set2id.push_back(a16_id);

        //a - a0 - 2^16*a16 == 0
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {a_id, a0_id, a16_id}, {1, f61::minor(1), f61::minor(1<<16)}));
        std::size_t diff_a = circuit.size() - 1;
        ctx.checkzero_wires.push_back(diff_a);
    }

    void execute_16(std::size_t op_index, const BaseOp op,
                    std::vector<f61>& wire_val, ExecuteContext& ctx) {
        uint64_t a = wire_val[op.wires[0]].val;
        uint64_t a0 = a & 0xFFFF; // Lower 16 bits
        
        // Set witness for a0
        std::size_t a0_id = ctx.num_wires++;
        wire_val[a0_id] = a0;

        // Skip the checkzero wire
        ctx.num_wires++;
    }

    void transform_low_imm(std::size_t op_index, const BaseOp op,
                           std::vector<BaseOp>& circuit, GateContext& ctx) {
        std::size_t a_id = op.wires[0];
        //a_lo
        circuit.push_back(BaseOp(OPTYPE::ZKSET)); std::size_t a_lo_id = circuit.size() - 1; ctx.set2id.push_back(a_lo_id);
        //a_med
        circuit.push_back(BaseOp(OPTYPE::ZKSET)); std::size_t a_med_id = circuit.size() - 1; ctx.set2id.push_back(a_med_id);
        //a_hi
        circuit.push_back(BaseOp(OPTYPE::ZKSET)); std::size_t a_hi_id = circuit.size() - 1; ctx.set2id.push_back(a_hi_id);
        //a << (16-imm) - a_lo - 2^16*a_med - 2^32*a_hi == 0
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {a_id, a_lo_id, a_med_id, a_hi_id}, {1 << (16 - op.imm), f61::minor(1), f61::minor(1<<16), f61::minor(1ULL<<32)}));
        std::size_t diff_a = circuit.size() - 1;
        ctx.checkzero_wires.push_back(diff_a);

        //output = a_med + a_hi * 2^16
        circuit[op_index] = BaseOp(OPTYPE::LINEAR, {a_med_id, a_hi_id}, {1, (1<<16)});
    }

    void execute_low_imm(std::size_t op_index, const BaseOp& op,
                         std::vector<f61>& wire_val, ExecuteContext& ctx) {
        uint64_t a = wire_val[op.wires[0]].val;
        uint64_t imm = op.imm;

        uint64_t a_shifted = a << (16 - imm);

        uint64_t a_lo = a_shifted & ((1ULL << 16) - 1);
        uint64_t a_med = (a_shifted >> 16) & ((1ULL << 16) - 1);
        uint64_t a_hi = a_shifted >> 32;

        // Set witnesses for a_lo, a_med, a_hi
        std::size_t a_lo_id = ctx.num_wires++;
        wire_val[a_lo_id] = a_lo;
        std::size_t a_med_id = ctx.num_wires++;
        wire_val[a_med_id] = a_med;
        std::size_t a_hi_id = ctx.num_wires++;
        wire_val[a_hi_id] = a_hi;

        // Skip checkzero wire for 'a' decomposition
        ctx.num_wires++;

        // Set result
        wire_val[op_index] = (a >> imm);
    }

    void transform_high_imm(std::size_t op_index, const BaseOp& op,
                            std::vector<BaseOp>& circuit, GateContext& ctx) {
        std::size_t a_id = op.wires[0];
        //a_lo
        circuit.push_back(BaseOp(OPTYPE::ZKSET)); std::size_t a_lo_id = circuit.size() - 1; ctx.set2id.push_back(a_lo_id);
        //a_med
        circuit.push_back(BaseOp(OPTYPE::ZKSET)); std::size_t a_med_id = circuit.size() - 1; ctx.set2id.push_back(a_med_id);
        //a_hi will be the output
        circuit[op_index] = BaseOp(OPTYPE::ZKSET); std::size_t a_hi_id = op_index; ctx.set2id.push_back(a_hi_id);
        
        // a << (32-imm) - a_lo - 2^16*a_med - 2^32*a_hi == 0
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {a_id, a_lo_id, a_med_id, a_hi_id}, {1 << (32 - op.imm), f61::minor(1), f61::minor(1<<16), f61::minor(1ULL<<32)}));
        std::size_t diff_a = circuit.size() - 1;
        ctx.checkzero_wires.push_back(diff_a);
    }

    void execute_high_imm(std::size_t op_index, const BaseOp& op,
                          std::vector<f61>& wire_val, ExecuteContext& ctx) {
        uint64_t a = wire_val[op.wires[0]].val;
        uint64_t imm = op.imm;

        uint64_t a_shifted = a << (32 - imm);

        uint64_t a_lo = a_shifted & ((1ULL << 16) - 1);
        uint64_t a_med = (a_shifted >> 16) & ((1ULL << 16) - 1);
        uint64_t a_hi = a_shifted >> 32;

        // Set witnesses for a_lo and a_med
        std::size_t a_lo_id = ctx.num_wires++;
        wire_val[a_lo_id] = a_lo;
        std::size_t a_med_id = ctx.num_wires++;
        wire_val[a_med_id] = a_med;

        // Skip checkzero wire for 'a' decomposition
        ctx.num_wires++;

        // Set result
        wire_val[op_index] = (a >> imm);
    }
};

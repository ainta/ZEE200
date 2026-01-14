#pragma once
#include "base_gate.h"
#include "../rom_offsets.h"
#include <cassert>

/**
 * POW2 gate implementation
 * Computes 2^x by ROM lookup at BYTE_SHIFT_POW2_OFFSET + x
 * Input x should be an integer between 0 and 31
 */
class Pow2Gate : public BaseGate {
public:
    OPTYPE get_type() const override { 
        return OPTYPE::POW2; 
    }
    
    std::string get_name() const override { 
        return "PowGate"; 
    }
    
    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& registry) override {
        assert(op.wires.size() == 1);

        std::size_t x_wire = op.wires[0];
        // Compute idx = POW2_OFFSET + x (word address in RAM)
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {x_wire, ctx.wire_1},
                                 {1, RomOffsets::POW2_OFFSET}));
        std::size_t idx_id = circuit.size() - 1;

        // using re
        std::size_t val_id = emit_and_transform(
            BaseOp(OPTYPE::LOAD, {idx_id}),
            circuit, ctx, registry);
        circuit[op_index] = BaseOp(OPTYPE::LINEAR, {val_id}, {1});

    }
    
    void execute(std::size_t op_index, const BaseOp& op,
                 std::vector<f61>& wire_val, ExecuteContext& ctx,
                 GateRegistry& registry) override {
        assert(op.wires.size() == 1);

        uint64_t x = wire_val[op.wires[0]].val;
        uint64_t val = 1LL << x;
        uint64_t idx = RomOffsets::POW2_OFFSET + x;
        std::size_t idx_id = ctx.num_wires++;
        wire_val[idx_id] = f61(idx);

        alloc_and_execute(
            OPTYPE::LOAD, BaseOp(OPTYPE::LOAD, {idx_id}), f61(val),
            wire_val, ctx, registry);

        wire_val[op_index] = f61(val);
    }
};

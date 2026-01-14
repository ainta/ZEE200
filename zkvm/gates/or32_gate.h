#pragma once
#include "and32_gate.h"
#include "../rom_offsets.h"

/**
 * 32-bit bitwise OR gate implementation
 * Inherits from And32Gate and changes only the ROM offset
 */
class Or32Gate : public And32Gate {
public:
    OPTYPE get_type() const override {
        return OPTYPE::OR32;
    }

    std::string get_name() const override {
        return "Or32Gate";
    }

    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& registry) override {
        assert(op.wires.size() == 2);

        std::size_t x_id = op.wires[0];
        std::size_t y_id = op.wires[1];

        // Split x and y into byte chunks
        std::vector<std::size_t> x_chunks = create_byte_decomposition(x_id, circuit, ctx, registry);
        std::vector<std::size_t> y_chunks = create_byte_decomposition(y_id, circuit, ctx, registry);

        // Perform lookups for each byte using recursive LOAD calls
        std::vector<std::size_t> xy_val_ids;
        for (int i = 0; i < 4; i++) {
            // Compute OR table address
            circuit.push_back(BaseOp(OPTYPE::LINEAR,
                {x_chunks[i], y_chunks[i], ctx.wire_1},
                {1<<8, 1, RomOffsets::OR_OFFSET}));
            std::size_t idx_wire = circuit.size() - 1;

            // Use LOAD gate recursively
            std::size_t val_wire = emit_and_transform(
                BaseOp(OPTYPE::LOAD, {idx_wire}),
                circuit, ctx, registry);
            xy_val_ids.push_back(val_wire);
        }

        // Combine results
        circuit[op_index] = BaseOp(OPTYPE::LINEAR,
            {xy_val_ids[0], xy_val_ids[1], xy_val_ids[2], xy_val_ids[3]},
            {1, 1<<8, 1<<16, 1<<24});
    }

    void execute(std::size_t op_index, const BaseOp& op,
                 std::vector<f61>& wire_val, ExecuteContext& ctx,
                 GateRegistry& registry) override {
        assert(op.wires.size() == 2);

        uint64_t x = wire_val[op.wires[0]].val;
        uint64_t y = wire_val[op.wires[1]].val;

        // Compute result using OR
        uint64_t result = x | y;

        // Extract byte values for witness
        uint64_t xval[4] = {x & 0xFF, (x >> 8) & 0xFF, (x >> 16) & 0xFF, (x >> 24) & 0xFF};
        uint64_t yval[4] = {y & 0xFF, (y >> 8) & 0xFF, (y >> 16) & 0xFF, (y >> 24) & 0xFF};

        // Set witnesses for byte decompositions
        set_byte_decomposition_witnesses(x, xval, wire_val, ctx, registry);
        set_byte_decomposition_witnesses(y, yval, wire_val, ctx, registry);

        // Perform lookups using recursive LOAD calls
        for (int j = 0; j < 4; j++) {
            uint64_t idx = RomOffsets::OR_OFFSET + (xval[j] * 256 + yval[j]);
            uint64_t val = (result >> (j * 8)) & 0xFF;

            // Allocate wire for idx LINEAR result and set its value
            // (LOAD::execute needs to read this value before forward_pass runs)
            std::size_t idx_wire = ctx.num_wires++;
            wire_val[idx_wire] = f61(idx);

            // Use LOAD gate recursively
            alloc_and_execute(
                OPTYPE::LOAD, BaseOp(OPTYPE::LOAD, {idx_wire}), f61(val),
                wire_val, ctx, registry);
        }

        wire_val[op_index] = result;
    }
};

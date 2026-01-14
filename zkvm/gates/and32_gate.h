#pragma once
#include "base_gate.h"
#include "gate_registry.h"
#include "../rom_offsets.h"
#include <cassert>

/**
 * 32-bit bitwise AND gate implementation
 * Uses ROM lookups for 8-bit chunks to implement bitwise operations
 *
 * Byte decomposition uses HIGH8 ROM for efficiency:
 * - 1 ZKSET + 2 LOADs + 1 INPUT per operand (vs old: 7 ZKSET per operand)
 */
class And32Gate : public BaseGate {
public:
    OPTYPE get_type() const override {
        return OPTYPE::AND32;
    }

    std::string get_name() const override {
        return "And32Gate";
    }

    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& registry) override {
        assert(op.wires.size() == 2);

        std::size_t x_id = op.wires[0];
        std::size_t y_id = op.wires[1];

        // Split x into 4 uint8 chunks: [byte0, byte1, byte2, byte3]
        std::vector<std::size_t> x_chunks = create_byte_decomposition(x_id, circuit, ctx, registry);

        // Split y into 4 uint8 chunks: [byte0, byte1, byte2, byte3]
        std::vector<std::size_t> y_chunks = create_byte_decomposition(y_id, circuit, ctx, registry);

        // Perform ROM lookups for each byte using recursive LOAD calls
        std::vector<std::size_t> xy_val_ids;
        for (int i = 0; i < 4; i++) {
            // Compute table address: AND_OFFSET + x_chunk*256 + y_chunk
            circuit.push_back(BaseOp(OPTYPE::LINEAR,
                {x_chunks[i], y_chunks[i], ctx.wire_1},
                {1<<8, 1, RomOffsets::AND_OFFSET}));
            std::size_t idx_wire = circuit.size() - 1;

            // Use LOAD gate recursively
            std::size_t val_wire = emit_and_transform(
                BaseOp(OPTYPE::LOAD, {idx_wire}),
                circuit, ctx, registry);
            xy_val_ids.push_back(val_wire);
        }

        // Combine results: result = val0 + val1*2^8 + val2*2^16 + val3*2^24
        circuit[op_index] = BaseOp(OPTYPE::LINEAR,
            {xy_val_ids[0], xy_val_ids[1], xy_val_ids[2], xy_val_ids[3]},
            {1, 1<<8, 1<<16, 1<<24});
    }

    void execute(std::size_t op_index, const BaseOp& op,
                 std::vector<f61>& wire_val, ExecuteContext& ctx,
                 GateRegistry& registry) override {
        assert(op.wires.size() == 2);

        uint64_t x = wire_val[op.wires[0]].val & 0xFFFFFFFFull;
        uint64_t y = wire_val[op.wires[1]].val & 0xFFFFFFFFull;

        // Compute result
        uint64_t result = x & y;

        // Extract byte values for witness
        uint64_t xval[4] = {x & 0xFF, (x >> 8) & 0xFF, (x >> 16) & 0xFF, (x >> 24) & 0xFF};
        uint64_t yval[4] = {y & 0xFF, (y >> 8) & 0xFF, (y >> 16) & 0xFF, (y >> 24) & 0xFF};

        // Set witnesses for byte decompositions (must match transform order)
        set_byte_decomposition_witnesses(x, xval, wire_val, ctx, registry);
        set_byte_decomposition_witnesses(y, yval, wire_val, ctx, registry);

        // Perform lookups using recursive LOAD calls
        for (int j = 0; j < 4; j++) {
            uint64_t idx = RomOffsets::AND_OFFSET + (xval[j] * 256 + yval[j]);
            uint64_t val = (result >> (j * 8)) & 0xFF;

            // Allocate wire for idx LINEAR result
            std::size_t idx_wire = ctx.num_wires++;
            wire_val[idx_wire] = f61(idx);

            // Use LOAD gate recursively
            alloc_and_execute(
                OPTYPE::LOAD, BaseOp(OPTYPE::LOAD, {idx_wire}), f61(val),
                wire_val, ctx, registry);
        }

        wire_val[op_index] = result;
    }

protected:
    /**
     * Create byte decomposition for a 32-bit value using HIGH8 ROM
     *
     * val = high16 * 2^16 + low16
     * low16 = byte1 * 256 + byte0  (byte1 from HIGH8 ROM)
     * high16 = byte3 * 256 + byte2 (byte3 from HIGH8 ROM)
     *
     * Returns [byte0, byte1, byte2, byte3]
     */
    std::vector<std::size_t> create_byte_decomposition(std::size_t val_id,
                                                      std::vector<BaseOp>& circuit,
                                                      GateContext& ctx,
                                                      GateRegistry& registry) {
        // Step 1: ZKSET → high16 (verified [0, 65535])
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t high16_wire = circuit.size() - 1;
        ctx.set2id.push_back(high16_wire);

        // Step 2: INPUT → low16
        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t low16_wire = circuit.size() - 1;

        // Step 3: Checkzero: val - high16*2^16 - low16 == 0
        circuit.push_back(BaseOp(OPTYPE::LINEAR,
            {val_id, high16_wire, low16_wire},
            {1, f61::minor(1ULL << 16), f61::minor(1)}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // Step 4: LOAD(HIGH8_OFFSET + low16) → byte1 = low16 >> 8
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {low16_wire, ctx.wire_1},
                                 {1, RomOffsets::HIGH8_OFFSET}));
        std::size_t addr_low_wire = circuit.size() - 1;

        std::size_t byte1_wire = emit_and_transform(
            BaseOp(OPTYPE::LOAD, {addr_low_wire}),
            circuit, ctx, registry);

        // Step 5: byte0 = low16 - byte1*256
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {low16_wire, byte1_wire}, {1, f61::minor(256)}));
        std::size_t byte0_wire = circuit.size() - 1;

        // Step 6: LOAD(HIGH8_OFFSET + high16) → byte3 = high16 >> 8
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {high16_wire, ctx.wire_1},
                                 {1, RomOffsets::HIGH8_OFFSET}));
        std::size_t addr_high_wire = circuit.size() - 1;

        std::size_t byte3_wire = emit_and_transform(
            BaseOp(OPTYPE::LOAD, {addr_high_wire}),
            circuit, ctx, registry);

        // Step 7: byte2 = high16 - byte3*256
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {high16_wire, byte3_wire}, {1, f61::minor(256)}));
        std::size_t byte2_wire = circuit.size() - 1;

        return {byte0_wire, byte1_wire, byte2_wire, byte3_wire};
    }

    /**
     * Set witness values for byte decomposition (must match transform order)
     */
    void set_byte_decomposition_witnesses(uint64_t val, const uint64_t bytes[4],
                                         std::vector<f61>& wire_val,
                                         ExecuteContext& ctx,
                                         GateRegistry& registry) {
        uint64_t high16 = val >> 16;
        uint64_t low16 = val & 0xFFFF;
        uint64_t byte0 = bytes[0];
        uint64_t byte1 = bytes[1];
        uint64_t byte2 = bytes[2];
        uint64_t byte3 = bytes[3];

        // Step 1: high16 (ZKSET)
        wire_val[ctx.num_wires++] = f61(high16);

        // Step 2: low16 (INPUT)
        wire_val[ctx.num_wires++] = f61(low16);

        // Step 3: checkzero (value 0)
        wire_val[ctx.num_wires++] = f61(0);

        // Step 4: addr_low (LINEAR) + LOAD for byte1
        uint64_t addr_low = RomOffsets::HIGH8_OFFSET + low16;
        wire_val[ctx.num_wires++] = f61(addr_low);

        alloc_and_execute(
            OPTYPE::LOAD, BaseOp(OPTYPE::LOAD, {ctx.num_wires - 1}), f61(byte1),
            wire_val, ctx, registry);

        // Step 5: byte0 = low16 - byte1*256
        wire_val[ctx.num_wires++] = f61(byte0);

        // Step 6: addr_high (LINEAR) + LOAD for byte3
        uint64_t addr_high = RomOffsets::HIGH8_OFFSET + high16;
        wire_val[ctx.num_wires++] = f61(addr_high);

        alloc_and_execute(
            OPTYPE::LOAD, BaseOp(OPTYPE::LOAD, {ctx.num_wires - 1}), f61(byte3),
            wire_val, ctx, registry);

        // Step 7: byte2 = high16 - byte3*256
        wire_val[ctx.num_wires++] = f61(byte2);

    }
};

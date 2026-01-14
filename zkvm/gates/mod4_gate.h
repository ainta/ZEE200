#pragma once
#include "base_gate.h"
#include "gate_registry.h"
#include "../rom_offsets.h"
#include <cassert>

/**
 * MOD4 gate implementation
 * Computes x % 4 by:
 * 1. Decomposing input as: input = 2^16 * high + low
 * 2. Verifying high via ZKSET (range check 0..65535)
 * 3. Getting low via INPUT
 * 4. Looking up low % 4 from ROM at MOD4_OFFSET + low using LOAD
 *
 * Since 2^16 % 4 = 0, we have: input % 4 = low % 4
 */
class Mod4Gate : public BaseGate {
public:
    OPTYPE get_type() const override {
        return OPTYPE::MOD4;
    }

    std::string get_name() const override {
        return "Mod4Gate";
    }

    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& registry) override {
        assert(op.wires.size() == 1);

        std::size_t input_wire = op.wires[0];

        // Step 1: Get high 16 bits from ZKSET (verifies high is in 0..65535)
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t high_wire = circuit.size() - 1;
        ctx.set2id.push_back(high_wire);

        // Step 2: Get low 16 bits from INPUT
        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t low_wire = circuit.size() - 1;

        // Step 3: Checkzero: input - 2^16 * high - low == 0
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {input_wire, high_wire, low_wire},
                                 {1, f61::minor(1ULL << 16), f61::minor(1)}));
        std::size_t checkzero_wire = circuit.size() - 1;
        ctx.checkzero_wires.push_back(checkzero_wire);

        // Step 4: Compute ROM address: MOD4_OFFSET + low
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {low_wire, ctx.wire_1},
                                 {1, RomOffsets::MOD4_OFFSET}));
        std::size_t addr_wire = circuit.size() - 1;

        // Step 5: Load result from ROM using LOAD (recursion magic!)
        std::size_t result_wire = emit_and_transform(
            BaseOp(OPTYPE::LOAD, {addr_wire}),
            circuit, ctx, registry);

        // Set op_index to the result
        circuit[op_index] = BaseOp(OPTYPE::LINEAR, {result_wire}, {1});
    }

    void execute(std::size_t op_index, const BaseOp& op,
                 std::vector<f61>& wire_val, ExecuteContext& ctx,
                 GateRegistry& registry) override {
        assert(op.wires.size() == 1);

        uint64_t input_val = wire_val[op.wires[0]].val;

        // Step 1: Compute high = input >> 16
        uint64_t high = input_val >> 16;

        // Step 2: Compute low = input & 0xFFFF
        uint64_t low = input_val & 0xFFFF;

        // Step 3: Allocate wire for ZKSET (high)
        std::size_t high_wire = ctx.num_wires++;
        wire_val[high_wire] = f61(high);

        // Step 4: Allocate wire for INPUT (low)
        std::size_t low_wire = ctx.num_wires++;
        wire_val[low_wire] = f61(low);

        // Step 5: Allocate checkzero wire (should be 0)
        std::size_t checkzero_wire = ctx.num_wires++;
        wire_val[checkzero_wire] = f61(0);

        // Step 6: Compute ROM address and allocate wire
        uint64_t addr = RomOffsets::MOD4_OFFSET + low;
        std::size_t addr_wire = ctx.num_wires++;
        wire_val[addr_wire] = f61(addr);

        // Step 7: Load result using LOAD gate (recursion magic!)
        auto it = ctx.ram_map.find(addr);
        if (it == ctx.ram_map.end()) {
            std::cerr << "[MOD4 ERROR] ROM address not in RAM: addr=" << addr << std::endl;
            assert(false && "MOD4: ROM address not found");
        }
        uint64_t result = it->second.val;

        std::size_t result_wire = alloc_and_execute(
            OPTYPE::LOAD, BaseOp(OPTYPE::LOAD, {addr_wire}), f61(result),
            wire_val, ctx, registry);

        // Set the final result at op_index
        wire_val[op_index] = f61(result);
    }
};

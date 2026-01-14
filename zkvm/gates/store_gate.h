#pragma once
#include "base_gate.h"
#include <cassert>

/**
 * Memory store gate implementation
 * Stores a value to RAM with timestamp tracking
 */
class StoreGate : public BaseGate {
public:
    OPTYPE get_type() const override { 
        return OPTYPE::STORE; 
    }
    
    std::string get_name() const override { 
        return "StoreGate"; 
    }
    
    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& /*registry*/) override {
        assert(op.wires.size() == 2);
        std::size_t idx_id = op.wires[0];
        std::size_t new_val_id = op.wires[1];
        circuit[op_index] = BaseOp(OPTYPE::MEM);
        std::size_t old_val_id = op_index;


        ctx.mem_wires.push_back(GateContext::MemWires(idx_id, old_val_id, new_val_id));

    }
    
    void execute(std::size_t op_index, const BaseOp& op,
                 std::vector<f61>& wire_val, ExecuteContext& ctx,
                 GateRegistry& /*registry*/) override {
        assert(op.wires.size() == 2);

        // Use byte address directly as key (RAM is key-value store)
        uint64_t addr = static_cast<uint64_t>(wire_val[op.wires[0]].val);

        // Track memory access for QED address detection
        ctx.memory_access.insert(addr);

        // Lookup in RAM map (address must exist from initialization)
        auto it = ctx.ram_map.find(addr);
        if (it == ctx.ram_map.end()) {
            std::cerr << "[STORE ERROR] Address not in RAM: addr=0x" << std::hex << addr
                      << std::dec << std::endl;
            assert(false && "STORE: RAM address not found");
        }

        // Update RAM with new value
        f61 old_val = it->second;
        f61 new_val = wire_val[op.wires[1]];
        ctx.ram_map[addr] = new_val;
        wire_val[op_index] = old_val;

    }
};

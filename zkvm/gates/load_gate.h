#pragma once
#include "base_gate.h"
#include <cassert>
#include <iostream>

/**
 * Memory load gate implementation
 * Loads a value from RAM with timestamp tracking
 */
class LoadGate : public BaseGate {
public:
    OPTYPE get_type() const override { 
        return OPTYPE::LOAD; 
    }
    
    std::string get_name() const override { 
        return "LoadGate"; 
    }
    
    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& /*registry*/) override {
        assert(op.wires.size() == 1);
        
        std::size_t idx_id = op.wires[0];

        std::size_t old_val_id = op_index;

        circuit[old_val_id] = BaseOp(OPTYPE::MEM);

        circuit.push_back(BaseOp(OPTYPE::LINEAR, {old_val_id}, {1}));
        std::size_t new_val_id = circuit.size() - 1;

        ctx.mem_wires.push_back(GateContext::MemWires(idx_id, old_val_id, new_val_id));
    }
    
    void execute(std::size_t op_index, const BaseOp& op,
                 std::vector<f61>& wire_val, ExecuteContext& ctx,
                 GateRegistry& /*registry*/) override {
        assert(op.wires.size() == 1);

        // Use byte address directly as key (RAM is key-value store)
        uint64_t addr = static_cast<uint64_t>(wire_val[op.wires[0]].val);

        // Track memory access for QED address detection
        ctx.memory_access.insert(addr);

        // Lookup in RAM map
        auto it = ctx.ram_map.find(addr);
        if (it == ctx.ram_map.end()) {
            std::cerr << "[LOAD ERROR] Address not in RAM: addr=0x" << std::hex << addr
                      << std::dec << std::endl;
            assert(false && "LOAD: RAM address not found");
        }

        // Load value from RAM
        wire_val[op_index] = it->second;
        std::size_t new_val_id = ctx.num_wires++;
        wire_val[new_val_id] = wire_val[op_index];
    }
};

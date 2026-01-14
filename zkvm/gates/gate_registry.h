#pragma once

#include "base_gate.h"
#include <unordered_map>
#include <memory>
#include <iostream>

/**
 * Registry and factory for gate implementations
 * Manages all available gates and provides access by OPTYPE
 */
class GateRegistry {
private:
    std::unordered_map<OPTYPE, std::unique_ptr<BaseGate>> gates;
    
public:
    GateRegistry() {
        // Gates will be registered in the constructor
        initialize_gates();
    }
    
    /**
     * Register a gate implementation
     * @param gate Unique pointer to the gate implementation
     */
    void register_gate(std::unique_ptr<BaseGate> gate) {
        OPTYPE type = gate->get_type();
        gates[type] = std::move(gate);
        //std::cout << "Registered gate: " << optype_to_string(type) << std::endl;
    }
    
    /**
     * Get gate implementation for a given operation type
     * @param type The operation type
     * @return Pointer to gate implementation, or nullptr if not found
     */
    BaseGate* get_gate(OPTYPE type) {
        auto it = gates.find(type);
        return it != gates.end() ? it->second.get() : nullptr;
    }
    
    /**
     * Check if a gate is registered for the given type
     * @param type The operation type
     * @return true if gate exists, false otherwise
     */
    bool has_gate(OPTYPE type) const {
        return gates.find(type) != gates.end();
    }
    
    /**
     * Get list of all registered gate types
     * @return Vector of registered OPTYPE values
     */
    std::vector<OPTYPE> get_registered_types() const {
        std::vector<OPTYPE> types;
        for (const auto& pair : gates) {
            types.push_back(pair.first);
        }
        return types;
    }
    
    /**
     * Print information about all registered gates
     */
    void print_gates() const {
        std::cout << "Registered gates:" << std::endl;
        for (const auto& pair : gates) {
            std::cout << "  " << optype_to_string(pair.first) 
                     << " -> " << pair.second->get_name() << std::endl;
        }
    }
    
private:
    /**
     * Initialize all gate implementations
     * This will be implemented after we create the individual gates
     */
    void initialize_gates();
};

// Implementation of BaseGate helper methods (needs full GateRegistry definition)
inline std::size_t BaseGate::emit_and_transform(BaseOp op, std::vector<BaseOp>& circuit,
                                                GateContext& ctx, GateRegistry& registry) {
    circuit.push_back(op);
    std::size_t wire_id = circuit.size() - 1;

    if (!is_basic_unit(op.op)) {
        BaseGate* gate = registry.get_gate(op.op);
        if (gate) {
            gate->transform(wire_id, op, circuit, ctx, registry);
        }
    }

    return wire_id;
}

inline std::size_t BaseGate::alloc_and_execute(OPTYPE type, BaseOp op, f61 result_value,
                                               std::vector<f61>& wire_val, ExecuteContext& ctx,
                                               GateRegistry& registry) {
    std::size_t wire_id = ctx.num_wires++;
    wire_val[wire_id] = result_value;

    if (!is_basic_unit(type)) {
        BaseGate* gate = registry.get_gate(type);
        if (gate) {
            gate->execute(wire_id, op, wire_val, ctx, registry);
        }
    }
    return wire_id;
}
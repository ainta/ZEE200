#pragma once
#include "../types.h"
#include <vector>
#include <queue>
#include <cstddef>
#include <unordered_map>
#include <unordered_set>

/**
 * Context passed to gates during circuit transformation
 * Contains references to all the data structures that gates need to modify
 */
struct GateContext {
    // Wire collections for different purposes
    std::vector<std::size_t>& iid;           // Input wire indices
    std::vector<std::size_t>& oid;           // Output wire indices
    std::vector<std::size_t>& set2id;        // ZK set 2 indices
    std::vector<std::size_t>& checkzero_wires; // Zero-check constraint wires

    struct MemWires {
        std::size_t key_wire;
        std::size_t old_val_wire;
        std::size_t new_val_wire;
        MemWires(std::size_t _key_wire, std::size_t _old_val_wire, std::size_t _new_val_wire) : key_wire(_key_wire), old_val_wire(_old_val_wire), new_val_wire(_new_val_wire) {}
    };

    // Memory access wires
    std::vector<MemWires>& mem_wires;

    std::size_t wire_1;         // Constant 1 wire (immutable)
    std::size_t wire_pc;        // Program counter wire (immutable)
    std::size_t m;              // Number of registers (immutable)
    
    GateContext(std::vector<std::size_t>& _iid,
                std::vector<std::size_t>& _oid,
                std::vector<std::size_t>& _set2id,
                std::vector<std::size_t>& _checkzero_wires,
                std::vector<MemWires>& _mem_wires,
                std::size_t _wire_1,
                std::size_t _wire_pc,
                std::size_t _m)
        : iid(_iid), oid(_oid), set2id(_set2id),
          checkzero_wires(_checkzero_wires),
          mem_wires(_mem_wires),
          wire_1(_wire_1), wire_pc(_wire_pc), m(_m), next_wire_index(_m) {}
    
    /**
     * Allocate a new wire index
     */
    std::size_t allocate_wire() {
        return next_wire_index++;
    }
    
    /**
     * Get or create a wire for a register index
     */
    std::size_t get_or_create_wire(std::size_t reg_index) {
        if (reg_index < m) {
            return reg_index;  // Registers map directly to wire indices
        }
        return allocate_wire();
    }
    
    /**
     * Set wire value (for tracking wire assignments)
     */
    void set_wire_value(std::size_t wire_index, std::size_t value_wire) {
        // This is a placeholder - in practice, wire values are tracked 
        // by the circuit execution, not stored here
    }
    
private:
    std::size_t next_wire_index;  // Track next available wire index
};

/**
 * Context passed to gates during witness execution
 * Contains references to runtime state needed for cleartext execution
 */
struct ExecuteContext {
    // Memory state (key-value RAM: address -> value)
    std::unordered_map<uint64_t, f61>& ram_map;  // RAM values (mutable)

    // Memory access tracking (for QED address detection)
    std::unordered_set<uint64_t>& memory_access;  // Set of accessed addresses

    // Execution state
    std::size_t& num_wires;          // Wire counter (mutable)

    // I/O state (for ASMINPUT gate)
    std::queue<f61>& input_queue;    // FIFO queue of input values from cleartext VM
    std::vector<f61>& input_record;  // Record of all input reads (for auditing)

    ExecuteContext(std::unordered_map<uint64_t, f61>& _ram_map,
                   std::unordered_set<uint64_t>& _memory_access,
                   std::size_t& _num_wires,
                   std::queue<f61>& _input_queue,
                   std::vector<f61>& _input_record)
        : ram_map(_ram_map), memory_access(_memory_access), num_wires(_num_wires),
          input_queue(_input_queue), input_record(_input_record) {}
};
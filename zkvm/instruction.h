#pragma once

#include <vector>
#include <random>
#include <iostream>
#include <string>
#include <fstream>
#include <cassert>
#include <algorithm>
#include <cstdlib>
#include <unordered_set>
#include "emp-zk/emp-zk.h"
#include "base_types.h"
#include "gates/all_gates.h"

/**
 * Main instruction class that manages circuit operations, wire connections, and execution.
 * Handles transformation of high-level operations into circuit representation and execution.
 * 
 * REFACTORED VERSION - Uses modular gate implementations
 */
class Instruction {
private:
    static GateRegistry gate_registry;
    
public:
    // Core configuration
    std::size_t m;  // Number of registers: [wire_1, pc] (m=2 in black-box RAM model)
    
    // Circuit execution parameters
    std::size_t path_length;
    std::size_t period_reps;
    
    // Wire indices organized by purpose
    std::vector<std::size_t> iid;           // Input wire indices
    std::vector<std::size_t> oid;           // Output wire indices  
    std::vector<std::size_t> lid;           // Left multiplication input indices
    std::vector<std::size_t> rid;           // Right multiplication input indices
    std::vector<std::size_t> set2id;        // ZK set 2 indices
    std::vector<std::size_t> checkzero_wires; // Zero-check constraint wires

    std::vector<std::size_t> key_id;
    std::vector<std::size_t> old_val_id;
    std::vector<std::size_t> new_val_id;

    std::size_t num_dummy_mem_accesses;  // Number of dummy memory accesses added for padding

    // Circuit data
    std::vector<BaseOp> bank;               // Original operations
    std::vector<BaseOp> circuit;            // Transformed circuit
    std::vector<std::size_t> wire_topological_order;
    std::size_t wire_total_checkzero;
    
    // Register and operation tracking
    std::vector<std::size_t> new_reg_id;
    std::vector<std::size_t> op_count;
    std::vector<OPTYPE> op_period;

    explicit Instruction(std::size_t register_count) 
        : m(register_count), path_length(0), period_reps(0), wire_total_checkzero(0) {}
        
    Instruction(std::size_t register_count, std::vector<BaseOp> operations, std::vector<std::size_t> register_mapping) 
        : m(register_count), path_length(0), period_reps(0), wire_total_checkzero(0),
          bank(std::move(operations)), new_reg_id(std::move(register_mapping)) {
        op_count.resize(std::max({OPTYPE::INPUT, OPTYPE::OUTPUT, OPTYPE::MEM, OPTYPE::ZKSET}) + 1);
        validate_all_operations();
    }
    
private:
    void validate_operation(const BaseOp& op) const {
        assert(op.is_valid());
    }
    
    void validate_all_operations() {
        for (std::size_t i = 0; i < m; i++) {
            assert(bank[i].op == OPTYPE::REG);
        }
        for (std::size_t i = m; i < bank.size(); i++) {
            validate_operation(bank[i]);
        }
    }
    
    std::size_t get_wire_1() const { return 0; }
    std::size_t get_wire_pc() const { return 1; }
    
    /**
     * Handle operations that don't have dedicated gate implementations
     * These include all primitive circuit operations
     */
    void handle_special_operations(std::size_t i, const BaseOp& op,
                                  std::vector<BaseOp>& circuit,
                                  GateContext& ctx) {
        if (op.op == OPTYPE::LINEAR) {
            // LINEAR operations pass through unchanged
            return;
        }
        else if (op.op == OPTYPE::MUL) {
            // MUL operations pass through unchanged
            return;
        }
        else if (op.op == OPTYPE::INPUT || op.op == OPTYPE::OUTPUT ||
                 op.op == OPTYPE::MEM || op.op == OPTYPE::ZKSET) {
            // These are all primitive operations - pass through unchanged
            // Their values will be set during execute phase
            return;
        }
        else {
            std::cerr << "Unsupported operation: " << optype_to_string(op.op) << std::endl;
            assert(false);
        }
    }
    
    /**
     * Handle execution of operations that don't have dedicated gate implementations
     */
    void handle_special_operations_execute(std::size_t i, const BaseOp& op,
                                          std::vector<f61>& wire_val,
                                          ExecuteContext& ctx) {
        if (op.op == OPTYPE::LINEAR) {
            wire_val[i] = f61::zero();
            for (int j = 0; j < op.wires.size(); j++) {
                wire_val[i] += wire_val[op.wires[j]] * op.coeffs[j];
            }
        }
        else if (op.op == OPTYPE::MUL) {
            wire_val[i] = wire_val[op.wires[0]] * wire_val[op.wires[1]];
        }
        else if (op.op == OPTYPE::INPUT || op.op == OPTYPE::MEM) {
            // INPUT wires should have their values set by gate execute() methods
            // The value should already be set in wire_val[i]
            // No action needed here
        }
        else {
            std::cerr << "Unsupported operation in execute: " << optype_to_string(op.op) << std::endl;
            assert(false);
        }
    }
    
public:

    /**
     * Prints all operations in the bank for debugging purposes.
     * Shows operation type, wire connections, and coefficients where applicable.
     */
    void print() const {
        std::cout << "=== Instruction Bank (Size: " << bank.size() << ") ===" << std::endl;
        for (std::size_t i = m; i < bank.size(); i++) {
            const auto& op = bank[i];
            std::cout << i << ": " << optype_to_string(op.op);
            
            for (const auto& wire : op.wires) {
                std::cout << " " << wire;
            }
            
            if (op.op == OPTYPE::LINEAR && !op.coeffs.empty()) {
                std::cout << " coeffs:";
                for (const auto& coeff : op.coeffs) {
                    std::cout << " " << coeff.val;
                }
            }
            std::cout << std::endl;
        }
        
        std::cout << "=== Registered Gates ===" << std::endl;
        gate_registry.print_gates();
    }

    // Debug helper: print a single wire's op and inputs
    void debug_print_wire(std::size_t wire_idx) const {
        if (wire_idx >= circuit.size()) {
            std::cout << "[DEBUG] wire " << wire_idx << " out of range (circuit size "
                      << circuit.size() << ")" << std::endl;
            return;
        }
        const auto &op = circuit[wire_idx];
        std::cout << "[DEBUG] wire " << wire_idx << ": op=" << optype_to_string(op.op);
        if (!op.wires.empty()) {
            std::cout << " inputs:";
            for (auto w : op.wires) std::cout << " " << w;
        }
        if (!op.coeffs.empty()) {
            std::cout << " coeffs:";
            for (auto c : op.coeffs) std::cout << " " << c.val;
        }
        if (op.imm != 0) {
            std::cout << " imm=" << op.imm;
        }
        std::cout << std::endl;
    }

    /**
     * Transforms the instruction bank into an executable circuit representation.
     * REFACTORED VERSION - Uses modular gate implementations
     * @param cid Circuit identifier for PC validation
     * @param op_period_cpu Operation period specification for execution scheduling
     */
    void transform_circuit(std::size_t cid, std::vector<OPTYPE> op_period_cpu, std::size_t target_gcd = 0) {

        op_period = op_period_cpu;

        // Clear all wire collections
        iid.clear(); oid.clear(); lid.clear(); rid.clear();
        set2id.clear(); checkzero_wires.clear();
        key_id.clear(); old_val_id.clear(); new_val_id.clear();

        // Initialize special wires
        std::size_t wire_1 = 0;
        std::size_t wire_pc = 1;

        // Declare mem_wires vector for black-box RAM model
        std::vector<GateContext::MemWires> mem_wires;

        // Create gate context
        GateContext ctx(iid, oid, set2id, checkzero_wires,
                       mem_wires, wire_1, wire_pc, m);

        circuit = bank;
        
        // Process each operation using appropriate gate implementation
        for (std::size_t i = m; i < bank.size(); i++) {
            BaseGate* gate = gate_registry.get_gate(bank[i].op);
            if (gate) {
                gate->transform(i, bank[i], circuit, ctx, gate_registry);
            } else {
                // Handle operations without dedicated gates (LINEAR, MUL)
                handle_special_operations(i, bank[i], circuit, ctx);
            }
        }

        // Store mem_wires directly (no flattening needed)
        for(auto &mem_wire : mem_wires) {
            key_id.push_back(mem_wire.key_wire);
            old_val_id.push_back(mem_wire.old_val_wire);
            new_val_id.push_back(mem_wire.new_val_wire);
        }

        // NOTE: new_reg_id is already correctly set by InstructionBuilder
        // with the proper PC wire mapping. Do NOT overwrite it here.
        // new_reg_id[0] = wire_1 (always 0)
        // new_reg_id[1] = PC wire (set by InstructionBuilder to next PC value)

        // Create PC constraint
        // cout << "cid = " << cid << std::endl;
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {wire_pc, wire_1}, {f61::minor(1), f61(cid)}));
        std::size_t wire_pc_checkzero = circuit.size() - 1;

        // calculate path length
        calculate_execution_parameters(target_gcd);

        // Add dummy memory accesses to pad to required count
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {wire_1}, {0x7FFFFFFF}));
        std::size_t wire_0x7FFFFFFF = circuit.size() - 1;
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {wire_1}, {0}));
        std::size_t wire_0 = circuit.size() - 1;
        std::size_t mem_slots_per_period = op_count[OPTYPE::MEM];
        std::size_t target_mem_accesses = path_length * mem_slots_per_period;
        num_dummy_mem_accesses = 0;
        while (key_id.size() < target_mem_accesses) {
            num_dummy_mem_accesses++;
            // Key wire (constrained to 0x7FFFFFFF)
            key_id.push_back(wire_0x7FFFFFFF);
            new_val_id.push_back(wire_0);
            // Old value wire
            circuit.push_back(BaseOp(OPTYPE::MEM));
            old_val_id.push_back(circuit.size() - 1);
        }


        // Combine all zero-check constraints
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {wire_pc_checkzero}, {1}));
        wire_total_checkzero = circuit.size() - 1;
        for(auto &wire : checkzero_wires) {
            circuit[wire_total_checkzero].wires.push_back(wire);
            circuit[wire_total_checkzero].coeffs.push_back(0); // Will be set later
        }

        // Final constraint multiplication
        circuit.push_back(BaseOp(OPTYPE::MUL, {wire_total_checkzero, wire_1}));

        // Organize wires by type
        organize_wires();

        while(lid.size() < path_length * op_count[OPTYPE::OUTPUT] - m) {
            lid.push_back(oid.back());
            rid.push_back(oid.back());
        }

        for (int i = 0; i < m; i++) {
            lid.push_back(get_wire_1());
            rid.push_back(new_reg_id[i]);
        }
        compute_topological_order();
        


#ifdef DEBUG
        std::cout << "Circuit transformation completed!" << std::endl;
        std::cout << "Total circuit size: " << circuit.size() << std::endl;
        std::cout << "Checkzero wires: " << checkzero_wires.size() << std::endl;
#endif
    }

    /**
     * Execute witness generation pass using modular gate implementations
     * REFACTORED VERSION
     */
    void execute_pass1(std::vector<f61> reg_val, std::vector<f61> &next_reg,
                      std::unordered_map<uint64_t, f61> &ram_map,
                      std::unordered_set<uint64_t> &memory_access,
                      std::vector<f61> &wire_val,
                      std::queue<f61> &input_queue,
                      std::vector<f61> &input_record) {
        assert(reg_val.size() == m);

        wire_val = std::vector<f61>(circuit.size());
        for (int i = 0; i < m; i++) {
            wire_val[i] = reg_val[i];
        }

        std::size_t num_wires = bank.size();

        // Create execution context with I/O state and memory access tracking
        ExecuteContext ctx(ram_map, memory_access, num_wires, input_queue, input_record);

        // Execute each operation using appropriate gate implementation
        for (int i = m; i < bank.size(); i++) {
            BaseGate* gate = gate_registry.get_gate(bank[i].op);
            if (gate) {
                gate->execute(i, bank[i], wire_val, ctx, gate_registry);
            } else {
                // Handle operations without dedicated gates
                handle_special_operations_execute(i, bank[i], wire_val, ctx);
            }
        }

        // Update next register values (for m=2, all registers)
        for (int i = 0; i < m; i++) {
            next_reg[i] = wire_val[new_reg_id[i]];
        }
    }

    // Keep all other methods from original implementation
    void compute_topological_order() {
        std::vector<int> in_degree(circuit.size(), 0);
        
        for (std::size_t i = 0; i < circuit.size(); i++) {
            if (circuit[i].op == OPTYPE::MUL) {
                in_degree[circuit[i].wires[0]]++;
                in_degree[circuit[i].wires[1]]++;
            } else if (circuit[i].op == OPTYPE::LINEAR) {
                for (const auto& wire : circuit[i].wires) {
                    in_degree[wire]++;
                }
            }
        }
        
        std::vector<std::size_t> queue;
        std::size_t head = 0;
        
        for (std::size_t i = 0; i < circuit.size(); i++) {
            if (in_degree[i] == 0) {
                queue.push_back(i);
            }
        }
        
        while (head < queue.size()) {
            std::size_t u = queue[head++];
            for (const auto& v : circuit[u].wires) {
                in_degree[v]--;
                if (in_degree[v] == 0) {
                    queue.push_back(v);
                }
            }
        }
        
        assert(queue.size() == circuit.size());
        wire_topological_order = std::move(queue);
        std::reverse(wire_topological_order.begin(), wire_topological_order.end());
    }

    // Forward pass, memory coefficient setting, etc. - keep original implementations
    void forward_pass(std::vector<f61> &wire_val) {
        for(auto &i : wire_topological_order) {
            if (circuit[i].op == OPTYPE::MUL){
                wire_val[i] = wire_val[circuit[i].wires[0]] * wire_val[circuit[i].wires[1]];
            }
            else if (circuit[i].op == OPTYPE::LINEAR){
                wire_val[i] = f61::zero();
                for (int j = 0; j < circuit[i].wires.size(); j++) {
                    wire_val[i] += wire_val[circuit[i].wires[j]] * circuit[i].coeffs[j];
                }
            }
        }
    }

    // fill_memory_coeffs removed - IZKRAM handles memory verification

    void fill_checkzero_coeffs(f61 X) {
        f61 cur = f61::unit();
        for(int i = 0; i < circuit[wire_total_checkzero].wires.size(); i++) {
            circuit[wire_total_checkzero].coeffs[i] = cur;
            cur *= X;
        }
    }

private:
    void organize_wires() {
        for (int i = 0; i < circuit.size(); i++) {
            if (circuit[i].op == OPTYPE::REG) {
                oid.push_back(i);
            }
            else if (circuit[i].op == OPTYPE::INPUT) {
                iid.push_back(i);
            }
            else if (circuit[i].op == OPTYPE::MUL){
                lid.push_back(circuit[i].wires[0]);
                rid.push_back(circuit[i].wires[1]);
                oid.push_back(i);
            }
        }
    }
    
    void calculate_execution_parameters(std::size_t target_gcd = 0) {
        // Reset operation counts
        std::fill(op_count.begin(), op_count.end(), 0);
        for (auto op : op_period) {
            op_count[op]++;
        }

        auto ceil_div = [](std::size_t a, std::size_t b) -> std::size_t {
            if (b == 0) {
                assert(a == 0);
                return 0;
            }
            return (a + b - 1) / b;
        };

        // Current wire counts
        std::size_t iid_size = iid.size();
        std::size_t oid_size = oid.size();
        std::size_t set2id_size = set2id.size();
        std::size_t lid_size = lid.size();
        std::size_t mem_count = key_id.size();

        // Predict wires that will be added in organize_wires()
        for (std::size_t i = 0; i < circuit.size(); i++) {
            if (circuit[i].op == OPTYPE::REG) {
                oid_size++;
            } else if (circuit[i].op == OPTYPE::INPUT) {
                iid_size++;
            } else if (circuit[i].op == OPTYPE::MUL) {
                lid_size++;
                oid_size++;
            }
        }
        lid_size++; oid_size++;  // final constraint MUL adds one each


        period_reps = std::max({
            ceil_div(iid_size, op_count[OPTYPE::INPUT]),
            ceil_div(oid_size, op_count[OPTYPE::OUTPUT]),
            ceil_div(mem_count, op_count[OPTYPE::MEM]),
            ceil_div(set2id_size, op_count[OPTYPE::ZKSET]),
            ceil_div(lid_size + m, op_count[OPTYPE::OUTPUT])
        });

        // If target_gcd is specified, adjust period_reps to ensure path_length is multiple of target_gcd
        while (target_gcd != 0 && period_reps % target_gcd != 0) {
            period_reps++;
        }

        path_length = period_reps;
    }

public:
    // Keep other utility methods from original...
    void extend_in_witness(std::vector<f61> &in, std::vector<f61> &set2, std::vector<f61> &wire_val) {
        for(int i = 0; i < op_count[OPTYPE::INPUT] * period_reps; i++) {
            if (i < iid.size()) {
                in.push_back(wire_val[iid[i]]);
            }
            else {
                in.push_back(f61::zero());
            }
        }
        for(int i = 0; i < op_count[OPTYPE::ZKSET] * period_reps; i++) {
            if (i < set2id.size()) {
                set2.push_back(wire_val[set2id[i]]);
            }
            else {
                set2.push_back(f61::zero());
            }
        }
    }

    void extend_mem_witness(std::vector<f61> &mem, std::vector<f61> &key, std::vector<f61> &new_val, std::vector<f61> &wire_val) {
        std::size_t mem_count = op_count[OPTYPE::MEM] * period_reps;

        // Fill dummy access values (last num_dummy_mem_accesses entries)
        std::size_t dummy_start = mem_count - num_dummy_mem_accesses;
        for (std::size_t i = dummy_start; i < mem_count; i++) {
            wire_val[key_id[i]] = f61(0x7FFFFFFF);
            wire_val[old_val_id[i]] = f61::zero();
            wire_val[new_val_id[i]] = f61::zero();
        }

        // Output in order: key, old_val, new_val for each access
        for (std::size_t i = 0; i < mem_count; i++) {
            mem.push_back(wire_val[old_val_id[i]]);
            key.push_back(wire_val[key_id[i]]);
            new_val.push_back(wire_val[new_val_id[i]]);
        }
    }

    void extend_lr_witness(std::vector<f61> &l, std::vector<f61> &r, std::vector<f61> &wire_val) {
        size_t total_lr = path_length * op_count[OPTYPE::OUTPUT];
        for(size_t i = 0; i < total_lr; i++) {
            if (i < lid.size()) {
                l.push_back(wire_val[lid[i]]);
            }
            else {
                l.push_back(f61::zero());
            }
            if (i < rid.size()) {
                r.push_back(wire_val[rid[i]]);
            }
            else {
                r.push_back(f61::zero());
            }

        }
    }

    void comp_topo_vec_pselect(f61 chi, std::vector<f61> &topo_vec) {
        std::vector<f61> wire(circuit.size());

        f61 coeff = f61::unit();

        // Now we always assume that period is 1 in, 1 out, 1 mem, 1 ZKSET
        for (size_t i = 0; i < path_length; i++) {
            wire[lid[i]] += coeff; 
            coeff *= chi;
            wire[rid[i]] += coeff;
            coeff *= chi;
            wire[key_id[i]] += coeff;
            coeff *= chi;
            wire[new_val_id[i]] += coeff;
            coeff *= chi;
        }

        for (int i = wire_topological_order.size() - 1; i >= 0; i--) {
            auto wire_id = wire_topological_order[i];
            if (circuit[wire_id].op == OPTYPE::LINEAR) {
                for (int j = 0; j < circuit[wire_id].wires.size(); j++) {
                    wire[circuit[wire_id].wires[j]] += wire[wire_id] * circuit[wire_id].coeffs[j];
                }
            }
        }

        topo_vec.clear();
        size_t in_idx = 0, out_idx = 0, set2_idx = 0;
        size_t mem_access_idx = 0;  // which memory access

        for (int p = 0; p < period_reps; p++) {
            for (auto op : op_period) {
                switch(op) {
                    case OPTYPE::INPUT:
                        if (in_idx < iid.size()) {
                            topo_vec.push_back(wire[iid[in_idx]]);
                        } else {
                            topo_vec.push_back(f61::zero());
                        }
                        in_idx++;
                        break;
                    case OPTYPE::OUTPUT:
                        if (out_idx < oid.size()) {
                            topo_vec.push_back(wire[oid[out_idx]]);
                        } else {
                            topo_vec.push_back(f61::zero());
                        }
                        out_idx++;
                        break;
                    case OPTYPE::ZKSET:
                        if (set2_idx < set2id.size()) {
                            topo_vec.push_back(wire[set2id[set2_idx]]);
                        } else {
                            topo_vec.push_back(f61::zero());
                        }
                        set2_idx++;
                        break;
                    case OPTYPE::MEM:
                        topo_vec.push_back(wire[old_val_id[mem_access_idx++]]);
                        break;
                }
            }
        }

        topo_vec.back() += f61::unit();
    }
};

// Initialize the static gate registry
GateRegistry Instruction::gate_registry;

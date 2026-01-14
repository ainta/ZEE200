#pragma once
#include "base_gate.h"
#include <cassert>

/**
 * 32-bit subtraction gate implementation
 * Handles SUB32 operations with underflow checking
 */
class Sub32Gate : public BaseGate {
public:
    OPTYPE get_type() const override { 
        return OPTYPE::SUB32; 
    }
    
    std::string get_name() const override { 
        return "Sub32Gate"; 
    }
    
    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& /*registry*/) override {
        assert(op.wires.size() == 2);
        
        std::size_t x_id = op.wires[0];
        std::size_t y_id = op.wires[1];
        
        // Create borrow bit (INPUT)
        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t o_id = circuit.size()-1;
        
        // Create left part of result (ZKSET)
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t l_id = circuit.size()-1;
        ctx.set2id.push_back(l_id);
        
        // Create right part of result (ZKSET)
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t r_id = circuit.size()-1;
        ctx.set2id.push_back(r_id);
        
        // Create (1 - o) for borrow constraint
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {o_id, ctx.wire_1}, {f61::minor(1), 1}));
        std::size_t one_minus_o_id = circuit.size()-1;
        
        // Borrow bit constraint: o * (1-o) = 0
        circuit.push_back(BaseOp(OPTYPE::MUL, {o_id, one_minus_o_id}));
        std::size_t c_id = circuit.size()-1;
        ctx.checkzero_wires.push_back(c_id);
        
        // Main constraint: x - y + 2^32 - 2^32*o - 2^16*l - r = 0
        // This is equivalent to: x - y + 2^32*(1-o) = 2^16*l + r
        circuit.push_back(BaseOp(OPTYPE::LINEAR, 
            {x_id, y_id, ctx.wire_1, o_id, l_id, r_id}, 
            {1, f61::minor(1), 1LL<<32, f61::minor((1LL<<32)), f61::minor(1<<16), f61::minor(1)}));
        std::size_t dif_id = circuit.size()-1;
        ctx.checkzero_wires.push_back(dif_id);
        
        // Result is l*2^16 + r
        circuit[op_index] = BaseOp(OPTYPE::LINEAR, {l_id, r_id}, {1<<16, 1});
    }
    
    void execute(std::size_t op_index, const BaseOp& op,
                 std::vector<f61>& wire_val, ExecuteContext& ctx,
                 GateRegistry& /*registry*/) override {
        assert(op.wires.size() == 2);
        
        uint64_t x = wire_val[op.wires[0]].val;
        uint64_t y = wire_val[op.wires[1]].val;
        // Add 2^32 to prevent underflow, then check if we needed the extra bit
        uint64_t z = x - y + (1LL<<32);
        
        // Ensure inputs are 32-bit
        assert(x < (1LL<<32));
        assert(y < (1LL<<32));
        
        // Extract borrow and result components
        uint64_t o = (z >> 32) & 1;        // borrow bit (should be 1 for normal case)
        uint64_t l = (z >> 16) & ((1<<16)-1);  // high 16 bits of result
        uint64_t r = z & ((1<<16)-1);          // low 16 bits of result
        
        // Set witness values for the additional wires created in transform
        std::size_t o_id = ctx.num_wires++;
        wire_val[o_id] = o;
        std::size_t l_id = ctx.num_wires++;
        wire_val[l_id] = l;
        std::size_t r_id = ctx.num_wires++;
        wire_val[r_id] = r;
        ctx.num_wires += 3; // Skip the constraint wires
        
        // Set result
        wire_val[op_index] = (l << 16) + r;
    }
};
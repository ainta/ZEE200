#pragma once
#include "base_gate.h"
#include <cassert>

/**
 * Equal-to-zero gate implementation
 * Returns 1 if input is zero, 0 otherwise
 */
class EqzGate : public BaseGate {
public:
    OPTYPE get_type() const override { 
        return OPTYPE::EQZ; 
    }
    
    std::string get_name() const override { 
        return "EqzGate"; 
    }
    
    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& /*registry*/) override {
        assert(op.wires.size() == 1);
        
        std::size_t x_id = op.wires[0];

        // Create witness for boolean result (0 or 1)
        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t o_id = circuit.size()-1;
        
        // Create witness for multiplicative inverse (if x != 0)
        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t y_id = circuit.size()-1;
        
        // Create o * x (should be 0 if o=1, or x if o=0)
        circuit.push_back(BaseOp(OPTYPE::MUL, {o_id, x_id}));
        std::size_t ox_id = circuit.size()-1;
        
        // Create o * x * y (should be 0 always)
        circuit.push_back(BaseOp(OPTYPE::MUL, {ox_id, y_id}));
        std::size_t oxy_id = circuit.size()-1;
        
        // Main constraint: o*x - o - x + o*x*y = 0
        // This ensures: if x=0 then o=0, if x!=0 then o!=0
        circuit.push_back(BaseOp(OPTYPE::LINEAR, 
            {ox_id, o_id, x_id, oxy_id}, 
            {1, f61::minor(1), f61::minor(1), 1}));
        std::size_t z_id = circuit.size()-1;
        ctx.checkzero_wires.push_back(z_id);
        
        // Result is (1 - o), so if x=0 then result=1, if x!=0 then result!=1
        circuit[op_index] = BaseOp(OPTYPE::LINEAR, {o_id, ctx.wire_1}, {f61::minor(1), 1});
        
        // o * (1 - o) = 0 ensures o is either 0 or 1, which makes result is EQZ(x)
        circuit.push_back(BaseOp(OPTYPE::MUL, {o_id, op_index}));
        std::size_t c_id = circuit.size()-1;
        ctx.checkzero_wires.push_back(c_id);
    }
    
    void execute(std::size_t op_index, const BaseOp& op,
                 std::vector<f61>& wire_val, ExecuteContext& ctx,
                 GateRegistry& /*registry*/) override {
        assert(op.wires.size() == 1);
        
        uint64_t x = wire_val[op.wires[0]].val;
        uint64_t o = (x != 0) ? 1 : 0;  // o=1 if x!=0, o=0 if x=0
        uint64_t y;
        
        // Compute multiplicative inverse if x != 0
        if (o) {
            y = (f61(1) / f61(x) / f61(o)).val;
        } else {
            y = 0; // Can be anything when x=0
        }

        // Set witness values
        std::size_t o_id = ctx.num_wires++;
        wire_val[o_id] = o;
        std::size_t y_id = ctx.num_wires++;
        wire_val[y_id] = y;
        ctx.num_wires += 4; // Skip intermediate multiplication and constraint wires
        
        // Set result: 1 if x=0, 0 if x!=0
        wire_val[op_index] = 1 - o;
    }
};
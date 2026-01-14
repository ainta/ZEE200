#pragma once
#include "base_gate.h"
#include <cassert>
#include <iostream>

/**
 * 32-bit multiplication gate implementation  
 * Handles MUL32 operations by decomposing into 16-bit chunks
 */
class Mul32Gate : public BaseGate {
public:
    OPTYPE get_type() const override { 
        return OPTYPE::MUL32; 
    }
    
    std::string get_name() const override { 
        return "Mul32Gate"; 
    }
    
    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& /*registry*/) override {
        assert(op.wires.size() == 2);
        
        std::size_t x_id = op.wires[0];
        std::size_t y_id = op.wires[1];

        // Decompose x into 16-bit chunks: x = xl*2^16 + xr
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t xl_id = circuit.size()-1;
        ctx.set2id.push_back(xl_id);

        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t xr_id = circuit.size()-1;
        ctx.set2id.push_back(xr_id);

        // Constraint: x = xl*2^16 + xr
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {x_id, xl_id, xr_id}, 
                                {1, f61::minor(1<<16), f61::minor(1)}));
        std::size_t cx_id = circuit.size()-1;
        ctx.checkzero_wires.push_back(cx_id);
        
        // Decompose y into 16-bit chunks: y = yl*2^16 + yr
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t yl_id = circuit.size()-1;
        ctx.set2id.push_back(yl_id);

        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t yr_id = circuit.size()-1;
        ctx.set2id.push_back(yr_id);

        // Constraint: y = yl*2^16 + yr
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {y_id, yl_id, yr_id}, 
                                {1, f61::minor(1<<16), f61::minor(1)}));
        std::size_t cy_id = circuit.size()-1;
        ctx.checkzero_wires.push_back(cy_id);
        
        // Compute partial products
        circuit.push_back(BaseOp(OPTYPE::MUL, {xr_id, y_id}));
        std::size_t xr_y_id = circuit.size()-1;

        circuit.push_back(BaseOp(OPTYPE::MUL, {xl_id, yr_id}));
        std::size_t xl_yr_id = circuit.size()-1;

        // Result decomposition: result = o48*2^48 + o32*2^32 + o16*2^16 + o0
        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t o48_id = circuit.size()-1;
        
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t o32_id = circuit.size()-1;
        ctx.set2id.push_back(o32_id);
        
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t o16_id = circuit.size()-1;
        ctx.set2id.push_back(o16_id);
        
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t o0_id = circuit.size()-1;
        ctx.set2id.push_back(o0_id);

        // Main constraint: xr*y + xl*yr*2^16 = o48*2^48 + o32*2^32 + o16*2^16 + o0
        circuit.push_back(BaseOp(OPTYPE::LINEAR, 
            {xr_y_id, xl_yr_id, o48_id, o32_id, o16_id, o0_id}, 
            {1, 1<<16, f61::minor(1LL<<48), f61::minor(1LL<<32), f61::minor(1LL<<16), f61::minor(1)}));
        std::size_t c_id = circuit.size()-1;
        ctx.checkzero_wires.push_back(c_id);
        
        // o48 must be 0 or 1 (overflow bit constraint)
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {o48_id, ctx.wire_1}, {f61::minor(1), 1}));
        std::size_t one_minus_o48_id = circuit.size()-1;
        circuit.push_back(BaseOp(OPTYPE::MUL, {o48_id, one_minus_o48_id}));
        std::size_t c48_id = circuit.size()-1;
        ctx.checkzero_wires.push_back(c48_id);

        // Final result (32-bit): o16*2^16 + o0
        circuit[op_index] = BaseOp(OPTYPE::LINEAR, {o16_id, o0_id}, {1<<16, 1});
    }
    
    void execute(std::size_t op_index, const BaseOp& op,
                 std::vector<f61>& wire_val, ExecuteContext& ctx,
                 GateRegistry& /*registry*/) override {
        assert(op.wires.size() == 2);

        uint64_t x = wire_val[op.wires[0]].val;
        uint64_t y = wire_val[op.wires[1]].val;
        
        // Decompose inputs
        uint64_t xl = x >> 16;
        uint64_t xr = x & ((1<<16)-1);
        uint64_t yl = y >> 16;
        uint64_t yr = y & ((1<<16)-1);
        
        // Compute result using the same formula as in transform
        uint64_t o = xr * y + xl * yr * (1<<16);

        uint64_t o48 = o >> 48;
        uint64_t o32 = (o >> 32) & ((1<<16)-1);
        uint64_t o16 = (o >> 16) & ((1<<16)-1);
        uint64_t o0 = o & ((1<<16)-1);

        // Set witness values
        std::size_t xl_id = ctx.num_wires++;
        wire_val[xl_id] = xl;
        std::size_t xr_id = ctx.num_wires++;
        wire_val[xr_id] = xr;
        ctx.num_wires++; // Skip constraint wire
        
        std::size_t yl_id = ctx.num_wires++;
        wire_val[yl_id] = yl;
        std::size_t yr_id = ctx.num_wires++;
        wire_val[yr_id] = yr;
        ctx.num_wires++; // Skip constraint wire
        ctx.num_wires += 2; // Skip multiplication results
        
        std::size_t o48_id = ctx.num_wires++;
        wire_val[o48_id] = o48;
        std::size_t o32_id = ctx.num_wires++;
        wire_val[o32_id] = o32;
        std::size_t o16_id = ctx.num_wires++;
        wire_val[o16_id] = o16;
        std::size_t o0_id = ctx.num_wires++;
        wire_val[o0_id] = o0;
        ctx.num_wires += 3; // Skip constraint wires
        
        // Set result (lower 32 bits)
        wire_val[op_index] = (o16 << 16) + o0;
    }
};
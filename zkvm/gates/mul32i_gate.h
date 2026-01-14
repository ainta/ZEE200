#pragma once
#include "base_gate.h"
#include <cassert>

/**
 * 32-bit multiplication gate with immediate implementation  
 * Handles MUL32I operations by decomposing into 16-bit chunks
 */
class Mul32IGate : public BaseGate {
public:
    OPTYPE get_type() const override { 
        return OPTYPE::MUL32I; 
    }
    
    std::string get_name() const override { 
        return "Mul32IGate"; 
    }
    
    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& /*registry*/) override {
        assert(op.wires.size() == 1);
        std::size_t x_id = op.wires[0];
        std::uint32_t y = (op.imm) % (1LL<<32);
        std::uint32_t yr = y & ((1<<16)-1);

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
        
        // Compute partial products
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {xr_id}, {y}));
        std::size_t xr_y_id = circuit.size()-1;

        circuit.push_back(BaseOp(OPTYPE::LINEAR, {xl_id}, {yr}));
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
        assert(op.wires.size() == 1);
        
        uint64_t x = wire_val[op.wires[0]].val;
        uint64_t y = op.imm;
        
        // Decompose input x
        uint64_t xl = x >> 16;
        uint64_t xr = x & ((1<<16)-1);
        
        // Decompose immediate y
        uint64_t yr = y & ((1<<16)-1);
        
        // Compute result using the same formula as in transform
        uint64_t o = xr * y + xl * yr * (1LL<<16);

        uint64_t o48 = o >> 48;
        uint64_t o32 = (o >> 32) & ((1<<16)-1);
        uint64_t o16 = (o >> 16) & ((1<<16)-1);
        uint64_t o0 = o & ((1<<16)-1);

        // Set witness values for x decomposition
        std::size_t xl_id = ctx.num_wires++;
        wire_val[xl_id] = xl;
        std::size_t xr_id = ctx.num_wires++;
        wire_val[xr_id] = xr;
        ctx.num_wires++; // Skip constraint wire for x decomposition
        
        // Set witnesses for partial product wires
        std::size_t xr_y_id = ctx.num_wires++;
        wire_val[xr_y_id] = xr * y;
        std::size_t xl_yr_id = ctx.num_wires++;
        wire_val[xl_yr_id] = xl * yr;
        
        // Set witnesses for result decomposition
        std::size_t o48_id = ctx.num_wires++;
        wire_val[o48_id] = o48;
        std::size_t o32_id = ctx.num_wires++;
        wire_val[o32_id] = o32;
        std::size_t o16_id = ctx.num_wires++;
        wire_val[o16_id] = o16;
        std::size_t o0_id = ctx.num_wires++;
        wire_val[o0_id] = o0;

        ctx.num_wires++; // Skip main constraint wire
        
        ctx.num_wires += 2; // Skip o48 boolean constraint wires
        
        // Set result (lower 32 bits)
        wire_val[op_index] = (o16 << 16) + o0;
    }
};


#pragma once
#include "base_gate.h"
#include <iostream>

/**
 * VMCALL gate - represents a system call / oracle invocation
 *
 * In cleartext execution: VMCALL executes actual oracles (file I/O, stdin, etc.)
 * In ZK protocol execution: VMCALL is a NO-OP because oracles already ran in cleartext
 *
 * The cleartext VM runs before ZK proof generation:
 * 1. VMCALL executes oracle → pushes results to input stack
 * 2. INPUT instructions pop from that stack
 * 3. Stack contents become witness data for ZK proof
 *
 * During ZK proof:
 * 1. VMCALL becomes a zero constraint (no-op)
 * 2. INPUT instructions pop from pre-filled input queue (from cleartext)
 * 3. ZK circuit proves computation is correct for those inputs
 */
class VmcallGate : public BaseGate {
public:
    OPTYPE get_type() const override {
        return OPTYPE::VMCALL;
    }

    std::string get_name() const override {
        return "VmcallGate";
    }

    /**
     * Transform VMCALL into a NO-OP (zero constraint)
     * The oracle has already executed in cleartext phase
     */
    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& /*registry*/) override {
        // Create a zero constraint: 0 * wire_1 = 0
        // This is always satisfied but does nothing
        circuit[op_index] = BaseOp(OPTYPE::LINEAR);
        circuit[op_index].coeffs.push_back(0);
        circuit[op_index].wires.push_back(ctx.wire_1);
        ctx.checkzero_wires.push_back(op_index);
    }

    /**
     * Execute VMCALL during witness generation
     * Since we're in ZK phase (not cleartext), this is a no-op
     * The oracle already ran and populated the input queue
     */
    void execute(std::size_t op_index, const BaseOp& op,
                 std::vector<f61>& wire_val, ExecuteContext& ctx,
                 GateRegistry& /*registry*/) override {
        // No-op in zkVM execution
        // Oracle was executed during cleartext phase before ZK proof
        // Input queue is already populated with oracle results
        wire_val[op_index] = f61(0);  // Dummy value for consistency
    }
};

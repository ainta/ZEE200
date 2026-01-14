#pragma once
#include "base_gate.h"
#include <iostream>
#include <cstdlib>

/**
 * ASMINPUT gate - reads one f61 value from prover's input queue
 * This implements the INPUT assembly instruction from cleartext VM
 * Authenticates via INPUT so it's included in 'in' and CV/LR checks
 */
class AsmInputGate : public BaseGate {
public:
    OPTYPE get_type() const override {
        return OPTYPE::ASMINPUT;
    }

    std::string get_name() const override {
        return "AsmInputGate";
    }

    /**
     * Transform ASMINPUT into an INPUT wire for authentication
     * One result, no inputs (value comes from prover's input queue)
     */
    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& /*registry*/) override {
        // ASMINPUT produces one authenticated value from prover
        // Treat as ordinary INPUT so authentication & topology already work
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t high16_id = circuit.size() - 1;
        ctx.set2id.push_back(high16_id);
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t low16_id = circuit.size() - 1;
        ctx.set2id.push_back(low16_id);
        
        circuit[op_index] = BaseOp(OPTYPE::LINEAR, {high16_id, low16_id}, {1<<16, 1});

    }

    /**
     * Execute ASMINPUT by reading from the input queue (FIFO semantics)
     */
    void execute(std::size_t op_index, const BaseOp& op,
                 std::vector<f61>& wire_val, ExecuteContext& ctx,
                 GateRegistry& /*registry*/) override {
        // Check if input queue is empty
        if (ctx.input_queue.empty()) {
            std::cerr << "[ASMINPUT] Error: input queue exhausted at wire "
                      << op_index << std::endl;
            exit(1);
        }

        // Pop from input queue (FIFO)
        uint64_t input = ctx.input_queue.front().val;
        uint64_t high16 = input >> 16;
        uint64_t low16 = input & 0xFFFF;
        wire_val[ctx.num_wires++] = high16;
        wire_val[ctx.num_wires++] = low16;
        wire_val[op_index] = input;
        ctx.input_queue.pop();

        // Record for auditing/debugging
        ctx.input_record.push_back(wire_val[op_index]);
    }
};

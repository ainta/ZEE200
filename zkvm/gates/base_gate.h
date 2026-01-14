#pragma once
#include "../base_types.h"
#include "../context/gate_context.h"
#include <vector>
#include <cstddef>

// Forward declaration for recursive gate calls
class GateRegistry;

/**
 * Abstract base class for all gate implementations
 * Each gate type (ADD32, MUL32, etc.) inherits from this class
 */
class BaseGate {
public:
    virtual ~BaseGate() = default;

    /**
     * Transform the high-level gate operation into low-level circuit representation
     * @param op_index Index of this operation in the circuit
     * @param op The original high-level operation
     * @param circuit The circuit being built (will be modified)
     * @param ctx Context containing wire collections and state
     * @param registry Gate registry for recursive transform calls
     */
    virtual void transform(std::size_t op_index,
                          BaseOp op,
                          std::vector<BaseOp>& circuit,
                          GateContext& ctx,
                          GateRegistry& registry) = 0;

    /**
     * Execute the operation in cleartext for witness generation
     * @param op_index Index of this operation in the circuit
     * @param op The original high-level operation
     * @param wire_val Wire values (will be modified)
     * @param ctx Execution context with runtime state
     * @param registry Gate registry for recursive execute calls
     */
    virtual void execute(std::size_t op_index,
                        const BaseOp& op,
                        std::vector<f61>& wire_val,
                        ExecuteContext& ctx,
                        GateRegistry& registry) = 0;

    /**
     * Get the operation type that this gate handles
     * @return The OPTYPE enum value
     */
    virtual OPTYPE get_type() const = 0;

    /**
     * Get a human-readable name for this gate (for debugging)
     * @return Gate name as string
     */
    virtual std::string get_name() const = 0;

protected:
    /**
     * Check if an OPTYPE is a basic unit that doesn't need further transform/execute
     * Basic units: LINEAR, MUL, MEM, ZKSET, INPUT, OUTPUT, REG
     */
    static bool is_basic_unit(OPTYPE type) {
        return type == OPTYPE::LINEAR || type == OPTYPE::MUL ||
               type == OPTYPE::MEM || type == OPTYPE::ZKSET ||
               type == OPTYPE::INPUT || type == OPTYPE::OUTPUT ||
               type == OPTYPE::REG;
    }

    /**
     * Helper: emit an operation and recursively transform it if needed
     * @param op The operation to emit
     * @param circuit The circuit being built
     * @param ctx Gate context
     * @param registry Gate registry for recursive calls
     * @return Wire ID where the result is stored
     */
    std::size_t emit_and_transform(BaseOp op, std::vector<BaseOp>& circuit,
                                   GateContext& ctx, GateRegistry& registry);

    /**
     * Helper: allocate a wire and recursively execute if needed
     * @param type The operation type
     * @param op The operation to execute
     * @param result_value The result value for this wire
     * @param wire_val Wire values array
     * @param ctx Execution context
     * @param registry Gate registry for recursive calls
     * @return Wire ID that was allocated
     */
    std::size_t alloc_and_execute(OPTYPE type, BaseOp op, f61 result_value,
                                  std::vector<f61>& wire_val, ExecuteContext& ctx,
                                  GateRegistry& registry);
};
#pragma once
#include <cstddef>
#include <cstdint>
#include <map>
#include <vector>

#include "../base_types.h"
#include "../context/gate_context.h"
#include "../translation/gate_translator.h"
#include "basic_block_parser.h"
#include "label_resolver.h"
#include "register_mapping.h"
#include "../register_layout.h"

// Forward decls
struct TranslationContext;
class BaseOp;

/**
 * PC update logic generator for tight-zkvm
 *
 * Control flow updates the PC at the end of each basic block.
 * This generator emits the gate ops needed to compute the next PC
 * given the block's control-flow type.
 */

struct PCUpdateResult {
    std::size_t new_pc_wire;                          // Wire containing the new PC value
    std::map<std::size_t, std::size_t> modified_registers; // reg_idx -> wire_idx for modified regs (e.g., %RA on CALL)

    explicit PCUpdateResult(std::size_t pc_wire) : new_pc_wire(pc_wire) {}
};

struct PCUpdateContext {
    const RegisterMapping&   reg_map;
    const LabelResolver&     label_resolver;
    uint64_t                 current_address;   // Byte address of current block
    std::size_t              pc_wire_index;    // Wire containing current PC value
    const TranslationContext& trans_ctx;       // For reading live register wires (e.g., %RA for RET)
    const RegisterLayout&     layout;          // Registers-as-RAM layout

    PCUpdateContext(const RegisterMapping& rm,
                    const LabelResolver& lr,
                    uint64_t addr,
                    std::size_t pc_wire,
                    const TranslationContext& tc,
                    const RegisterLayout& layout)
        : reg_map(rm),
          label_resolver(lr),
          current_address(addr),
          pc_wire_index(pc_wire),
          trans_ctx(tc),
          layout(layout) {}
};

class PCUpdateGenerator {
public:
    /**
     * Generate PC update operations for the end of a basic block.
     * @return PCUpdateResult with new PC wire and any modified registers.
     */
    static PCUpdateResult generate_pc_update(
        const PCUpdateContext& ctx,
        std::vector<BaseOp>& circuit,
        GateContext& gate_ctx
    );

private:
    /**
     * Handle unconditional PC update (FALL_THROUGH, JUMP, CALL).
     * If update_ra=true, sets %RA to the fallthrough byte address.
     */
    static PCUpdateResult generate_unconditional_update(
        uint64_t target_address,
        bool update_ra,
        const PCUpdateContext& ctx,
        std::vector<BaseOp>& circuit,
        GateContext& gate_ctx
    );

    /**
     * Handle conditional PC update (BNEQZ):
     * next_pc = condition ? target_address : fallthrough_address
     */
    static PCUpdateResult generate_conditional_update(
        std::size_t condition_wire,
        uint64_t target_address,
        uint64_t fallthrough_address,
        const PCUpdateContext& ctx,
        std::vector<BaseOp>& circuit,
        GateContext& gate_ctx
    );

    /**
     * Handle return PC update (RET): next_pc = %RA (live wire from trans_ctx).
     */
    static PCUpdateResult generate_return_update(
        const PCUpdateContext& ctx,
        std::vector<BaseOp>& circuit,
        GateContext& gate_ctx
    );

    /**
     * Handle indirect call (CALLR): next_pc = target_wire; also writes %RA.
     */
    static PCUpdateResult generate_indirect_call_update(
        std::size_t target_wire,
        const PCUpdateContext& ctx,
        std::vector<BaseOp>& circuit,
        GateContext& gate_ctx
    );

    /**
     * Create a constant wire holding a byte address (PC value) in the field.
     */
    static std::size_t create_pc_addr_wire(
        uint64_t address,
        std::vector<BaseOp>& circuit,
        GateContext& gate_ctx
    );

    /**
     * Conditional select: result = condition ? true_wire : false_wire.
     * Implemented via EQZ/MUL/LINEAR gadgetry.
     */
    static std::size_t create_conditional_select(
        std::size_t condition_wire,
        std::size_t true_wire,
        std::size_t false_wire,
        std::vector<BaseOp>& circuit,
        GateContext& gate_ctx
    );
};

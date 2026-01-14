#include "pc_update.h"
#include "../gates/base_gate.h"
#include <iostream>

// Ensure an architectural register has a live wire in this block.
// If it's not yet materialized in the translation context, load it from the
// RAM slot (registers-as-RAM model) and cache it as the live wire.
static std::size_t ensure_reg_live(std::size_t reg_idx,
                                   std::vector<BaseOp>& circuit,
                                   GateContext& gate_ctx,
                                   const TranslationContext& ctx_ro,
                                   TranslationContext& ctx_rw) {
    auto it = ctx_rw.register_to_wire.find(reg_idx);
    if (it != ctx_rw.register_to_wire.end()) return it->second;
    if (!ctx_rw.layout || !ctx_rw.layout->is_arch(reg_idx)) {
        return ctx_rw.get_register_wire(reg_idx);
    }
    uint64_t addr = ctx_rw.layout->slot_addr(reg_idx);
    std::size_t wire_1 = ctx_ro.register_mapping->get_wire_1_index();
    circuit.push_back(BaseOp(OPTYPE::LINEAR, {wire_1}, {f61(addr)}));
    std::size_t addr_wire = circuit.size() - 1;
    circuit.push_back(BaseOp(OPTYPE::LOAD, {addr_wire}));
    std::size_t value_wire = circuit.size() - 1;
    ctx_rw.set_register_wire(reg_idx, value_wire, /*mark_write=*/false);
    return value_wire;
}

PCUpdateResult PCUpdateGenerator::generate_pc_update(
    const PCUpdateContext& ctx,
    std::vector<BaseOp>& circuit,
    GateContext& gate_ctx
) {
    const BasicBlock* block = ctx.label_resolver.get_block_by_address(ctx.current_address);
    if (!block) {
        std::cerr << "Error: Invalid byte address 0x" << std::hex << ctx.current_address << std::dec << std::endl;
        return PCUpdateResult(SIZE_MAX);
    }

    std::string cf_type = block->control_flow_type;

    if (cf_type == "FALL_THROUGH") {
        // Simple case: PC = fallthrough address
        uint64_t next_addr = ctx.label_resolver.get_fallthrough_address(ctx.current_address);
        if (next_addr == UINT64_MAX) {
            std::cerr << "ERROR: FALL_THROUGH at address 0x" << std::hex << ctx.current_address
                      << std::dec << " has no fallthrough address! This should be HALT or RET instead." << std::endl;
            return PCUpdateResult(SIZE_MAX);
        }
        return generate_unconditional_update(next_addr, false, ctx, circuit, gate_ctx);

    } else if (cf_type == "JUMP") {
        // Unconditional jump: PC = target_address
        uint64_t target_addr = ctx.label_resolver.resolve_control_flow_target_address(ctx.current_address);
        if (target_addr == UINT64_MAX) {
            std::cerr << "ERROR: JUMP at address 0x" << std::hex << ctx.current_address
                      << std::dec << " has no target address!" << std::endl;
            return PCUpdateResult(SIZE_MAX);
        }
        return generate_unconditional_update(target_addr, false, ctx, circuit, gate_ctx);

    } else if (cf_type == "CALL") {
        // Function call: RA = fallthrough_address; PC = target_address
        uint64_t target_addr = ctx.label_resolver.resolve_control_flow_target_address(ctx.current_address);
        if (target_addr == UINT64_MAX) {
            std::cerr << "ERROR: CALL at address 0x" << std::hex << ctx.current_address
                      << std::dec << " has no target address!" << std::endl;
            return PCUpdateResult(SIZE_MAX);
        }
        return generate_unconditional_update(target_addr, true, ctx, circuit, gate_ctx);

    } else if (cf_type == "CALLR") {
        // Indirect call: need to get target from register
        // This requires examining the last instruction in the block to get the register
        if (!block->instructions.empty()) {
            const AsmInstr& last_instr = block->instructions.back();
            if (last_instr.ops.size() > 0 && last_instr.ops[0].kind == Operand::REG) {
                std::size_t target_reg_idx = last_instr.ops[0].reg_idx;
                if (target_reg_idx != SIZE_MAX) {
                    TranslationContext& tx = const_cast<TranslationContext&>(ctx.trans_ctx);
                    std::size_t target_wire = ensure_reg_live(target_reg_idx, circuit, gate_ctx, ctx.trans_ctx, tx);
                    return generate_indirect_call_update(target_wire, ctx, circuit, gate_ctx);
                }
            }
        }
        std::cerr << "Error: Invalid CALLR instruction at address 0x" << std::hex << ctx.current_address << std::dec << std::endl;
        return PCUpdateResult(SIZE_MAX);

    } else if (cf_type == "BNEQZ") {
        // Conditional branch: if (condition != 0) PC = target; else PC = fallthrough
        uint64_t target_addr = ctx.label_resolver.resolve_control_flow_target_address(ctx.current_address);
        uint64_t fallthrough_addr = ctx.label_resolver.get_fallthrough_address(ctx.current_address);

        if (target_addr == UINT64_MAX || fallthrough_addr == UINT64_MAX) {
            std::cerr << "ERROR: BNEQZ at address 0x" << std::hex << ctx.current_address
                      << std::dec << " missing target (0x" << std::hex << target_addr
                      << ") or fallthrough (0x" << fallthrough_addr << ")" << std::dec << std::endl;
            return PCUpdateResult(SIZE_MAX);
        }

        // Get condition register from BNEQZ instruction itself
        // BNEQZ %GR6, target means: if (%GR6 != 0) goto target
        std::size_t condition_reg_idx = SIZE_MAX;

        // Find the BNEQZ instruction in the block
        if (!block->instructions.empty()) {
            const auto& insns = block->instructions;
            for (const auto& ins : insns) {
                if (ins.op == "BNEQZ" && !ins.ops.empty() && ins.ops[0].kind == Operand::REG) {
                    condition_reg_idx = ins.ops[0].reg_idx;
                    break;
                }
            }
        }

        if (condition_reg_idx == SIZE_MAX) {
            std::cerr << "Error: BNEQZ instruction at address 0x" << std::hex << ctx.current_address
                      << std::dec << " has no valid register operand" << std::endl;
            return PCUpdateResult(SIZE_MAX);
        }

        TranslationContext& tx = const_cast<TranslationContext&>(ctx.trans_ctx);
        std::size_t condition_wire = ensure_reg_live(condition_reg_idx, circuit, gate_ctx, ctx.trans_ctx, tx);
        return generate_conditional_update(condition_wire, target_addr, fallthrough_addr, ctx, circuit, gate_ctx);

    } else if (cf_type == "RET") {
        // Return: PC = RA
        return generate_return_update(ctx, circuit, gate_ctx);

    } else if (cf_type == "HALT") {
        // Program termination: PC = 0xFFFFFFFE (guaranteed invalid address to stop VM)
        std::size_t pc_wire = create_pc_addr_wire(0xFFFFFFFE, circuit, gate_ctx);
        return PCUpdateResult(pc_wire);

    } else if (cf_type == "QED") {
        // QED instruction (proof end): PC = 0xFFFFFFFF (same as HALT)
        std::size_t pc_wire = create_pc_addr_wire(0xFFFFFFFF, circuit, gate_ctx);
        return PCUpdateResult(pc_wire);

    } else {
        std::cerr << "Error: Unknown control flow type: " << cf_type << std::endl;
        return PCUpdateResult(SIZE_MAX);
    }
}

PCUpdateResult PCUpdateGenerator::generate_unconditional_update(
    uint64_t target_address,
    bool update_ra,
    const PCUpdateContext& ctx,
    std::vector<BaseOp>& circuit,
    GateContext& gate_ctx
) {
    // Create wire with target address (byte address)
    std::size_t pc_wire = create_pc_addr_wire(target_address, circuit, gate_ctx);
    PCUpdateResult result(pc_wire);

    // Update return address if this is a CALL
    if (update_ra) {
        // Get fallthrough byte address (the address to return to after the call)
        uint64_t fallthrough_addr = ctx.label_resolver.get_fallthrough_address(ctx.current_address);

        // Debug logging
#ifdef DEBUG
        std::cerr << std::hex
                  << "[CALL] cur=0x" << ctx.current_address
                  << " target=0x" << target_address
                  << " RA=fallthrough=0x" << fallthrough_addr
                  << std::dec << std::endl;
#endif

        if (fallthrough_addr == UINT64_MAX) {
            std::cerr << "ERROR: CALL at address 0x" << std::hex << ctx.current_address
                      << std::dec << " has no fallthrough address!" << std::endl;
            // Don't silently default to 0 - this is a real error
            return PCUpdateResult(SIZE_MAX);
        }

        // Create wire with fallthrough byte address
        std::size_t ra_wire = create_pc_addr_wire(fallthrough_addr, circuit, gate_ctx);

        std::size_t ra_reg_idx = ctx.reg_map.get_register_index("%RA");
        if (ra_reg_idx != SIZE_MAX) {
            result.modified_registers[ra_reg_idx] = ra_wire;
#ifdef DEBUG
            std::cerr << "   [CALL] Set %RA (reg " << ra_reg_idx << ") to wire "
                      << ra_wire << " (address 0x" << std::hex << fallthrough_addr << std::dec << ")" << std::endl;
#endif
        } else {
            std::cerr << "ERROR: %RA register not found in register mapping!" << std::endl;
            return PCUpdateResult(SIZE_MAX);
        }
    }

    return result;
}

PCUpdateResult PCUpdateGenerator::generate_conditional_update(
    std::size_t condition_wire,
    uint64_t target_address,
    uint64_t fallthrough_address,
    const PCUpdateContext& ctx,
    std::vector<BaseOp>& circuit,
    GateContext& gate_ctx
) {
    // Create wires for target and fallthrough addresses
    std::size_t target_wire = create_pc_addr_wire(target_address, circuit, gate_ctx);
    std::size_t fallthrough_wire = create_pc_addr_wire(fallthrough_address, circuit, gate_ctx);

    // Create conditional selection: result = condition ? target : fallthrough
    std::size_t pc_wire = create_conditional_select(condition_wire, target_wire, fallthrough_wire, circuit, gate_ctx);
    return PCUpdateResult(pc_wire);
}

PCUpdateResult PCUpdateGenerator::generate_return_update(
    const PCUpdateContext& ctx,
    std::vector<BaseOp>& circuit,
    GateContext& gate_ctx
) {
    // Get return address register index
    std::size_t ra_reg_idx = ctx.reg_map.get_register_index("%RA");
    if (ra_reg_idx == SIZE_MAX) {
        std::cerr << "Error: Return address register not found" << std::endl;
        return PCUpdateResult(SIZE_MAX);
    }

    TranslationContext& tx = const_cast<TranslationContext&>(ctx.trans_ctx);
    std::size_t pc_wire = ensure_reg_live(ra_reg_idx, circuit, gate_ctx, ctx.trans_ctx, tx);

    // Debug logging
#ifdef DEBUG
    std::cerr << std::hex
              << "[RET] cur=0x" << ctx.current_address
              << " returning via %RA (reg " << std::dec << ra_reg_idx
              << ") live wire=" << pc_wire
              << std::hex << std::dec << std::endl;
#endif

    return PCUpdateResult(pc_wire);
}

PCUpdateResult PCUpdateGenerator::generate_indirect_call_update(
    std::size_t target_wire,
    const PCUpdateContext& ctx,
    std::vector<BaseOp>& circuit,
    GateContext& gate_ctx
) {
    PCUpdateResult result(target_wire);

    // Update return address for CALLR
    uint64_t fallthrough_addr = ctx.label_resolver.get_fallthrough_address(ctx.current_address);

    // Debug logging
#ifdef DEBUG
    std::cerr << std::hex
              << "[CALLR] cur=0x" << ctx.current_address
              << " target=wire " << std::dec << target_wire
              << " RA=fallthrough=0x" << std::hex << fallthrough_addr
              << std::dec << std::endl;
#endif

    if (fallthrough_addr == UINT64_MAX) {
        std::cerr << "ERROR: CALLR at address 0x" << std::hex << ctx.current_address
                  << std::dec << " has no fallthrough address!" << std::endl;
        return PCUpdateResult(SIZE_MAX);
    }

    // Create wire with fallthrough byte address
    std::size_t ra_wire = create_pc_addr_wire(fallthrough_addr, circuit, gate_ctx);

    std::size_t ra_reg_idx = ctx.reg_map.get_register_index("%RA");
    if (ra_reg_idx != SIZE_MAX) {
        result.modified_registers[ra_reg_idx] = ra_wire;
#ifdef DEBUG
        std::cerr << "   [CALLR] Set %RA (reg " << ra_reg_idx << ") to wire "
                  << ra_wire << " (address 0x" << std::hex << fallthrough_addr << std::dec << ")" << std::endl;
#endif
    } else {
        std::cerr << "ERROR: %RA register not found in register mapping!" << std::endl;
        return PCUpdateResult(SIZE_MAX);
    }

    return result;
}

std::size_t PCUpdateGenerator::create_pc_addr_wire(
    uint64_t address,
    std::vector<BaseOp>& circuit,
    GateContext& gate_ctx
) {
    // Create a LINEAR operation with the byte address as a constant
    // Use wire_1 (constant 1) multiplied by address to create the constant value
    circuit.push_back(BaseOp(OPTYPE::LINEAR, {gate_ctx.wire_1}, {f61(address)}));
    return circuit.size() - 1;
}

std::size_t PCUpdateGenerator::create_conditional_select(
    std::size_t condition_wire,
    std::size_t true_wire,
    std::size_t false_wire,
    std::vector<BaseOp>& circuit,
    GateContext& gate_ctx
) {
    // Implement: result = condition ? true_wire : false_wire
    // Pattern: if (condition != 0) result = true_wire; else result = false_wire

    // Step 1: Create EQZ to check if condition is zero: is_zero = (condition == 0)
    // EQZ returns 1 if input is 0, else returns 0
    circuit.push_back(BaseOp(OPTYPE::EQZ, {condition_wire}));
    std::size_t is_zero_wire = circuit.size() - 1;

    // Step 2: Compute term1 = is_zero * false_wire
    circuit.push_back(BaseOp(OPTYPE::MUL, {is_zero_wire, false_wire}));
    std::size_t term1 = circuit.size() - 1;

    // Step 3: Compute (1 - is_zero)
    circuit.push_back(BaseOp(OPTYPE::LINEAR, {is_zero_wire, gate_ctx.wire_1},
                             {f61::minor(1), 1}));
    std::size_t one_minus_is_zero = circuit.size() - 1;

    // Step 4: Compute term2 = (1 - is_zero) * true_wire
    circuit.push_back(BaseOp(OPTYPE::MUL, {one_minus_is_zero, true_wire}));
    std::size_t term2 = circuit.size() - 1;

    // Step 5: Compute result = term1 + term2
    // This gives: is_zero * false_wire + (1 - is_zero) * true_wire
    circuit.push_back(BaseOp(OPTYPE::LINEAR, {term1, term2}, {1, 1}));
    std::size_t result_wire = circuit.size() - 1;

    return result_wire;
}

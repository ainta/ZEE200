#include "gate_translator.h"
#include "../parsing/asm_parser.cpp"  // Include for actual struct definitions
#include "../gates/all_gates.h"
#include "../rom_offsets.h"
#include <iostream>
#include <cassert>

// Helper: Resolve register index from operand, handling cases where parser didn't set reg_idx
static inline std::size_t resolve_reg_idx_or_die(const Operand& op, TranslationContext& tx) {
    if (op.kind != Operand::REG) return SIZE_MAX;
    if (op.reg_idx != SIZE_MAX)  return op.reg_idx;
    if (!op.reg.empty() && tx.register_mapping) return tx.register_mapping->get_register_index(op.reg);
    return SIZE_MAX;
}

bool GateTranslator::translate_instruction(
    const AsmInstr& instr,
    std::size_t output_wire,
    std::vector<BaseOp>& circuit,
    GateContext& gate_ctx,
    TranslationContext& trans_ctx
) {
    InstrType type = InstructionClassifier::classify(instr.op);
    
    switch (type) {
        case InstrType::ARITHMETIC:
            return translate_arithmetic(instr, output_wire, circuit, gate_ctx, trans_ctx);
        case InstrType::LOGIC:
            return translate_logic(instr, output_wire, circuit, gate_ctx, trans_ctx);
        case InstrType::MEMORY:
            return translate_memory(instr, output_wire, circuit, gate_ctx, trans_ctx);
        case InstrType::COPY:
            return translate_copy(instr, output_wire, circuit, gate_ctx, trans_ctx);
        case InstrType::COMPARE:
            return translate_compare(instr, output_wire, circuit, gate_ctx, trans_ctx);
        case InstrType::DIVIDE:
            return translate_divide(instr, output_wire, circuit, gate_ctx, trans_ctx);
        case InstrType::SHIFT:
            return translate_shift(instr, output_wire, circuit, gate_ctx, trans_ctx);
        case InstrType::IO:
            return translate_io(instr, output_wire, circuit, gate_ctx, trans_ctx);
        case InstrType::SPECIAL:
            // Handle NOP, VMCALL, etc.
            if (instr.op == "NOP") {
                // NOP generates no operations
                return true;
            }
            if (instr.op == "OUTPUT") {
                // OUTPUT is treated like NOP in zkvm (only used in cleartext)
                return true;
            }
            if (instr.op == "VMCALL") {
                return translate_vmcall(instr, output_wire, circuit, gate_ctx, trans_ctx);
            }
            std::cerr << "Unhandled special instruction: " << instr.op << std::endl;
            return false;
        case InstrType::CONTROL:
            // Control flow handled separately by control_flow.cpp
            std::cerr << "Control flow instructions should be handled separately: " << instr.op << std::endl;
            return false;
        case InstrType::UNKNOWN:
        default:
            std::cerr << "Unknown instruction: " << instr.op << std::endl;
            return false;
    }
}

bool GateTranslator::translate_arithmetic(
    const AsmInstr& instr,
    std::size_t output_wire,
    std::vector<BaseOp>& circuit,
    GateContext& gate_ctx,
    TranslationContext& trans_ctx
) {
    if (instr.op == "ADD" || instr.op == "ADDI") {
        if (instr.ops.size() != 3) {
            std::cerr << "ADD/ADDI requires 3 operands" << std::endl;
            return false;
        }
        
        // Get operand wires
        std::size_t src1_wire = get_operand_wire(instr.ops[1], circuit, gate_ctx, trans_ctx);
        std::size_t src2_wire = get_operand_wire(instr.ops[2], circuit, gate_ctx, trans_ctx);

        // Create ADD32 operation (will be transformed later by transform_circuit)
        circuit.push_back(BaseOp(OPTYPE::ADD32, {src1_wire, src2_wire}));
        std::size_t result_wire = circuit.size() - 1;

        // Update register tracking if destination is a register
        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) {
                trans_ctx.set_register_wire(dst_reg_idx, result_wire);
            }
        }

        return true;
    }
    
    if (instr.op == "SUB" || instr.op == "SUBI") {
        if (instr.ops.size() != 3) {
            std::cerr << "SUB/SUBI requires 3 operands" << std::endl;
            return false;
        }

        std::size_t src1_wire = get_operand_wire(instr.ops[1], circuit, gate_ctx, trans_ctx);
        std::size_t src2_wire = get_operand_wire(instr.ops[2], circuit, gate_ctx, trans_ctx);

        circuit.push_back(BaseOp(OPTYPE::SUB32, {src1_wire, src2_wire}));
        std::size_t result_wire = circuit.size() - 1;

        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) {
                trans_ctx.set_register_wire(dst_reg_idx, result_wire);
            }
        }

        return true;
    }
    
    if (instr.op == "MUL" || instr.op == "MULI") {
        if (instr.ops.size() != 3) {
            std::cerr << "MUL/MULI requires 3 operands" << std::endl;
            return false;
        }

        std::size_t src1_wire = get_operand_wire(instr.ops[1], circuit, gate_ctx, trans_ctx);
        std::size_t src2_wire = get_operand_wire(instr.ops[2], circuit, gate_ctx, trans_ctx);

        circuit.push_back(BaseOp(OPTYPE::MUL32, {src1_wire, src2_wire}));
        std::size_t result_wire = circuit.size() - 1;

        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) {
                trans_ctx.set_register_wire(dst_reg_idx, result_wire);
            }
        }

        return true;
    }
    
    std::cerr << "Unhandled arithmetic instruction: " << instr.op << std::endl;
    return false;
}

bool GateTranslator::translate_logic(
    const AsmInstr& instr,
    std::size_t output_wire,
    std::vector<BaseOp>& circuit,
    GateContext& gate_ctx,
    TranslationContext& trans_ctx
) {
    if (instr.ops.size() != 3) {
        std::cerr << "Logic instructions require 3 operands" << std::endl;
        return false;
    }

    const std::string& op = instr.op;
    bool is_immediate =
        (op == "ANDI" || op == "ORI" || op == "XORI");

    // First source operand is always a register or memory operand.
    std::size_t src1_wire = get_operand_wire(instr.ops[1], circuit, gate_ctx, trans_ctx);
    std::size_t result_wire = SIZE_MAX;

    if (is_immediate) {
        // Immediate form: use dedicated immediate-aware gates with one input wire
        OPTYPE op_type;
        if (op == "ANDI") {
            op_type = OPTYPE::AND32I;
        } else if (op == "ORI") {
            op_type = OPTYPE::OR32I;
        } else {  // "XORI"
            op_type = OPTYPE::XOR32I;
        }

        if (instr.ops[2].kind != Operand::IMM) {
            std::cerr << op << " expected immediate as third operand" << std::endl;
            return false;
        }

        // Match immediate encoding used elsewhere: 32-bit two's-complement.
        int64_t raw_imm = instr.ops[2].imm;
        uint32_t imm32 = static_cast<uint32_t>(static_cast<int32_t>(raw_imm));

        BaseOp logic_op(op_type, {src1_wire});
        logic_op.imm = imm32;
        circuit.push_back(logic_op);
        result_wire = circuit.size() - 1;
    } else {
        // Register-register form: use existing 2-input gates
        std::size_t src2_wire = get_operand_wire(instr.ops[2], circuit, gate_ctx, trans_ctx);

        OPTYPE op_type;
        if (op == "AND") {
            op_type = OPTYPE::AND32;
        } else if (op == "OR") {
            op_type = OPTYPE::OR32;
        } else if (op == "XOR") {
            op_type = OPTYPE::XOR32;
        } else {
            std::cerr << "Unhandled logic instruction: " << op << std::endl;
            return false;
        }

        circuit.push_back(BaseOp(op_type, {src1_wire, src2_wire}));
        result_wire = circuit.size() - 1;
    }

    if (instr.ops[0].kind == Operand::REG) {
        std::size_t dst_reg_idx = instr.ops[0].reg_idx;
        if (dst_reg_idx != SIZE_MAX) {
            trans_ctx.set_register_wire(dst_reg_idx, result_wire);
        }
    }

    return true;
}

bool GateTranslator::translate_memory(
    const AsmInstr& instr,
    std::size_t output_wire,
    std::vector<BaseOp>& circuit,
    GateContext& gate_ctx,
    TranslationContext& trans_ctx
) {
    if (instr.op == "LOAD") {
        if (instr.ops.size() != 2) {
            std::cerr << "LOAD requires 2 operands" << std::endl;
            return false;
        }

        // Resolve memory address (already word-aligned, multiple of 4)
        std::size_t addr_wire = resolve_memory_address(instr.ops[1], circuit, gate_ctx, trans_ctx);

        // LOAD uses byte addresses directly as RAM index
        // RAM is sparsely indexed: only addresses 0, 4, 8, 12, ... are used
        circuit.push_back(BaseOp(OPTYPE::LOAD, {addr_wire}));
        std::size_t result_wire = circuit.size() - 1;

        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) {
                trans_ctx.set_register_wire(dst_reg_idx, result_wire);
            }
        }

        return true;
    }

    if (instr.op == "STORE") {
        if (instr.ops.size() != 2) {
            std::cerr << "STORE requires 2 operands" << std::endl;
            return false;
        }

        std::size_t value_wire = get_operand_wire(instr.ops[0], circuit, gate_ctx, trans_ctx);

        // Resolve memory address (already word-aligned, multiple of 4)
        std::size_t addr_wire = resolve_memory_address(instr.ops[1], circuit, gate_ctx, trans_ctx);

        // STORE uses byte addresses directly as RAM index
        // RAM is sparsely indexed: only addresses 0, 4, 8, 12, ... are used
        circuit.push_back(BaseOp(OPTYPE::STORE, {addr_wire, value_wire}));
        // STORE doesn't produce a result register

        return true;
    }

    if (instr.op == "LOADB") {
        // Load byte with sign extension - use recursive LOADB gate
        if (instr.ops.size() != 2) {
            std::cerr << "LOADB requires 2 operands" << std::endl;
            return false;
        }

        std::size_t addr_wire = resolve_memory_address(instr.ops[1], circuit, gate_ctx, trans_ctx);
        circuit.push_back(BaseOp(OPTYPE::LOADB, {addr_wire}));
        std::size_t result_wire = circuit.size() - 1;

        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) {
                trans_ctx.set_register_wire(dst_reg_idx, result_wire);
            }
        }
        return true;
    }


    if (instr.op == "ULOADB") {
        // Load byte without sign extension (zero extend) - use recursive ULOADB gate
        if (instr.ops.size() != 2) {
            std::cerr << "ULOADB requires 2 operands" << std::endl;
            return false;
        }

        std::size_t addr_wire = resolve_memory_address(instr.ops[1], circuit, gate_ctx, trans_ctx);
        circuit.push_back(BaseOp(OPTYPE::ULOADB, {addr_wire}));
        std::size_t result_wire = circuit.size() - 1;

        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) {
                trans_ctx.set_register_wire(dst_reg_idx, result_wire);
            }
        }
        return true;
    }
    if (instr.op == "STOREB") {
        // Store byte - use recursive STOREB gate
        if (instr.ops.size() != 2) {
            std::cerr << "STOREB requires 2 operands" << std::endl;
            return false;
        }

        std::size_t value_wire = get_operand_wire(instr.ops[0], circuit, gate_ctx, trans_ctx);
        std::size_t addr_wire = resolve_memory_address(instr.ops[1], circuit, gate_ctx, trans_ctx);
        circuit.push_back(BaseOp(OPTYPE::STOREB, {addr_wire, value_wire}));
        // STOREB doesn't produce a result register
        return true;
    }
    

    if (instr.op == "LOADH") {
        // Load halfword with sign extension - use recursive LOADH gate
        if (instr.ops.size() != 2) {
            std::cerr << "LOADH requires 2 operands" << std::endl;
            return false;
        }

        std::size_t addr_wire = resolve_memory_address(instr.ops[1], circuit, gate_ctx, trans_ctx);
        circuit.push_back(BaseOp(OPTYPE::LOADH, {addr_wire}));
        std::size_t result_wire = circuit.size() - 1;

        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst = instr.ops[0].reg_idx;
            if (dst != SIZE_MAX) trans_ctx.set_register_wire(dst, result_wire);
        }
        return true;
    }
    

    if (instr.op == "ULOADH") {
        // Load halfword without sign extension - use recursive ULOADH gate
        if (instr.ops.size() != 2) {
            std::cerr << "ULOADH requires 2 operands" << std::endl;
            return false;
        }

        std::size_t addr_wire = resolve_memory_address(instr.ops[1], circuit, gate_ctx, trans_ctx);
        circuit.push_back(BaseOp(OPTYPE::ULOADH, {addr_wire}));
        std::size_t result_wire = circuit.size() - 1;

        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst = instr.ops[0].reg_idx;
            if (dst != SIZE_MAX) trans_ctx.set_register_wire(dst, result_wire);
        }
        return true;
    }
    

    if (instr.op == "STOREH") {
        if (instr.ops.size() != 2) {
            std::cerr << "STOREH requires 2 operands" << std::endl;
            return false;
        }

        std::size_t value_wire = get_operand_wire(instr.ops[0], circuit, gate_ctx, trans_ctx);
        std::size_t addr_wire = resolve_memory_address(instr.ops[1], circuit, gate_ctx, trans_ctx);
        circuit.push_back(BaseOp(OPTYPE::STOREH, {addr_wire, value_wire}));

        return true;
    }
    

    std::cerr << "Unhandled memory instruction: " << instr.op << std::endl;
    return false;
}

bool GateTranslator::translate_copy(
    const AsmInstr& instr,
    std::size_t output_wire,
    std::vector<BaseOp>& circuit,
    GateContext& gate_ctx,
    TranslationContext& trans_ctx
) {
    // Check operand count (CMOV has 3 operands, others have 2)
    if (instr.op != "CMOV" && instr.ops.size() != 2) {
        std::cerr << "Copy instructions require 2 operands" << std::endl;
        return false;
    }

    if (instr.op == "COPYR") {
        // Copy register to register
        std::size_t src_wire = get_operand_wire(instr.ops[1], circuit, gate_ctx, trans_ctx);
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {src_wire}, {1}));
        std::size_t result_wire = circuit.size() - 1;

        // CRITICAL FIX: Update trans_ctx so destination register points to this wire
        // This is essential for epilogue: COPYR %SP, %FP must update trans_ctx[%SP]!
        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) {
                trans_ctx.set_register_wire(dst_reg_idx, result_wire);
            }
        }
        return true;
    }

    if (instr.op == "COPYI") {
        // Copy immediate to register
        std::size_t imm_wire = create_immediate_wire(instr.ops[1].imm, circuit, trans_ctx);
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {imm_wire}, {1}));
        std::size_t result_wire = circuit.size() - 1;

        // CRITICAL FIX: Update trans_ctx so destination register points to this wire
        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) {
                trans_ctx.set_register_wire(dst_reg_idx, result_wire);
            }
        }
        return true;
    }

    if (instr.op == "CMOV") {
        // Conditional move: CMOV dst, cond, src
        // dst = cond ? src : dst_old
        // Equivalent to: dst = cond * src + (1 - cond) * dst_old
        if (instr.ops.size() != 3) {
            std::cerr << "CMOV requires 3 operands" << std::endl;
            return false;
        }

        std::size_t cond_wire = get_operand_wire(instr.ops[1], circuit, gate_ctx, trans_ctx);
        std::size_t src_wire = get_operand_wire(instr.ops[2], circuit, gate_ctx, trans_ctx);

        // Get the old value of dst register
        std::size_t dst_old_wire;
        if (instr.ops[0].kind == Operand::REG) {
            dst_old_wire = trans_ctx.get_register_wire(instr.ops[0].reg_idx);
        } else {
            std::cerr << "CMOV destination must be a register" << std::endl;
            return false;
        }

        // Implement: result = cond * src + (1 - cond) * dst_old
        // First compute: 1 - cond
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {gate_ctx.wire_1, cond_wire}, {1, f61::minor(1)}));
        std::size_t one_minus_cond = circuit.size() - 1;

        // cond * src
        circuit.push_back(BaseOp(OPTYPE::MUL, {cond_wire, src_wire}));
        std::size_t cond_times_src = circuit.size() - 1;

        // (1 - cond) * dst_old
        circuit.push_back(BaseOp(OPTYPE::MUL, {one_minus_cond, dst_old_wire}));
        std::size_t not_cond_times_old = circuit.size() - 1;

        // result = cond_times_src + not_cond_times_old
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {cond_times_src, not_cond_times_old}, {1, 1}));
        std::size_t result_wire = circuit.size() - 1;

        // Track destination register wire
        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) {
                trans_ctx.set_register_wire(dst_reg_idx, result_wire);
            }
        }

        return true;
    }

    if (instr.op == "COPYG") {
        // Copy from global/data section (typically a constant/ROM address)
        // COPYG dst, symbol or COPYG dst, offset
        std::size_t value_to_copy;

        // In COPYG handling:
        if (instr.ops[1].kind == Operand::SYM) {
            // Symbol reference - resolve to address or constant
            // First check text section labels (now BYTE addresses)
            auto it = trans_ctx.label_to_pc.find(instr.ops[1].sym);
            if (it != trans_ctx.label_to_pc.end()) {
                value_to_copy = it->second; // BYTE address
            } else {
                // Check data section symbols
                auto data_it = trans_ctx.data_symbols.find(instr.ops[1].sym);
                if (data_it != trans_ctx.data_symbols.end()) {
                    value_to_copy = data_it->second; // BYTE address in .data
                } else {
                    std::cerr << "Warning: Unresolved COPYG symbol "
                            << instr.ops[1].sym << ", using 0" << std::endl;
                    value_to_copy = 0;
                }
            }
        } else {
            value_to_copy = instr.ops[1].imm;
        }


        // Create the copy operation
        std::size_t imm_wire = create_immediate_wire(value_to_copy, circuit, trans_ctx);
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {imm_wire}, {1}));
        std::size_t result_wire = circuit.size() - 1;

        // CRITICAL FIX: Update trans_ctx for destination register
        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) {
                trans_ctx.set_register_wire(dst_reg_idx, result_wire);
            }
        }

        return true;
    }

    std::cerr << "Unhandled copy instruction: " << instr.op << std::endl;
    return false;
}

bool GateTranslator::translate_compare(
    const AsmInstr& instr,
    std::size_t output_wire,
    std::vector<BaseOp>& circuit,
    GateContext& gate_ctx,
    TranslationContext& trans_ctx
) {
    if (instr.op == "EQZ") {
        if (instr.ops.size() != 2) {
            std::cerr << "EQZ requires 2 operands" << std::endl;
            return false;
        }

        std::size_t src_wire = get_operand_wire(instr.ops[1], circuit, gate_ctx, trans_ctx);
        circuit.push_back(BaseOp(OPTYPE::EQZ, {src_wire}));
        std::size_t result_wire = circuit.size() - 1;

        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) {
                trans_ctx.set_register_wire(dst_reg_idx, result_wire);
            }
        }

        return true;
    }

    if (instr.op == "EQ") {
        if (instr.ops.size() != 3) {
            std::cerr << "EQ requires 3 operands" << std::endl;
            return false;
        }

        std::size_t src1_wire = get_operand_wire(instr.ops[1], circuit, gate_ctx, trans_ctx);
        std::size_t src2_wire = get_operand_wire(instr.ops[2], circuit, gate_ctx, trans_ctx);

        // EQ: result = (src1 == src2) - expand to SUB32 then EQZ
        circuit.push_back(BaseOp(OPTYPE::SUB32, {src1_wire, src2_wire}));
        std::size_t diff_wire = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::EQZ, {diff_wire}));
        std::size_t result_wire = circuit.size() - 1;

        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) {
                trans_ctx.set_register_wire(dst_reg_idx, result_wire);
            }
        }

        return true;
    }

    if (instr.op == "NEQ") {
        if (instr.ops.size() != 3) {
            std::cerr << "NEQ requires 3 operands" << std::endl;
            return false;
        }

        std::size_t src1_wire = get_operand_wire(instr.ops[1], circuit, gate_ctx, trans_ctx);
        std::size_t src2_wire = get_operand_wire(instr.ops[2], circuit, gate_ctx, trans_ctx);

        // NEQ: result = (src1 != src2) = 1 - EQZ(src1 - src2)
        circuit.push_back(BaseOp(OPTYPE::SUB32, {src1_wire, src2_wire}));
        std::size_t diff_wire = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::EQZ, {diff_wire}));
        std::size_t eqz_wire = circuit.size() - 1;

        // NEQ = 1 - EQZ
        std::size_t wire_1 = trans_ctx.register_mapping->get_wire_1_index();
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {wire_1, eqz_wire}, {1, f61::minor(1)}));
        std::size_t result_wire = circuit.size() - 1;

        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) {
                trans_ctx.set_register_wire(dst_reg_idx, result_wire);
            }
        }

        return true;
    }

    if (instr.op == "ULT" || instr.op == "ULTE" || instr.op == "LT" || instr.op == "LTE") {
        if (instr.ops.size() != 3) {
            std::cerr << instr.op << " requires 3 operands" << std::endl;
            return false;
        }

        std::size_t src1_wire = get_operand_wire(instr.ops[1], circuit, gate_ctx, trans_ctx);
        std::size_t src2_wire = get_operand_wire(instr.ops[2], circuit, gate_ctx, trans_ctx);


        std::size_t result_wire;
        if (instr.op == "ULT") {
            circuit.push_back(BaseOp(OPTYPE::ULT, {src1_wire, src2_wire}));
            result_wire = circuit.size() - 1;
        } else if (instr.op == "ULTE") {
            circuit.push_back(BaseOp(OPTYPE::ULT, {src2_wire, src1_wire}));
            std::size_t ugt_wire = circuit.size() - 1;
            circuit.push_back(BaseOp(OPTYPE::LINEAR, {gate_ctx.wire_1, ugt_wire}, {1, f61::minor(1)}));
            result_wire = circuit.size() - 1;
        } else if (instr.op == "LT") {
            circuit.push_back(BaseOp(OPTYPE::LT, {src1_wire, src2_wire}));
            result_wire = circuit.size() - 1;
        } else {
            circuit.push_back(BaseOp(OPTYPE::LT, {src2_wire, src1_wire}));
            std::size_t gt_wire = circuit.size() - 1;
            circuit.push_back(BaseOp(OPTYPE::LINEAR, {gate_ctx.wire_1, gt_wire}, {1, f61::minor(1)}));
            result_wire = circuit.size() - 1;
        }
        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) {
                trans_ctx.set_register_wire(dst_reg_idx, result_wire);
            }
        }

        return true;
    }

    std::cerr << "Unhandled compare instruction: " << instr.op << std::endl;
    return false;
}

bool GateTranslator::translate_divide(
    const AsmInstr& instr,
    std::size_t output_wire,
    std::vector<BaseOp>& circuit,
    GateContext& gate_ctx,
    TranslationContext& trans_ctx
) {
    if (instr.ops.size() != 3) {
        std::cerr << "Divide instructions require 3 operands" << std::endl;
        return false;
    }
    
    std::size_t src1_wire = get_operand_wire(instr.ops[1], circuit, gate_ctx, trans_ctx);
    std::size_t src2_wire = get_operand_wire(instr.ops[2], circuit, gate_ctx, trans_ctx);
    
    // Unsigned division (register or immediate divisor)
    if (instr.op == "UDIV" || instr.op == "UDIVI") {
        circuit.push_back(BaseOp(OPTYPE::UDIV, {src1_wire, src2_wire}));
        std::size_t result_wire = circuit.size() - 1;

        // Track destination register wire
        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) {
                trans_ctx.set_register_wire(dst_reg_idx, result_wire);
            }
        }
        return true;
    }

    // Unsigned remainder
    if (instr.op == "UREM" || instr.op == "UREMI") {
        circuit.push_back(BaseOp(OPTYPE::UREM, {src1_wire, src2_wire}));
        std::size_t result_wire = circuit.size() - 1;

        // Track destination register wire
        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) {
                trans_ctx.set_register_wire(dst_reg_idx, result_wire);
            }
        }
        return true;
    }

    // Signed division and remainder: SDIV, SDIVI, SREM, SREMI
    // Optimized: Use field arithmetic instead of SUB32 for negation
    // Key insight: abs_a = a + sign_a * (2^32 - 2*a) works because:
    //   - If sign_a = 0: abs_a = a (correct for non-negative)
    //   - If sign_a = 1: abs_a = a + 2^32 - 2*a = 2^32 - a (two's complement negation)
    // No range check needed since inputs are already in [0, 2^32)
    if (instr.op == "SDIV" || instr.op == "SDIVI" ||
        instr.op == "SREM" || instr.op == "SREMI") {

        bool wants_quotient = (instr.op == "SDIV" || instr.op == "SDIVI");

        // Sign bits of a and b (most significant bit)
        circuit.push_back(BaseOp(OPTYPE::MSB, {src1_wire}));
        std::size_t sign_a = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::MSB, {src2_wire}));
        std::size_t sign_b = circuit.size() - 1;

        // Absolute value of a using field arithmetic (no SUB32 needed)
        // diff_a = 2^32 - 2*a, then abs_a = a + sign_a * diff_a
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {gate_ctx.wire_1, src1_wire},
                                 {1ULL << 32, f61::minor(2)}));
        std::size_t diff_a = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::MUL, {sign_a, diff_a}));
        std::size_t sign_a_times_diff_a = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::LINEAR, {src1_wire, sign_a_times_diff_a}, {1, 1}));
        std::size_t abs_a = circuit.size() - 1;

        // Absolute value of b using field arithmetic (no SUB32 needed)
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {gate_ctx.wire_1, src2_wire},
                                 {1ULL << 32, f61::minor(2)}));
        std::size_t diff_b = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::MUL, {sign_b, diff_b}));
        std::size_t sign_b_times_diff_b = circuit.size() - 1;

        circuit.push_back(BaseOp(OPTYPE::LINEAR, {src2_wire, sign_b_times_diff_b}, {1, 1}));
        std::size_t abs_b = circuit.size() - 1;

        std::size_t result_wire = SIZE_MAX;

        if (wants_quotient) {
            // SDIV/SDIVI: use one unsigned division on |a|, |b|
            circuit.push_back(BaseOp(OPTYPE::UDIV, {abs_a, abs_b}));
            std::size_t q_unsigned = circuit.size() - 1;

            // sign_q = sign_a XOR sign_b
            // For bits in {0,1}: xor = a + b - 2ab
            circuit.push_back(BaseOp(OPTYPE::MUL, {sign_a, sign_b}));
            std::size_t ab = circuit.size() - 1;

            circuit.push_back(BaseOp(OPTYPE::LINEAR,
                                     {sign_a, sign_b, ab},
                                     {1, 1, f61::minor(2)}));
            std::size_t sign_q = circuit.size() - 1;

            // Apply sign to quotient using field arithmetic (no SUB32 needed)
            // diff_q = 2^32 - 2*q, then result = q + sign_q * diff_q
            circuit.push_back(BaseOp(OPTYPE::LINEAR, {gate_ctx.wire_1, q_unsigned},
                                     {1ULL << 32, f61::minor(2)}));
            std::size_t diff_q = circuit.size() - 1;

            circuit.push_back(BaseOp(OPTYPE::MUL, {sign_q, diff_q}));
            std::size_t sign_q_times_diff_q = circuit.size() - 1;

            circuit.push_back(BaseOp(OPTYPE::LINEAR, {q_unsigned, sign_q_times_diff_q}, {1, 1}));
            result_wire = circuit.size() - 1;
        } else {
            // SREM/SREMI: use one unsigned remainder on |a|, |b|
            circuit.push_back(BaseOp(OPTYPE::UREM, {abs_a, abs_b}));
            std::size_t r_unsigned = circuit.size() - 1;

            // Apply sign to remainder using field arithmetic (no SUB32 needed)
            // Remainder has same sign as dividend (sign_a)
            // diff_r = 2^32 - 2*r, then result = r + sign_a * diff_r
            circuit.push_back(BaseOp(OPTYPE::LINEAR, {gate_ctx.wire_1, r_unsigned},
                                     {1ULL << 32, f61::minor(2)}));
            std::size_t diff_r = circuit.size() - 1;

            circuit.push_back(BaseOp(OPTYPE::MUL, {sign_a, diff_r}));
            std::size_t sign_a_times_diff_r = circuit.size() - 1;

            circuit.push_back(BaseOp(OPTYPE::LINEAR, {r_unsigned, sign_a_times_diff_r}, {1, 1}));
            result_wire = circuit.size() - 1;
        }

        // Track destination register wire
        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) {
                trans_ctx.set_register_wire(dst_reg_idx, result_wire);
            }
        }

        return true;
    }
    
    std::cerr << "Unhandled divide instruction: " << instr.op << std::endl;
    return false;
}

bool GateTranslator::translate_shift(
    const AsmInstr& instr,
    std::size_t output_wire,
    std::vector<BaseOp>& circuit,
    GateContext& gate_ctx,
    TranslationContext& trans_ctx
) {
    if (instr.op == "SRLI") {
        if (instr.ops.size() != 3) {
            std::cerr << "SRLI requires 3 operands" << std::endl;
            return false;
        }
        std::size_t src1_wire = get_operand_wire(instr.ops[1], circuit, gate_ctx, trans_ctx);
        BaseOp srli_op(OPTYPE::SRLI, {src1_wire});
        srli_op.imm = instr.ops[2].imm; // Store shift amount as immediate
        circuit.push_back(srli_op);
        std::size_t result_wire = circuit.size() - 1;

        // Track destination register wire
        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) {
                trans_ctx.set_register_wire(dst_reg_idx, result_wire);
            }
        }
        return true;
    }

    if (instr.op == "SRL") {
        // dst, src, shamt(reg)
        if (instr.ops.size() != 3) {
            std::cerr << "SRL requires 3 operands" << std::endl;
            return false;
        }
        std::size_t src1_wire = get_operand_wire(instr.ops[1], circuit, gate_ctx, trans_ctx);
        std::size_t shamt_wire = get_operand_wire(instr.ops[2], circuit, gate_ctx, trans_ctx);
        circuit.push_back(BaseOp(OPTYPE::POW2, {shamt_wire}));
        std::size_t pow_wire = circuit.size() - 1;
        circuit.push_back(BaseOp(OPTYPE::UDIV, {src1_wire, pow_wire}));
        std::size_t result_wire = circuit.size() - 1;
        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) trans_ctx.set_register_wire(dst_reg_idx, result_wire);
        }
        return true;
    }

    if (instr.op == "SHLI") {
        if (instr.ops.size() != 3) {
            std::cerr << "SHLI requires 3 operands" << std::endl;
            return false;
        }
        // dst, src, imm (imm in [0,31])
        std::size_t src1_wire = get_operand_wire(instr.ops[1], circuit, gate_ctx, trans_ctx);
        uint32_t k = static_cast<uint32_t>(instr.ops[2].imm); // 0..31
        std::size_t pow_const = create_immediate_wire(1LL << k, circuit, trans_ctx);
        circuit.push_back(BaseOp(OPTYPE::MUL32, {src1_wire, pow_const}));
        std::size_t result_wire = circuit.size() - 1;
    
        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) trans_ctx.set_register_wire(dst_reg_idx, result_wire);
        }
        return true;
    }
    
    if (instr.op == "SHL") {
        // dst, src, shamt(reg)
        if (instr.ops.size() != 3) {
            std::cerr << "SHL requires 3 operands" << std::endl;
            return false;
        }
        std::size_t src1_wire   = get_operand_wire(instr.ops[1], circuit, gate_ctx, trans_ctx);
        std::size_t shamt_wire  = get_operand_wire(instr.ops[2], circuit, gate_ctx, trans_ctx);
        // shamt is already 0..31 by assumption
    
        // pow = 2^shamt
        circuit.push_back(BaseOp(OPTYPE::POW2, {shamt_wire}));
        std::size_t pow_wire = circuit.size() - 1;
    
        // result = src * pow
        circuit.push_back(BaseOp(OPTYPE::MUL32, {src1_wire, pow_wire}));
        std::size_t result_wire = circuit.size() - 1;
    
        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) trans_ctx.set_register_wire(dst_reg_idx, result_wire);
        }
        return true;
    }

    if (instr.op == "SRAI") {
        if (instr.ops.size() != 3) {
            std::cerr << "SRAI requires 3 operands" << std::endl;
            return false;
        }
        std::size_t src1_wire = get_operand_wire(instr.ops[1], circuit, gate_ctx, trans_ctx);
        int64_t shift_amount = (instr.ops[2].kind == Operand::IMM) ? instr.ops[2].imm : 0;
        BaseOp srai_op(OPTYPE::SRAI, {src1_wire});
        srai_op.imm = shift_amount;
        circuit.push_back(srai_op);
        std::size_t result_wire = circuit.size() - 1;

        // Track destination register wire
        if (instr.ops[0].kind == Operand::REG) {
            std::size_t dst_reg_idx = instr.ops[0].reg_idx;
            if (dst_reg_idx != SIZE_MAX) {
                trans_ctx.set_register_wire(dst_reg_idx, result_wire);
            }
        }

        return true;
    }

    if (instr.op == "SRA") {
        if (instr.ops.size() != 3) {
            std::cerr << "SRA requires 3 operands" << std::endl;
            return false;
        }

        // Variable arithmetic right shift:
        // Lower to a dedicated SRA gate, which implements:
        //   s   = MSB(a), pow = 2^k, q_u = floor(a / pow),
        //   introduce t with t * pow = 2^32,
        //   result = q_u + s * (2^32 - t), range-checked to [0,2^32).

        std::size_t dst_reg_idx = resolve_reg_idx_or_die(instr.ops[0], trans_ctx);
        if (dst_reg_idx == SIZE_MAX) {
            std::cerr << "SRA: destination register not resolved\n";
            return false;
        }

        std::size_t a_wire     = get_operand_wire(instr.ops[1], circuit, gate_ctx, trans_ctx);
        std::size_t shamt_wire = get_operand_wire(instr.ops[2], circuit, gate_ctx, trans_ctx);

        circuit.push_back(BaseOp(OPTYPE::SRA, {a_wire, shamt_wire}));
        std::size_t result_wire = circuit.size() - 1;

        trans_ctx.set_register_wire(dst_reg_idx, result_wire);
        return true;
    }

    // For variable shifts (SRL with register), we need more complex handling
    std::cerr << "Variable shift operations not yet fully implemented: " << instr.op << std::endl;
    return false;
}

// Helper function implementations
std::size_t GateTranslator::get_operand_wire(
    const Operand& operand,
    std::vector<BaseOp>& circuit,
    GateContext& gate_ctx,
    TranslationContext& trans_ctx
) {
    switch (operand.kind) {
        case Operand::REG:
            // Registers-as-RAM: first read of an architectural register loads from its RAM slot
            if (trans_ctx.layout && trans_ctx.layout->is_arch(operand.reg_idx)) {
                // If already has a live value in this block, reuse it
                auto it = trans_ctx.register_to_wire.find(operand.reg_idx);
                if (it != trans_ctx.register_to_wire.end()) return it->second;

                // Construct address constant for this register slot
                uint64_t addr = trans_ctx.layout->slot_addr(operand.reg_idx);
                std::size_t wire_1 = trans_ctx.register_mapping->get_wire_1_index();
                circuit.push_back(BaseOp(OPTYPE::LINEAR, {wire_1}, {f61(addr)}));
                std::size_t addr_wire = circuit.size() - 1;
                // LOAD value from RAM
                circuit.push_back(BaseOp(OPTYPE::LOAD, {addr_wire}));
                std::size_t value_wire = circuit.size() - 1;
                // Cache as current register value in this block
                trans_ctx.set_register_wire(operand.reg_idx, value_wire, /*mark_write=*/false);
                return value_wire;
            }
            // Fallback: return current value wire (for special regs)
            return trans_ctx.get_register_wire(operand.reg_idx);
        case Operand::IMM:
            // Create a constant wire for immediate value
            return create_immediate_wire(operand.imm, circuit, trans_ctx);
        case Operand::MEM:
            // Resolve memory address
            return resolve_memory_address(operand, circuit, gate_ctx, trans_ctx);
        // Operand::SYM resolution (e.g., JUMP/CALL)
        case Operand::SYM: {
            auto it = trans_ctx.label_to_pc.find(operand.sym);
            if (it != trans_ctx.label_to_pc.end()) {
                return create_immediate_wire(it->second, circuit, trans_ctx); // BYTE address
            }
            std::cerr << "Unresolved symbol: " << operand.sym << std::endl;
            return SIZE_MAX;
        }
        default:
            std::cerr << "Unknown operand kind" << std::endl;
            return SIZE_MAX;
    }
}

std::size_t GateTranslator::create_immediate_wire(
    int64_t value,
    std::vector<BaseOp>& circuit,
    TranslationContext& trans_ctx,
    bool is_memory_displacement
) {
    // Create a LINEAR operation that produces the immediate value
    // LINEAR: result = value * wire_1 (where wire_1 is constant 1)
    std::size_t wire_1 = trans_ctx.register_mapping->get_wire_1_index();

    f61 field_value;
    if (is_memory_displacement) {
        // For memory displacements, keep as signed for proper address arithmetic.
        // Use field arithmetic: negative values encoded via f61::minor(|value|)
        // make low 32-bit behavior match two's-complement addition when later
        // truncated for RAM indexing.
        if (value < 0) {
            field_value = f61::minor(static_cast<uint64_t>(-value));
        } else {
            field_value = f61(static_cast<uint64_t>(value));
        }
    } else {
        // For immediate operands in arithmetic/logic operations,
        // convert 32-bit signed to 32-bit unsigned representation
        // This handles cases like ADDI %GR1, %GR6, -1 where -1 should become 0xFFFFFFFF
        uint32_t unsigned_val = static_cast<uint32_t>(static_cast<int32_t>(value));
        field_value = f61(static_cast<uint64_t>(unsigned_val));
    }

    circuit.push_back(BaseOp(OPTYPE::LINEAR, {wire_1}, {field_value}));
    return circuit.size() - 1;
}

std::size_t GateTranslator::resolve_memory_address(
    const Operand& mem_operand,
    std::vector<BaseOp>& circuit,
    GateContext& gate_ctx,
    TranslationContext& trans_ctx
) {
    if (mem_operand.kind != Operand::MEM) {
        std::cerr << "Expected memory operand" << std::endl;
        return SIZE_MAX;
    }

    // Use the live wire if present; otherwise for architectural registers load from RAM slot
    std::size_t base_reg_idx = mem_operand.mem.base_idx;
    std::size_t base_wire = SIZE_MAX;
    auto it_live = trans_ctx.register_to_wire.find(base_reg_idx);
    if (it_live != trans_ctx.register_to_wire.end()) {
        base_wire = it_live->second;
    } else if (trans_ctx.layout && trans_ctx.layout->is_arch(base_reg_idx)) {
        // First use of base register in this block: load from RAM slot
        uint64_t addr = trans_ctx.layout->slot_addr(base_reg_idx);
        std::size_t wire_1 = trans_ctx.register_mapping->get_wire_1_index();
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {wire_1}, {f61(addr)}));
        std::size_t addr_wire = circuit.size() - 1;
        circuit.push_back(BaseOp(OPTYPE::LOAD, {addr_wire}));
        base_wire = circuit.size() - 1;
        trans_ctx.set_register_wire(base_reg_idx, base_wire, /*mark_write=*/false);
    } else {
        // Non-architectural/special register (e.g., PC, sregs): use current wire id
        base_wire = trans_ctx.get_register_wire(base_reg_idx);
    }
    int32_t displacement = mem_operand.mem.disp;

    if (displacement == 0) {
        // No displacement, just return base register's current wire
        return base_wire;
    }

    // Create address = base + displacement
    // Pass true for is_memory_displacement to handle negative offsets correctly
    std::size_t disp_wire = create_immediate_wire(displacement, circuit, trans_ctx, true);
    circuit.push_back(BaseOp(OPTYPE::LINEAR, {base_wire, disp_wire}, {1, 1}));
    return circuit.size() - 1;
}

// I/O instruction translator for INPUT (from cleartext VM input stack)
bool GateTranslator::translate_io(
    const AsmInstr& instr,
    std::size_t output_wire,
    std::vector<BaseOp>& circuit,
    GateContext& gate_ctx,
    TranslationContext& trans_ctx
) {
    if (instr.op == "INPUT") {
        // INPUT %GRx - pop value from input queue into register
        if (instr.ops.size() != 1) {
            std::cerr << "INPUT requires 1 operand\n";
            return false;
        }
        std::size_t dst_reg_idx = resolve_reg_idx_or_die(instr.ops[0], trans_ctx);
        if (dst_reg_idx == SIZE_MAX) {
            std::cerr << "INPUT: destination register not resolved\n";
            return false;
        }
        circuit.push_back(BaseOp(OPTYPE::ASMINPUT));
        std::size_t result_wire = circuit.size() - 1;
        trans_ctx.set_register_wire(dst_reg_idx, result_wire);
        return true;
    }

    std::cerr << "Unhandled I/O instruction: " << instr.op << std::endl;
    return false;
}

// VMCALL instruction translator
bool GateTranslator::translate_vmcall(
    const AsmInstr& instr,
    std::size_t output_wire,
    std::vector<BaseOp>& circuit,
    GateContext& gate_ctx,
    TranslationContext& trans_ctx
) {
    // VMCALL <oracle_id> - invoke oracle (no-op in ZK, oracle runs in cleartext)
    if (instr.ops.size() != 1 || instr.ops[0].kind != Operand::IMM) {
        std::cerr << "VMCALL requires 1 immediate operand (oracle ID)\n";
        return false;
    }

    // Store oracle_id in BaseOp immediate field
    BaseOp vmcall_op(OPTYPE::VMCALL);
    vmcall_op.imm = static_cast<uint32_t>(instr.ops[0].imm);
    circuit.push_back(vmcall_op);

    // VMCALL doesn't produce a register result
    // It only has side effects in cleartext (pushes to input stack)
    return true;
}

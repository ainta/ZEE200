#include "basic_block_parser.h"
#include <iostream>

// Control flow instructions that terminate basic blocks
const std::set<std::string> BasicBlockParser::CONTROL_FLOW_OPCODES = {
    "JUMP",     // Unconditional jump
    "CALL",     // Function call
    "CALLR",    // Indirect function call
    "BNEQZ",    // Conditional branch (branch if not equal to zero)
    "RET",      // Return from function
    "HALT",     // Program termination
    "QED"       // QED instruction (proof end, terminates execution)
};

BasicBlockResult BasicBlockParser::parse_to_blocks(const std::string& path, std::size_t register_count) {
    // First parse the assembly file normally
    ParseResult parse_result = parse_asm_file(path, register_count);
    
    // Then split into basic blocks
    return split_into_blocks(parse_result);
}

bool BasicBlockParser::is_control_flow_instruction(const std::string& opcode) {
    return CONTROL_FLOW_OPCODES.count(opcode) > 0;
}

std::string BasicBlockParser::get_control_flow_type(const std::string& opcode) {
    if (CONTROL_FLOW_OPCODES.count(opcode)) {
        return opcode;
    }
    return "FALL_THROUGH";
}

std::string BasicBlockParser::extract_target_label(const AsmInstr& instr) {
    // Extract target label from control flow instructions
    if (instr.op == "JUMP" || instr.op == "CALL" || instr.op == "BNEQZ") {
        // For JUMP/CALL: target is first operand
        // For BNEQZ: target is second operand (first is condition)
        std::size_t target_idx = (instr.op == "BNEQZ") ? 1 : 0;
        
        if (instr.ops.size() > target_idx && instr.ops[target_idx].kind == Operand::SYM) {
            return instr.ops[target_idx].sym;
        }
    }
    
    return "";  // No target (RET, HALT, etc.)
}

BasicBlockResult BasicBlockParser::split_into_blocks(const ParseResult& parse_result) {
    BasicBlockResult result;
    result.register_count = parse_result.register_count;
    result.data = parse_result.data;  // Copy data section

    if (parse_result.code.empty()) {
        return result;
    }
    
    std::size_t current_block_id = 0;
    BasicBlock current_block;
    current_block.block_id = current_block_id++;
    
    for (std::size_t i = 0; i < parse_result.code.size(); i++) {
        const Labeled& labeled = parse_result.code[i];
        
        // If this line has a label, it might start a new basic block
        if (!labeled.label.empty()) {
            // If we have instructions in current block, close it first
            if (!current_block.instructions.empty()) {
                // Previous block falls through to this label
                current_block.control_flow_type = "FALL_THROUGH";
                current_block.control_flow_target = labeled.label;
                result.blocks.push_back(current_block);
                
                // Start new block
                current_block = BasicBlock();
                current_block.block_id = current_block_id++;
            }
            
            // Set label for current block
            current_block.label = labeled.label;
            result.label_to_block_id[labeled.label] = current_block.block_id;
        }
        
        // Add instruction to current block (if it exists)
        if (!labeled.instr.op.empty()) {
            current_block.instructions.push_back(labeled.instr);
            
            // Check if this instruction ends the basic block
            if (is_control_flow_instruction(labeled.instr.op)) {
                current_block.control_flow_type = get_control_flow_type(labeled.instr.op);
                current_block.control_flow_target = extract_target_label(labeled.instr);
                
                // Close current block
                result.blocks.push_back(current_block);
                
                // Start new block (if there are more instructions)
                if (i + 1 < parse_result.code.size()) {
                    current_block = BasicBlock();
                    current_block.block_id = current_block_id++;
                } else {
                    current_block = BasicBlock(); // Clear for safety
                }
            }
        }
    }
    
    // Add final block if it has content
    if (!current_block.instructions.empty() || !current_block.label.empty()) {
        if (current_block.control_flow_type.empty()) {
            // Final block with no explicit control flow should be HALT, not FALL_THROUGH
            current_block.control_flow_type = "HALT";
        }
        result.blocks.push_back(current_block);
    }

    // Pass 1: Assign instruction-level PC addresses to each block
    // CRITICAL: Block addresses must match instruction-level PC for indirect jumps (JUMP %GR, CALLR %GR)
    // Each block starts at the PC of its first instruction (matching zeecompiler semantics)
    uint64_t instruction_pc = 0;  // Current instruction-level PC
    for (std::size_t i = 0; i < result.blocks.size(); i++) {
        // Block address = PC of its first instruction
        result.blocks[i].byte_address = instruction_pc;

        // Build label_to_address map
        if (!result.blocks[i].label.empty()) {
            result.label_to_address[result.blocks[i].label] = instruction_pc;
        }

        // Advance PC by the number of instructions in this block
        // This ensures labels and indirect jumps reference correct instruction positions
        instruction_pc += result.blocks[i].instructions.size();
    }

    // Pass 2: Build fallthrough_address map (after every block has a real address)
    // Fallthrough applies to: FALL_THROUGH, CALL, CALLR, BNEQZ
    // NOT for: JUMP, RET, HALT (these don't fall through to next block)
    for (std::size_t i = 0; i + 1 < result.blocks.size(); i++) {
        const std::string& cf = result.blocks[i].control_flow_type;
        if (cf == "FALL_THROUGH" || cf == "CALL" || cf == "CALLR" || cf == "BNEQZ") {
            result.fallthrough_address[result.blocks[i].byte_address] = result.blocks[i + 1].byte_address;
        }
    }

    return result;
}
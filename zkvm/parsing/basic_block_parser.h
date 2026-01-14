#pragma once
#include <vector>
#include <string>
#include <set>
#include "asm_parser.cpp"

/**
 * Basic block parser for tight-zkvm assembly translation
 * 
 * In tight-zkvm, each Instruction is a basic block with no control flow inside.
 * Control flow happens via PC register updates between Instructions.
 * 
 * This parser splits assembly code at control flow boundaries to create
 * basic blocks that can each become one tight-zkvm Instruction.
 */

struct BasicBlock {
    std::string label;                    // Block label (empty if no label)
    std::vector<AsmInstr> instructions;   // Sequential instructions (no control flow)
    std::size_t block_id;                 // Unique block identifier (sequential 0, 1, 2...)
    uint64_t byte_address;                // Byte address for this block (for PC)
    std::string control_flow_target;      // Target label for control flow (if any)
    std::string control_flow_type;        // JUMP, CALL, BNEQZ, RET, or FALL_THROUGH

    BasicBlock() : block_id(0), byte_address(0) {}
};

struct BasicBlockResult {
    std::vector<BasicBlock> blocks;
    std::map<std::string, std::size_t> label_to_block_id;  // Maps labels to block IDs
    std::map<std::string, uint64_t> label_to_address;      // Maps labels to byte addresses
    std::map<uint64_t, uint64_t> fallthrough_address;                           // Next available address after all blocks
    std::size_t register_count;
    std::vector<DataStmt> data;  // Data section statements

    // Helper to create register mapping consistent with this result
    RegisterMapping create_register_mapping() const {
        return RegisterMapping(register_count);
    }
};

class BasicBlockParser {
public:
    /**
     * Parse assembly file and split into basic blocks
     * @param path Path to assembly file
     * @param register_count Size of RegisterMapping space (not circuit m), needs >= 20 for all virtual registers
     * @return BasicBlockResult with blocks and label mappings
     */
    static BasicBlockResult parse_to_blocks(const std::string& path, std::size_t register_count = 20);
    
    /**
     * Split parsed assembly into basic blocks
     */
    static BasicBlockResult split_into_blocks(const ParseResult& parse_result);
    
    /**
     * Check if instruction is a control flow instruction that ends a basic block
     */
    static bool is_control_flow_instruction(const std::string& opcode);

private:
    
    /**
     * Get the control flow type for an instruction
     */
    static std::string get_control_flow_type(const std::string& opcode);
    
    /**
     * Extract target label from control flow instruction
     */
    static std::string extract_target_label(const AsmInstr& instr);
    
    /**
     * Control flow instructions that end basic blocks
     */
    static const std::set<std::string> CONTROL_FLOW_OPCODES;
};
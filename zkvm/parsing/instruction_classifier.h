#pragma once
#include <string>
#include <unordered_set>
#include <unordered_map>

/**
 * Classifies assembly instructions by type for gate translation
 * Based on zkassembler instruction set and tight-zkvm gate capabilities
 */

enum class InstrType {
    ARITHMETIC,     // ADD, SUB, ADDI, SUBI, MUL, MULI
    LOGIC,          // AND, OR, XOR, ANDI, ORI, XORI
    SHIFT,          // SHL, SRL, SRA, SHLI, SRLI, SRAI
    MEMORY,         // LOAD, STORE, LOADB, STOREB, ULOADB, SLOADB
    CONTROL,        // JUMP, CALL, BNEQZ, RET, HALT
    COPY,           // COPYR, COPYI, COPYG, PC
    COMPARE,        // EQ, NEQ, LT, ULT, LTE, ULTE, EQZ, MSB
    DIVIDE,         // UDIV, UREM (requires special oracle handling)
    IO,             // INPUT (reads from cleartext VM input stack)
    SPECIAL,        // NOP, VMCALL
    UNKNOWN         // Unrecognized instructions
};

class InstructionClassifier {
private:
    static const std::unordered_map<std::string, InstrType> instr_map;
    
public:
    /**
     * Classify instruction by opcode
     * @param opcode Assembly instruction opcode (e.g., "ADD", "LOAD")
     * @return Instruction type classification
     */
    static InstrType classify(const std::string& opcode) {
        auto it = instr_map.find(opcode);
        return (it != instr_map.end()) ? it->second : InstrType::UNKNOWN;
    }
    
    /**
     * Check if instruction has immediate variant
     * @param opcode Assembly instruction opcode
     * @return true if immediate version exists (e.g., ADD → ADDI)
     */
    static bool has_immediate_variant(const std::string& opcode) {
        static const std::unordered_set<std::string> imm_variants = {
            "ADD", "SUB", "MUL", "AND", "OR", "XOR", "SHL", "SRL", "SRA"
        };
        return imm_variants.find(opcode) != imm_variants.end();
    }
    
    /**
     * Check if instruction modifies memory
     * @param type Instruction type
     * @return true if instruction writes to memory
     */
    static bool modifies_memory(InstrType type) {
        return type == InstrType::MEMORY; // STORE variants
    }
    
    /**
     * Check if instruction is a control flow operation
     * @param type Instruction type
     * @return true if instruction changes program counter
     */
    static bool is_control_flow(InstrType type) {
        return type == InstrType::CONTROL;
    }
    
    /**
     * Check if instruction requires oracle/VMCALL handling
     * @param type Instruction type
     * @return true if instruction needs oracle replacement
     */
    static bool requires_oracle(InstrType type) {
        return type == InstrType::DIVIDE || type == InstrType::SHIFT;
    }
    
    /**
     * Get expected operand count for instruction type
     * @param opcode Assembly instruction opcode
     * @return Expected number of operands, or -1 if variable
     */
    static int get_expected_operand_count(const std::string& opcode) {
        static const std::unordered_map<std::string, int> operand_counts = {
            // Arithmetic (dst, src1, src2)
            {"ADD", 3}, {"SUB", 3}, {"MUL", 3}, {"AND", 3}, {"OR", 3}, {"XOR", 3},
            {"ULT", 3}, {"ULTE", 3}, {"LT", 3}, {"LTE", 3}, {"EQ", 3}, {"NEQ", 3},
            {"UDIV", 3}, {"UREM", 3},
            {"UDIVI", 3}, {"UREMI", 3}, {"SDIV", 3}, {"SDIVI", 3},
            {"SREM", 3}, {"SREMI", 3},
            
            // Arithmetic immediate (dst, src, imm)
            {"ADDI", 3}, {"SUBI", 3}, {"MULI", 3}, {"ANDI", 3}, {"ORI", 3}, {"XORI", 3},
            {"SHLI", 3}, {"SRLI", 3}, {"SRAI", 3},
            
            // Shift (dst, src, shift_amount)
            {"SHL", 3}, {"SRL", 3}, {"SRA", 3},
            
            // Memory (reg, mem) or (mem, reg)
            {"LOAD", 2}, {"STORE", 2}, {"LOADB", 2}, {"STOREB", 2},
            {"ULOADB", 2}, {"SLOADB", 2}, {"LOADH", 2}, {"STOREH", 2},
            {"ULOADH", 2}, {"SLOADH", 2},
            
            // Copy (dst, src)
            {"COPYR", 2}, {"COPYI", 2}, {"COPYG", 2},

            // Conditional move (dst, cond, src)
            {"CMOV", 3},

            // Unary operations (dst, src)
            {"EQZ", 2}, {"MSB", 2},
            
            // Control flow - variable operands
            {"JUMP", 1}, {"CALL", 1}, {"BNEQZ", 2}, {"RET", 0}, {"HALT", 0}, {"QED", 0},
            
            // I/O operations
            {"INPUT", 1},

            // Special
            {"NOP", 0}, {"VMCALL", 1}, {"PC", 2}, {"OUTPUT", 1}
        };

        auto it = operand_counts.find(opcode);
        return (it != operand_counts.end()) ? it->second : -1;
    }
};

// Static initialization of instruction mapping
const std::unordered_map<std::string, InstrType> InstructionClassifier::instr_map = {
    // Arithmetic operations
    {"ADD", InstrType::ARITHMETIC}, {"ADDI", InstrType::ARITHMETIC},
    {"SUB", InstrType::ARITHMETIC}, {"SUBI", InstrType::ARITHMETIC}, 
    {"MUL", InstrType::ARITHMETIC}, {"MULI", InstrType::ARITHMETIC},
    
    // Logic operations
    {"AND", InstrType::LOGIC}, {"ANDI", InstrType::LOGIC},
    {"OR", InstrType::LOGIC}, {"ORI", InstrType::LOGIC},
    {"XOR", InstrType::LOGIC}, {"XORI", InstrType::LOGIC},
    
    // Shift operations (may require oracles)
    {"SHL", InstrType::SHIFT}, {"SHLI", InstrType::SHIFT},
    {"SRL", InstrType::SHIFT}, {"SRLI", InstrType::SHIFT},
    {"SRA", InstrType::SHIFT}, {"SRAI", InstrType::SHIFT},
    
    // Memory operations
    {"LOAD", InstrType::MEMORY}, {"STORE", InstrType::MEMORY},
    {"LOADB", InstrType::MEMORY}, {"STOREB", InstrType::MEMORY},
    {"ULOADB", InstrType::MEMORY}, {"SLOADB", InstrType::MEMORY},
    {"LOADH", InstrType::MEMORY}, {"STOREH", InstrType::MEMORY},
    {"ULOADH", InstrType::MEMORY}, {"SLOADH", InstrType::MEMORY},
    
    // Control flow
    {"JUMP", InstrType::CONTROL}, {"CALL", InstrType::CONTROL},
    {"BNEQZ", InstrType::CONTROL}, {"RET", InstrType::CONTROL},
    {"HALT", InstrType::CONTROL}, {"QED", InstrType::CONTROL},
    
    // Copy operations
    {"COPYR", InstrType::COPY}, {"COPYI", InstrType::COPY},
    {"COPYG", InstrType::COPY}, {"PC", InstrType::COPY},
    {"CMOV", InstrType::COPY},
    
    // Compare operations
    {"EQ", InstrType::COMPARE}, {"NEQ", InstrType::COMPARE},
    {"LT", InstrType::COMPARE}, {"LTE", InstrType::COMPARE},
    {"ULT", InstrType::COMPARE}, {"ULTE", InstrType::COMPARE},
    {"EQZ", InstrType::COMPARE}, {"MSB", InstrType::COMPARE},
    
    // Division (requires oracle)
    {"UDIV", InstrType::DIVIDE}, {"UREM", InstrType::DIVIDE},
    {"UDIVI", InstrType::DIVIDE}, {"UREMI", InstrType::DIVIDE},
    {"SDIV", InstrType::DIVIDE}, {"SDIVI", InstrType::DIVIDE},
    {"SREM", InstrType::DIVIDE}, {"SREMI", InstrType::DIVIDE},

    // I/O operations
    {"INPUT", InstrType::IO},

    // Special operations
    {"NOP", InstrType::SPECIAL}, {"VMCALL", InstrType::SPECIAL}, {"OUTPUT", InstrType::SPECIAL}
};

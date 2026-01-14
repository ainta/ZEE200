#pragma once
#include "../base_types.h"
#include "../context/gate_context.h"
// Forward declarations to avoid including asm_parser.cpp
struct Operand;
struct AsmInstr;
#include "../parsing/instruction_classifier.h"
#include "../parsing/register_mapping.h"
#include "../register_layout.h"
#include <vector>
#include <memory>
#include <unordered_map>
#include <unordered_set>

/**
 * Translation context for managing state during gate sequence generation
 */
struct TranslationContext {
    std::size_t next_wire_id;
    std::size_t register_count;
    const RegisterMapping* register_mapping;
    const RegisterLayout*  layout;          // registers-as-RAM layout
    std::map<std::string, uint64_t> label_to_pc;
    std::map<std::string, uint32_t> data_symbols;  // Data section symbols for COPYG resolution

    // Track which wire holds the current value of each register within this basic block
    std::unordered_map<std::size_t, std::size_t> register_to_wire;

    // Registers-backed-by-RAM config
    uint32_t reg_base_bytes = 0; // byte address base for register slots
    uint32_t reg_word_size  = 4; // 4 bytes per slot

    // Registers written in this block (for end-of-block STORE)
    std::unordered_set<std::size_t> regs_written;

    TranslationContext()
        : next_wire_id(0), register_count(32), register_mapping(nullptr), layout(nullptr) {}

    TranslationContext(std::size_t reg_count)
        : next_wire_id(reg_count), register_count(reg_count), register_mapping(nullptr), layout(nullptr) {}

    std::size_t allocate_wire() {
        return next_wire_id++;
    }

    std::vector<std::size_t> allocate_wires(std::size_t count) {
        std::vector<std::size_t> wires;
        for (std::size_t i = 0; i < count; i++) {
            wires.push_back(allocate_wire());
        }
        return wires;
    }

    // Get the wire that holds the current value of a register
    // If register has been written in this block, return that wire
    // Otherwise return the register's initial wire index
    std::size_t get_register_wire(std::size_t reg_idx) const {
        auto it = register_to_wire.find(reg_idx);
        if (it != register_to_wire.end()) {
            return it->second;
        }
        return reg_idx;  // Use register's initial position in circuit
    }

    // Update which wire holds a register's value
    void set_register_wire(std::size_t reg_idx, std::size_t wire_idx, bool mark_write = true) {
        register_to_wire[reg_idx] = wire_idx;
        if (mark_write && layout && layout->is_arch(reg_idx)) {
            regs_written.insert(reg_idx);
        }
    }
};

/**
 * Main gate translator for converting assembly instructions to gate sequences
 */
class GateTranslator {
public:
    /**
     * Translate a single assembly instruction to gate sequence
     * @param instr Assembly instruction to translate
     * @param output_wire Wire index where result should be stored
     * @param circuit Circuit being built (will be modified)
     * @param gate_ctx Gate context for tracking wires and constraints
     * @param trans_ctx Translation context for wire allocation
     * @return true if translation successful, false otherwise
     */
    static bool translate_instruction(
        const AsmInstr& instr,
        std::size_t output_wire,
        std::vector<BaseOp>& circuit,
        GateContext& gate_ctx,
        TranslationContext& trans_ctx
    );

private:
    // Arithmetic instruction translators
    static bool translate_arithmetic(
        const AsmInstr& instr,
        std::size_t output_wire,
        std::vector<BaseOp>& circuit,
        GateContext& gate_ctx,
        TranslationContext& trans_ctx
    );
    
    // Logic instruction translators
    static bool translate_logic(
        const AsmInstr& instr,
        std::size_t output_wire,
        std::vector<BaseOp>& circuit,
        GateContext& gate_ctx,
        TranslationContext& trans_ctx
    );
    
    // Memory instruction translators
    static bool translate_memory(
        const AsmInstr& instr,
        std::size_t output_wire,
        std::vector<BaseOp>& circuit,
        GateContext& gate_ctx,
        TranslationContext& trans_ctx
    );
    
    // Copy instruction translators
    static bool translate_copy(
        const AsmInstr& instr,
        std::size_t output_wire,
        std::vector<BaseOp>& circuit,
        GateContext& gate_ctx,
        TranslationContext& trans_ctx
    );
    
    // Compare instruction translators
    static bool translate_compare(
        const AsmInstr& instr,
        std::size_t output_wire,
        std::vector<BaseOp>& circuit,
        GateContext& gate_ctx,
        TranslationContext& trans_ctx
    );
    
    // Division instruction translators (oracle replacement)
    static bool translate_divide(
        const AsmInstr& instr,
        std::size_t output_wire,
        std::vector<BaseOp>& circuit,
        GateContext& gate_ctx,
        TranslationContext& trans_ctx
    );
    
    // Shift instruction translators (oracle replacement)
    static bool translate_shift(
        const AsmInstr& instr,
        std::size_t output_wire,
        std::vector<BaseOp>& circuit,
        GateContext& gate_ctx,
        TranslationContext& trans_ctx
    );

    // I/O instruction translators (INPUT from cleartext VM input stack)
    static bool translate_io(
        const AsmInstr& instr,
        std::size_t output_wire,
        std::vector<BaseOp>& circuit,
        GateContext& gate_ctx,
        TranslationContext& trans_ctx
    );

    // VMCALL instruction translator (oracle invocations)
    static bool translate_vmcall(
        const AsmInstr& instr,
        std::size_t output_wire,
        std::vector<BaseOp>& circuit,
        GateContext& gate_ctx,
        TranslationContext& trans_ctx
    );

    // Helper functions
    static std::size_t get_operand_wire(
        const Operand& operand,
        std::vector<BaseOp>& circuit,
        GateContext& gate_ctx,
        TranslationContext& trans_ctx
    );
    
    static std::size_t create_immediate_wire(
        int64_t value,
        std::vector<BaseOp>& circuit,
        TranslationContext& trans_ctx,
        bool is_memory_displacement = false
    );
    
    static std::size_t resolve_memory_address(
        const Operand& mem_operand,
        std::vector<BaseOp>& circuit,
        GateContext& gate_ctx,
        TranslationContext& trans_ctx
    );
};

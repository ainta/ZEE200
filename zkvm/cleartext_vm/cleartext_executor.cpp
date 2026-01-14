#include "cleartext_executor.h"
#include "oracles.cpp"
#include "../parsing/asm_parser.cpp"  // For AsmInstr and Operand definitions
#include <iostream>
#include <stack>
#include <algorithm>
#include <map>
#include <unistd.h>

namespace cleartext {

/**
 * Special register indices (matching zkVM architecture with m=20)
 * Updated after removing %GR0, %SFT, %POV0, %POV1, %POV2, %MASK, %BASE
 */
static size_t get_pc_index() { return 17; }  // %PC register (20-3)
static size_t get_ra_index() { return 12; }  // %RA (return address) register
static size_t get_sp_index() { return 8; }   // %SP (stack pointer) register
static size_t get_fp_index() { return 13; }  // %FP (frame pointer) register
static size_t get_hp_index() { return 11; }  // %HP (heap pointer) register

/**
 * Get register index from operand
 */
static size_t get_reg_index(const Operand& op) {
    if (op.kind != Operand::REG) return SIZE_MAX;
    if (op.reg_idx != SIZE_MAX) return op.reg_idx;

    // Parse register name like %GR1, %GR2, etc.
    // %GR1-%GR6 map to indices 2-7 (Note: %GR0 removed)
    if (op.reg.size() >= 4 && op.reg[0] == '%' && op.reg[1] == 'G' && op.reg[2] == 'R') {
        int gr_num = std::stoi(op.reg.substr(3));
        return 1 + gr_num;  // %GR1->2, %GR2->3, ..., %GR6->7
    }
    return SIZE_MAX;
}

/**
 * Jump to a label if it exists; otherwise fall through
 */
static bool jump_to_label(const Operand& op, const std::map<std::string, size_t>& labels, size_t& pc) {
    if (op.kind == Operand::SYM) {
        auto it = labels.find(op.sym);
        if (it != labels.end()) {
            pc = it->second;
            return true;
        }
    }
    pc++; // fall-through if missing
    return false;
}

/**
 * Get immediate value from operand
 */
static uint32_t get_immediate(const Operand& op, CleartextMachine& machine) {
    if (op.kind == Operand::IMM) {
        return static_cast<uint32_t>(op.imm);
    }
    if (op.kind == Operand::REG) {
        size_t idx = get_reg_index(op);
        if (idx < machine.registry.size()) {
            return machine.registry[idx];
        }
    }
    return 0;
}

/**
 * Byte-addressed memory helpers (memory is stored as words, but addresses are bytes)
 */
static inline bool mem_read_word(CleartextMachine& m, uint32_t byte_addr, uint32_t& out) {
    uint32_t word_addr = byte_addr >> 2;
    if (byte_addr == m.qed_memory_addr){
        m.qed_memory_addr_touched = true;
    }
    if (byte_addr % 4 != 0){
        std::cerr << "Memory read address is not word-aligned" << std::endl;
        return false;
    } 
    if (word_addr >= m.memory.size()){
        std::cerr << "Memory read address is out of bounds" << std::endl;
        return false;
    }
    out = m.memory[word_addr];
    return true;
}

static inline bool mem_write_word(CleartextMachine& m, uint32_t byte_addr, uint32_t val) {
    uint32_t word_addr = byte_addr >> 2;
    if (byte_addr == m.qed_memory_addr){
        m.qed_memory_addr_touched = true;
    }
    if (byte_addr % 4 != 0){
        std::cerr << "Memory write address is not word-aligned" << std::endl;
        return false;
    } 
    if (word_addr >= m.memory.size()){
        std::cerr << "Memory write address is out of bounds" << std::endl;
        return false;
    }
    m.memory[word_addr] = val;
    return true;
}

static inline bool mem_read_byte(CleartextMachine& m, uint32_t byte_addr, uint8_t& out) {
    uint32_t word_addr = byte_addr >> 2;
    if (byte_addr == m.qed_memory_addr){
        m.qed_memory_addr_touched = true;
    }
    if (word_addr >= m.memory.size()){
        std::cerr << "Memory byte read address is out of bounds" << std::endl;
        return false;
    }
    uint32_t byte_offset = (byte_addr & 3u) * 8u;
    out = static_cast<uint8_t>((m.memory[word_addr] >> byte_offset) & 0xFF);
    return true;
}

static inline bool mem_write_byte(CleartextMachine& m, uint32_t byte_addr, uint8_t v) {
    uint32_t word_addr = byte_addr >> 2;
    if (byte_addr == m.qed_memory_addr){
        m.qed_memory_addr_touched = true;
    }
    uint32_t byte_offset = (byte_addr & 3u) * 8u;
    if (word_addr >= m.memory.size()){
        std::cerr << "Memory byte write address is out of bounds" << std::endl;
        return false;
    }
    uint32_t word = m.memory[word_addr];
    word = (word & ~(0xFFu << byte_offset)) | (static_cast<uint32_t>(v) << byte_offset);
    m.memory[word_addr] = word;
    return true;
}

static inline bool mem_read_half(CleartextMachine& m, uint32_t byte_addr, uint16_t& out) {
    uint8_t b0 = 0, b1 = 0;
    if (byte_addr % 2 != 0){
        std::cerr << "Memory halfword read address is not aligned" << std::endl;
        return false;
    }
    if (!mem_read_byte(m, byte_addr + 0, b0)) return false;
    if (!mem_read_byte(m, byte_addr + 1, b1)) return false;
    out = static_cast<uint16_t>(b0 | (static_cast<uint16_t>(b1) << 8));
    return true;
}

static inline bool mem_write_half(CleartextMachine& m, uint32_t byte_addr, uint16_t v) {
    if (byte_addr % 2 != 0){
        std::cerr << "Memory halfword write address is not aligned" << std::endl;
        return false;
    }
    return mem_write_byte(m, byte_addr + 0, static_cast<uint8_t>(v & 0xFF))
        && mem_write_byte(m, byte_addr + 1, static_cast<uint8_t>((v >> 8) & 0xFF));
}

/**
 * Resolve address from operand(s) - handles both simple addresses and displacement(base)
 */
static bool resolve_addr(const std::vector<Operand>& ops, size_t idx,
                         const CleartextMachine& m,
                         const std::map<std::string, uint32_t>& data_symbols,
                         uint32_t& out_addr) {
    if (idx >= ops.size()) return false;
    const Operand& op = ops[idx];

    // Handle MEM operand: disp(base)
    if (op.kind == Operand::MEM) {
        uint32_t base = 0;
        if (op.mem.base_idx < m.registry.size()) {
            base = m.registry[op.mem.base_idx];
        }

        // *** FIX: signed displacement ***
        // Cast to int32_t first (signed), then to int64_t for safe addition
        int64_t addr = static_cast<int64_t>(static_cast<int32_t>(op.mem.disp))
                     + static_cast<int64_t>(base);

        // *** Bounds check in bytes ***
        const int64_t ram_bytes = static_cast<int64_t>(m.memory.size()) * 4;
        if (addr < 0 || addr >= ram_bytes) {
            return false;
        }

        out_addr = static_cast<uint32_t>(addr);
        return true;
    }

    // Handle REG or IMM
    if (op.kind == Operand::REG || op.kind == Operand::IMM) {
        out_addr = get_immediate(op, const_cast<CleartextMachine&>(m));
        return true;
    }

    // Handle SYM (data symbol)
    if (op.kind == Operand::SYM) {
        auto it = data_symbols.find(op.sym);
        out_addr = (it != data_symbols.end()) ? it->second : 0u;
        return true;
    }

    return false;
}

/**
 * Execute a single assembly instruction in cleartext
 */
bool execute_asm_instruction(const AsmInstr& instr, CleartextMachine& machine,
                              const std::map<std::string, size_t>& labels,
                              const std::map<std::string, uint32_t>& data_symbols,
                              size_t& pc) {
    const std::string& op = instr.op;

    // DEBUG: Print instruction with operand values (similar to zee-cleartext style)
#ifdef DEBUG
    std::cout << "DEBUG [PC=" << std::dec << pc << "] " << op;
    for (size_t i = 0; i < instr.ops.size(); i++) {
        const Operand& operand = instr.ops[i];
        if (operand.kind == Operand::REG) {
            size_t idx = get_reg_index(operand);
            std::cout << " " << operand.reg << "=" << (idx < machine.registry.size() ? machine.registry[idx] : 0);
        } else if (operand.kind == Operand::IMM) {
            std::cout << " imm=" << operand.imm;
        } else if (operand.kind == Operand::SYM) {
            std::cout << " sym=" << operand.sym;
        } else if (operand.kind == Operand::MEM) {
            uint32_t base = (operand.mem.base_idx < machine.registry.size()) ? machine.registry[operand.mem.base_idx] : 0;
            std::cout << " mem[" << operand.mem.disp << "+reg" << operand.mem.base_idx << "=" << base << "]";
        }
    }
    std::cout << std::endl;
#endif

    // Arithmetic operations
    if (op == "ADD" || op == "ADDI") {
        if (instr.ops.size() != 3) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t src1 = get_immediate(instr.ops[1], machine);
        uint32_t src2 = get_immediate(instr.ops[2], machine);
        if (dst < machine.registry.size()) {
            machine.registry[dst] = src1 + src2;
        }
        pc++;
        return true;
    }

    if (op == "SUB" || op == "SUBI") {
        if (instr.ops.size() != 3) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t src1 = get_immediate(instr.ops[1], machine);
        uint32_t src2 = get_immediate(instr.ops[2], machine);
        if (dst < machine.registry.size()) {
            machine.registry[dst] = src1 - src2;
        }
        pc++;
        return true;
    }

    if (op == "MUL" || op == "MULI") {
        if (instr.ops.size() != 3) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t src1 = get_immediate(instr.ops[1], machine);
        uint32_t src2 = get_immediate(instr.ops[2], machine);
        if (dst < machine.registry.size()) {
            machine.registry[dst] = src1 * src2;
        }
        pc++;
        return true;
    }

    if (op == "UDIV" || op == "UDIVI") {
        if (instr.ops.size() != 3) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t src1 = get_immediate(instr.ops[1], machine);
        uint32_t src2 = get_immediate(instr.ops[2], machine);
        if (dst < machine.registry.size()) {
            machine.registry[dst] = (src2 == 0) ? 0u : (src1 / src2);
        }
        pc++;
        return true;
    }

    if (op == "UREM" || op == "UREMI") {
        if (instr.ops.size() != 3) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t src1 = get_immediate(instr.ops[1], machine);
        uint32_t src2 = get_immediate(instr.ops[2], machine);
        if (dst < machine.registry.size()) {
            machine.registry[dst] = (src2 == 0) ? src1 : (src1 % src2);
        }
        pc++;
        return true;
    }

    if (op == "SDIV" || op == "SDIVI") {
        if (instr.ops.size() != 3) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        int32_t src1 = static_cast<int32_t>(get_immediate(instr.ops[1], machine));
        int32_t src2 = static_cast<int32_t>(get_immediate(instr.ops[2], machine));
        if (dst < machine.registry.size()) {
            if (src2 == 0) {
                machine.registry[dst] = 0;
            } else {
                machine.registry[dst] = static_cast<uint32_t>(src1 / src2);
            }
        }
        pc++;
        return true;
    }

    if (op == "SREM" || op == "SREMI") {
        if (instr.ops.size() != 3) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        int32_t src1 = static_cast<int32_t>(get_immediate(instr.ops[1], machine));
        int32_t src2 = static_cast<int32_t>(get_immediate(instr.ops[2], machine));
        if (dst < machine.registry.size()) {
            if (src2 == 0) {
                machine.registry[dst] = static_cast<uint32_t>(src1);
            } else {
                machine.registry[dst] = static_cast<uint32_t>(src1 % src2);
            }
        }
        pc++;
        return true;
    }

    // Logical operations
    if (op == "AND" || op == "ANDI") {
        if (instr.ops.size() != 3) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t src1 = get_immediate(instr.ops[1], machine);
        uint32_t src2 = get_immediate(instr.ops[2], machine);
        if (dst < machine.registry.size()) {
            machine.registry[dst] = src1 & src2;
        }
        pc++;
        return true;
    }

    if (op == "OR" || op == "ORI") {
        if (instr.ops.size() != 3) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t src1 = get_immediate(instr.ops[1], machine);
        uint32_t src2 = get_immediate(instr.ops[2], machine);
        if (dst < machine.registry.size()) {
            machine.registry[dst] = src1 | src2;
        }
        pc++;
        return true;
    }

    if (op == "XOR" || op == "XORI") {
        if (instr.ops.size() != 3) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t src1 = get_immediate(instr.ops[1], machine);
        uint32_t src2 = get_immediate(instr.ops[2], machine);
        if (dst < machine.registry.size()) {
            machine.registry[dst] = src1 ^ src2;
        }
        pc++;
        return true;
    }

    // Shift operations
    if (op == "SHL" || op == "SHLI") {
        if (instr.ops.size() != 3) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t src1 = get_immediate(instr.ops[1], machine);
        uint32_t src2 = get_immediate(instr.ops[2], machine);
        if (dst < machine.registry.size()) {
            machine.registry[dst] = src1 << (src2 & 0x1F);
        }
        pc++;
        return true;
    }

    if (op == "SRL" || op == "SRLI") {
        if (instr.ops.size() != 3) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t src1 = get_immediate(instr.ops[1], machine);
        uint32_t src2 = get_immediate(instr.ops[2], machine);
        if (dst < machine.registry.size()) {
            machine.registry[dst] = src1 >> (src2 & 0x1F);
        }
        pc++;
        return true;
    }

    if (op == "SRA" || op == "SRAI") {
        if (instr.ops.size() != 3) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t src1 = get_immediate(instr.ops[1], machine);
        uint32_t src2 = get_immediate(instr.ops[2], machine);
        if (dst < machine.registry.size()) {
            machine.registry[dst] = static_cast<uint32_t>(
                static_cast<int32_t>(src1) >> (src2 & 0x1F));
        }
        pc++;
        return true;
    }

    // Comparison operations
    if (op == "EQZ") {
        if (instr.ops.size() != 2) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t src = get_immediate(instr.ops[1], machine);
        if (dst < machine.registry.size()) {
            machine.registry[dst] = (src == 0) ? 1 : 0;
        }
        pc++;
        return true;
    }

    if (op == "ULT" || op == "ULTE") {
        if (instr.ops.size() != 3) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t src1 = get_immediate(instr.ops[1], machine);
        uint32_t src2 = get_immediate(instr.ops[2], machine);
        if (dst < machine.registry.size()) {
            machine.registry[dst] = (src1 < src2 || (op == "ULTE" && src1 == src2)) ? 1 : 0;
        }
        pc++;
        return true;
    }

    if (op == "LT" || op == "LTE") {
        if (instr.ops.size() != 3) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        int32_t src1 = static_cast<int32_t>(get_immediate(instr.ops[1], machine));
        int32_t src2 = static_cast<int32_t>(get_immediate(instr.ops[2], machine));
        if (dst < machine.registry.size()) {
            machine.registry[dst] = (src1 < src2 || (op == "LTE" && src1 == src2)) ? 1 : 0;
        }
        pc++;
        return true;
    }

    // Equality comparisons
    if (op == "EQ") {
        if (instr.ops.size() != 3) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t a = get_immediate(instr.ops[1], machine);
        uint32_t b = get_immediate(instr.ops[2], machine);
        if (dst < machine.registry.size()) {
            machine.registry[dst] = (a == b) ? 1u : 0u;
        }
        pc++;
        return true;
    }

    if (op == "NEQ") {
        if (instr.ops.size() != 3) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t a = get_immediate(instr.ops[1], machine);
        uint32_t b = get_immediate(instr.ops[2], machine);
        if (dst < machine.registry.size()) {
            machine.registry[dst] = (a != b) ? 1u : 0u;
        }
        pc++;
        return true;
    }

    // Memory operations
    if (op == "LOAD") {
        if (instr.ops.size() < 2) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t byte_addr = 0;
        if (!resolve_addr(instr.ops, 1, machine, data_symbols, byte_addr)) {
            std::cerr << "[Cleartext] ERROR: LOAD failed to resolve address at pc=" << pc << std::endl;
            return false; // halt
        }
        if (dst < machine.registry.size()) {
            uint32_t word;
            if (!mem_read_word(machine, byte_addr, word)) {
                std::cerr << "[Cleartext] ERROR: LOAD OOB read at address 0x" << std::hex << byte_addr
                          << " (pc=" << std::dec << pc << ")" << std::endl;
                return false; // halt
            }
            machine.registry[dst] = word;
        }
        pc++;
        return true;
    }

    if (op == "STORE") {
        if (instr.ops.size() < 2) return false;
        // STORE src, addr   (src is first operand, addr is second)
        uint32_t src_value = get_immediate(instr.ops[0], machine);
        uint32_t byte_addr = 0;
        if (!resolve_addr(instr.ops, 1, machine, data_symbols, byte_addr)) {
            std::cerr << "[Cleartext] ERROR: STORE failed to resolve address at pc=" << pc << std::endl;
            return false; // halt
        }
        if (!mem_write_word(machine, byte_addr, src_value)) {
            std::cerr << "[Cleartext] ERROR: STORE OOB write at address 0x" << std::hex << byte_addr
                      << " (pc=" << std::dec << pc << ")" << std::endl;
            return false; // halt
        }
        pc++;
        return true;
    }

    if (op == "LOADB") {
        // Signed byte load: sign-extend int8_t → int32_t
        if (instr.ops.size() < 2) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t byte_addr = 0;
        if (!resolve_addr(instr.ops, 1, machine, data_symbols, byte_addr)) {
            std::cerr << "[Cleartext] ERROR: LOADB failed to resolve address at pc=" << pc << std::endl;
            return false; // halt
        }
        if (dst < machine.registry.size()) {
            uint8_t ub;
            if (!mem_read_byte(machine, byte_addr, ub)) {
                std::cerr << "[Cleartext] ERROR: LOADB OOB read at address 0x" << std::hex << byte_addr
                          << " (pc=" << std::dec << pc << ")" << std::endl;
                return false; // halt
            }
            int8_t sb = static_cast<int8_t>(ub);
            machine.registry[dst] = static_cast<uint32_t>(static_cast<int32_t>(sb));
        }
        pc++;
        return true;
    }

    if (op == "ULOADB") {
        // Unsigned byte load: zero-extend uint8_t → uint32_t
        if (instr.ops.size() < 2) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t byte_addr = 0;
        if (!resolve_addr(instr.ops, 1, machine, data_symbols, byte_addr)) {
            std::cerr << "[Cleartext] ERROR: ULOADB failed to resolve address at pc=" << pc << std::endl;
            return false; // halt
        }
        if (dst < machine.registry.size()) {
            uint8_t ub;
            if (!mem_read_byte(machine, byte_addr, ub)) {
                std::cerr << "[Cleartext] ERROR: ULOADB OOB read at address 0x" << std::hex << byte_addr
                          << " (pc=" << std::dec << pc << ")" << std::endl;
                return false; // halt
            }
            machine.registry[dst] = static_cast<uint32_t>(ub);
        }
        pc++;
        return true;
    }

    if (op == "STOREB") {
        if (instr.ops.size() < 2) return false;
        uint32_t src_value = get_immediate(instr.ops[0], machine) & 0xFF;
        uint32_t byte_addr = 0;
        if (!resolve_addr(instr.ops, 1, machine, data_symbols, byte_addr)) {
            std::cerr << "[Cleartext] ERROR: STOREB failed to resolve address at pc=" << pc << std::endl;
            return false; // halt
        }
        if (!mem_write_byte(machine, byte_addr, static_cast<uint8_t>(src_value))) {
            std::cerr << "[Cleartext] ERROR: STOREB OOB write at address 0x" << std::hex << byte_addr
                      << " (pc=" << std::dec << pc << ")" << std::endl;
            return false; // halt
        }
        pc++;
        return true;
    }

    if (op == "LOADH") {
        // Signed halfword load: sign-extend int16_t → int32_t
        if (instr.ops.size() < 2) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t byte_addr = 0;
        if (!resolve_addr(instr.ops, 1, machine, data_symbols, byte_addr)) {
            std::cerr << "[Cleartext] ERROR: LOADH failed to resolve address at pc=" << pc << std::endl;
            return false; // halt
        }
        if (dst < machine.registry.size()) {
            uint16_t hw;
            if (!mem_read_half(machine, byte_addr, hw)) {
                std::cerr << "[Cleartext] ERROR: LOADH OOB read at address 0x" << std::hex << byte_addr
                          << " (pc=" << std::dec << pc << ")" << std::endl;
                return false; // halt
            }
            int16_t sh = static_cast<int16_t>(hw);
            machine.registry[dst] = static_cast<uint32_t>(static_cast<int32_t>(sh));
        }
        pc++;
        return true;
    }

    if (op == "ULOADH") {
        // Unsigned halfword load: zero-extend uint16_t → uint32_t
        if (instr.ops.size() < 2) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t byte_addr = 0;
        if (!resolve_addr(instr.ops, 1, machine, data_symbols, byte_addr)) {
            std::cerr << "[Cleartext] ERROR: ULOADH failed to resolve address at pc=" << pc << std::endl;
            return false; // halt
        }
        if (dst < machine.registry.size()) {
            uint16_t hw;
            if (!mem_read_half(machine, byte_addr, hw)) {
                std::cerr << "[Cleartext] ERROR: ULOADH OOB read at address 0x" << std::hex << byte_addr
                          << " (pc=" << std::dec << pc << ")" << std::endl;
                return false; // halt
            }
            machine.registry[dst] = static_cast<uint32_t>(hw);
        }
        pc++;
        return true;
    }

    if (op == "STOREH") {
        if (instr.ops.size() < 2) return false;
        uint32_t src_value = get_immediate(instr.ops[0], machine) & 0xFFFF;
        uint32_t byte_addr = 0;
        if (!resolve_addr(instr.ops, 1, machine, data_symbols, byte_addr)) {
            std::cerr << "[Cleartext] ERROR: STOREH failed to resolve address at pc=" << pc << std::endl;
            return false; // halt
        }
        if (!mem_write_half(machine, byte_addr, static_cast<uint16_t>(src_value))) {
            std::cerr << "[Cleartext] ERROR: STOREH OOB write at address 0x" << std::hex << byte_addr
                      << " (pc=" << std::dec << pc << ")" << std::endl;
            return false; // halt
        }
        pc++;
        return true;
    }

    // Copy operations
    if (op == "COPYR") {
        if (instr.ops.size() != 2) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t value = get_immediate(instr.ops[1], machine);
        if (dst < machine.registry.size()) {
            machine.registry[dst] = value;
        }
        pc++;
        return true;
    }

    if (op == "COPYI") {
        if (instr.ops.size() != 2) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        if (instr.ops[1].kind == Operand::IMM && dst < machine.registry.size()) {
            machine.registry[dst] = static_cast<uint32_t>(instr.ops[1].imm);
        }
        pc++;
        return true;
    }

    // Note: COPYG is no longer handled here - it's resolved to COPYI at parse time
    // (see resolve_copyg_to_copyi in asm_parser.cpp, zee-cleartext style)

    if (op == "CMOV") {
        // Conditional move: CMOV dst, cond, src
        // dst = cond ? src : dst_old
        if (instr.ops.size() != 3) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        uint32_t cond = get_immediate(instr.ops[1], machine);
        uint32_t src = get_immediate(instr.ops[2], machine);
        if (dst < machine.registry.size()) {
            if (cond != 0) {
                machine.registry[dst] = src;
            }
            // else keep dst unchanged
        }
        pc++;
        return true;
    }

    // Control flow operations
    if (op == "JUMP") {
        if (instr.ops.size() != 1) return false;
        jump_to_label(instr.ops[0], labels, pc);
        return true;
    }

    if (op == "BEQZ") {
        // Branch if equal to zero
        if (instr.ops.size() != 2) return false;
        uint32_t cond = get_immediate(instr.ops[0], machine);
        if (cond == 0) {
            jump_to_label(instr.ops[1], labels, pc);
        } else {
            pc++;
        }
        return true;
    }

    if (op == "BNEQZ") {
        // Branch if not equal to zero
        if (instr.ops.size() != 2) return false;
        uint32_t cond = get_immediate(instr.ops[0], machine);
        if (cond != 0) {
            jump_to_label(instr.ops[1], labels, pc);
        } else {
            pc++;
        }
        return true;
    }

    if (op == "CALL") {
        // Function call: RA = pc+1; jump to label
        if (instr.ops.size() != 1) return false;

        size_t ra = get_ra_index();
        if (ra < machine.registry.size()) {
            machine.registry[ra] = static_cast<uint32_t>(pc + 1);
        }
        jump_to_label(instr.ops[0], labels, pc);
        // Mirror %PC (optional)
        size_t pc_idx = get_pc_index();
        if (pc_idx < machine.registry.size()) {
            machine.registry[pc_idx] = static_cast<uint32_t>(pc);
        }
        return true;
    }

    if (op == "CALLR") {
        // Indirect call: RA = pc+1; jump to registry[rX]
        if (instr.ops.size() != 1) return false;
        size_t ra = get_ra_index();
        if (ra < machine.registry.size()) {
            machine.registry[ra] = static_cast<uint32_t>(pc + 1);
        }
        size_t reg = get_reg_index(instr.ops[0]);
        if (reg < machine.registry.size()) {
            pc = static_cast<size_t>(machine.registry[reg]);
        } else {
            pc++; // invalid -> fall-through
        }
        // Mirror %PC (optional)
        size_t pc_idx = get_pc_index();
        if (pc_idx < machine.registry.size()) {
            machine.registry[pc_idx] = static_cast<uint32_t>(pc);
        }
        return true;
    }

    if (op == "RET") {
        // Return: pc = RA
        size_t ra = get_ra_index();
        if (ra < machine.registry.size()) {
            pc = static_cast<size_t>(machine.registry[ra]);
        } else {
            pc++; // if RA invalid, fall-through
        }
        // Mirror %PC (optional)
        size_t pc_idx = get_pc_index();
        if (pc_idx < machine.registry.size()) {
            machine.registry[pc_idx] = static_cast<uint32_t>(pc);
        }
        return true;
    }

    if (op == "HALT") {
        std::cout << "[Cleartext] HALT executed" << std::endl;
        return false;  // Stop execution
    }

    if (op == "QED") {
        // QED instruction (from zeecompiler) - prints heap pointer and halts
        std::cout << "[Cleartext] QED executed!" << std::endl;
        return false;  // Stop execution
    }

    // I/O operations
    if (op == "VMCALL") {
        if (instr.ops.size() != 1) return false;
        uint32_t oracle_id = get_immediate(instr.ops[0], machine);
        std::cout << "[Cleartext] VMCALL " << oracle_id << std::endl;
        oracle(machine, oracle_id);
        pc++;
        return true;
    }

    if (op == "INPUT") {
        if (instr.ops.size() != 1) return false;
        size_t dst = get_reg_index(instr.ops[0]);
        if (!machine.input.empty() && dst < machine.registry.size()) {
            uint32_t value = machine.input.top();
            machine.input.pop();
            machine.registry[dst] = value;
            // Record to tape for ZK input_queue (like sp21-zkm's tape)
            machine.input_tape.push_back(value);
#ifdef DEBUG
            std::cout << "[Cleartext] INPUT: popped " << value << " into GR" << dst << " (recorded to tape)" << std::endl;
#endif
        } else if (machine.input.empty()) {
            std::cerr << "[Cleartext] ERROR: INPUT but stack is empty!" << std::endl;
        }
        pc++;
        return true;
    }

    if (op == "OUTPUT") {
        if (instr.ops.size() != 1) return false;
        uint32_t value = get_immediate(instr.ops[0], machine);
        uint8_t byte = static_cast<uint8_t>(value & 0xFFu);

        // Try to discover the target host fd from the current stack frame.
        // For newlib's _write implementation used by tight-zkvm, the first
        // argument (fd) is saved at 16(%FP).
        uint32_t fp_reg_idx = get_fp_index();
        uint32_t fd_addr_word = 0;
        bool wrote = false;

        if (fp_reg_idx < machine.registry.size()) {
            uint32_t fp = machine.registry[fp_reg_idx];
            uint32_t fd_word = 0;
            if (mem_read_word(machine, fp + 16, fd_word)) {
                int fd = static_cast<int>(fd_word);
                if (is_host_fd_open(fd)) {
                    ssize_t res = ::write(fd, &byte, 1);
                    (void)res;
                    wrote = true;
                }
            }
        }

        // Fallback: if we cannot resolve a tracked fd, write to host stdout.
        if (!wrote) {
            ssize_t res = ::write(1, &byte, 1);
            (void)res;
        }

        pc++;
        return true;
    }

    // NOP and unknown operations
    if (op == "NOP" || op.empty()) {
        pc++;
        return true;
    }

    // Unknown operation - skip it
    std::cerr << "[Cleartext] WARNING: Unknown operation '" << op << "', skipping" << std::endl;
    pc++;
    return true;
}

/**
 * Execute zkvm assembly in cleartext (non-cryptographic) mode
 */
std::vector<uint32_t> execute_cleartext_from_assembly(
    const std::vector<AsmInstr>& assembly,
    size_t ram_size,
    size_t max_steps,
    const std::map<std::string, size_t>& labels,
    const std::map<std::string, uint32_t>& data_symbols,
    const std::vector<uint8_t>& data_image,
    uint32_t data_base_addr,
    uint32_t qed_memory_addr
) {
#ifdef DEBUG
    std::cout << "[Cleartext] Starting execution with " << assembly.size() << " instructions" << std::endl;
    std::cout << "[Cleartext] Labels: " << labels.size() << ", Data symbols: " << data_symbols.size() << std::endl;
    std::cout << "[Cleartext] Data image size: " << data_image.size() << " bytes" << std::endl;
#endif

    // Initialize machine state (ram_size is in words, not bytes)
    CleartextMachine machine(ram_size);
    machine.qed_memory_addr = qed_memory_addr;
    machine.qed_memory_addr_touched = false;

    // Compute RAM size in bytes for SP/FP initialization
    uint32_t ram_size_bytes = static_cast<uint32_t>(ram_size * 4);

    // Initialize SP and FP to top of RAM (byte addresses)
    machine.registry[get_sp_index()] = ram_size_bytes;
    machine.registry[get_fp_index()] = ram_size_bytes;

    // Initialize HP to end of data section (matches zeecompiler: (*out.registry)[HEAPPTR_REGISTER] = data.size() * 4)
    // Data will be loaded at data_base_addr, heap starts after data section
    machine.registry[get_hp_index()] = data_base_addr + static_cast<uint32_t>(data_image.size());

#ifdef DEBUG
    std::cout << "[Cleartext] Initialized %SP=" << machine.registry[get_sp_index()]
              << ", %FP=" << machine.registry[get_fp_index()]
              << ", %HP=" << machine.registry[get_hp_index()] << std::endl;
#endif

    // Load data section into RAM
    if (!data_image.empty()) {
#ifdef DEBUG
        std::cout << "[Cleartext] Loading data section at byte address 0x" << std::hex << data_base_addr << std::dec << std::endl;
#endif
        for (size_t i = 0; i < data_image.size(); i++) {
            uint32_t byte_addr = data_base_addr + i;
            if (!mem_write_byte(machine, byte_addr, data_image[i])) {
                std::cerr << "[Cleartext] ERROR: Failed to write data byte at address 0x"
                          << std::hex << byte_addr << std::dec << std::endl;
                break;
            }
        }
#ifdef DEBUG
        std::cout << "[Cleartext] Data section loaded successfully" << std::endl;
#endif
    }

    // Find start address - prefer "start", fallback to "_start", else 0
    size_t pc = 0;
    auto it_start = labels.find("start");
    if (it_start != labels.end()) {
        pc = it_start->second;
#ifdef DEBUG
        std::cout << "[Cleartext] Starting at label 'start' (index " << pc << ")" << std::endl;
#endif
    } else {
        auto it_ustart = labels.find("_start");
        if (it_ustart != labels.end()) {
            pc = it_ustart->second;
#ifdef DEBUG
            std::cout << "[Cleartext] Starting at label '_start' (index " << pc << ")" << std::endl;
#endif
        } else {
#ifdef DEBUG
            std::cout << "[Cleartext] Starting at index 0 (no 'start' or '_start' label found)" << std::endl;
#endif
        }
    }

    size_t step_count = 0;

    // Track how many times each opcode is executed
    std::map<std::string, uint64_t> opcode_counts;

    while (step_count < max_steps && pc < assembly.size()) {
        // Mirror PC register
        machine.registry[get_pc_index()] = static_cast<uint32_t>(pc);

        const AsmInstr& instr = assembly[pc];
        opcode_counts[instr.op]++;
#ifdef DEBUG
        std::cout << "[Cleartext] Executing instruction " << pc << " " << instr.op << std::endl;
#endif

        if (!execute_asm_instruction(instr, machine, labels, data_symbols, pc)) {
#ifdef DEBUG
            std::cout << "[Cleartext] Halted at instruction " << pc << " after " << step_count << " steps" << std::endl;
#endif
            break;
        }
        if (machine.qed_memory_addr_touched){
            pc = 1; // jump to the QED instruction
        }

        step_count++;
    }

    // Always log total executed instructions (not wrapped in DEBUG)
    std::cout << "[Cleartext] Execution completed: " << step_count << " instructions executed" << std::endl;

    // Also log per-opcode execution counts, sorted from most to least executed
    if (!opcode_counts.empty()) {
        std::vector<std::pair<std::string, uint64_t>> opcode_list(opcode_counts.begin(), opcode_counts.end());
        std::sort(opcode_list.begin(), opcode_list.end(),
                  [](const std::pair<std::string, uint64_t>& a,
                     const std::pair<std::string, uint64_t>& b) {
                      if (a.second != b.second) return a.second > b.second;
                      return a.first < b.first;
                  });

        std::cout << "[Cleartext] Opcode execution counts:" << std::endl;
        for (const auto& entry : opcode_list) {
            std::cout << "  " << entry.first << ": " << entry.second << std::endl;
        }
    }

#ifdef DEBUG
    // Return the input tape (values consumed by INPUT instructions)
    // This becomes the input_queue for ZK execution
    std::cout << "[Cleartext] Input tape size: " << machine.input_tape.size() << std::endl;
    for (size_t i = 0; i < machine.input_tape.size(); i++) {
        std::cout << "[Cleartext]   Tape[" << i << "] = " << machine.input_tape[i] << std::endl;
    }
#endif

    return machine.input_tape;
}

} // namespace cleartext

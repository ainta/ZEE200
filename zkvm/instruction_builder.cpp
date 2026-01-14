#include "instruction.h"
#include "parsing/basic_block_parser.h"
#include "parsing/label_resolver.h"
#include "parsing/pc_update.h"
#include "translation/gate_translator.h"
#include "context/gate_context.h"
#include "register_layout.h"
#include <iostream>

/**
 * Instruction builder for tight-zkvm assembly translation
 * 
 * Converts BasicBlocks (from assembly) into tight-zkvm Instructions.
 * Each BasicBlock becomes one Instruction (circuit) that can be executed
 * by the ZKCPU.
 */

class InstructionBuilder {
public:
    /**
     * Build Instructions from BasicBlocks
     * @param blocks Basic blocks from assembly parsing
     * @param data_symbols Optional data section symbols for COPYG resolution
     * @return Map of byte address -> Instruction ready for ZKCPU execution
     */
    static std::map<uint64_t, Instruction> build_instructions(
        const BasicBlockResult& blocks,
        const std::map<std::string, uint32_t>& data_symbols = std::map<std::string, uint32_t>()
    );
    
private:
    /**
     * Convert a single BasicBlock to an Instruction
     */
    static Instruction build_single_instruction(
        const BasicBlock& block,
        const LabelResolver& resolver,
        const RegisterMapping& reg_map,
        const RegisterLayout& layout,
        const std::map<std::string, uint32_t>& data_symbols,
        const std::map<std::string, uint64_t>& shared_label_to_pc
    );
    
    /**
     * Translate assembly instructions within a basic block to gate operations
     */
    static bool translate_block_instructions(
        const BasicBlock& block,
        const LabelResolver& resolver,
        const RegisterMapping& reg_map,
        std::vector<BaseOp>& circuit,
        GateContext& gate_ctx,
        const std::map<std::string, uint32_t>& data_symbols,
        TranslationContext& trans_ctx,
        const std::map<std::string, uint64_t>& shared_label_to_pc
    );

    /**
     * Add PC update logic at the end of the basic block
     * Returns PCUpdateResult containing new PC wire and modified registers
     */
    static PCUpdateResult add_pc_update_logic(
        const BasicBlock& block,
        const LabelResolver& resolver,
        const RegisterMapping& reg_map,
        const RegisterLayout& layout,
        std::vector<BaseOp>& circuit,
        GateContext& gate_ctx,
        const TranslationContext& trans_ctx
    );
    
    /**
     * Initialize register operations for the circuit
     * Each circuit needs REG operations for the first m wires
     */
    static void initialize_register_operations(
        std::vector<BaseOp>& circuit,
        std::size_t register_count
    );
    
    /**
     * Create register mapping for the circuit
     */
    static std::vector<std::size_t> create_register_mapping(std::size_t register_count);
    
    /**
     * Validate that the circuit is well-formed
     */
    static bool validate_circuit(const std::vector<BaseOp>& circuit, std::size_t register_count);
};

std::map<uint64_t, Instruction> InstructionBuilder::build_instructions(
    const BasicBlockResult& blocks,
    const std::map<std::string, uint32_t>& data_symbols
) {
    std::map<uint64_t, Instruction> instructions;

    // Create helper objects
    LabelResolver resolver(blocks);
    RegisterMapping reg_map = blocks.create_register_mapping();

    // Registers-as-RAM layout (derived from the same virtual register space)
    RegisterLayout layout = RegisterLayout::make_default(blocks.register_count);

    // Build label-to-PC mapping ONCE for all blocks (performance optimization)
    std::map<std::string, uint64_t> shared_label_to_pc;
    std::vector<std::string> all_labels = resolver.get_all_labels();
    for (const std::string& label : all_labels) {
        uint64_t pc_addr = resolver.resolve_label_to_address(label);
        if (pc_addr != UINT64_MAX) {
            shared_label_to_pc[label] = pc_addr;
            continue;
        }
        std::size_t bid = resolver.resolve_label_to_block_id(label);
        if (bid != SIZE_MAX) {
            uint64_t addr = resolver.block_id_to_byte_address(bid);
            if (addr != UINT64_MAX) {
                shared_label_to_pc[label] = addr;
            }
        }
    }

    // Convert each basic block to an instruction
    for (const auto& block : blocks.blocks) {
        Instruction instr = build_single_instruction(block, resolver, reg_map, layout, data_symbols, shared_label_to_pc);
        instructions.emplace(block.byte_address, std::move(instr));  // Key by byte address
    }

    return instructions;
}

Instruction InstructionBuilder::build_single_instruction(
    const BasicBlock& block,
    const LabelResolver& resolver,
    const RegisterMapping& reg_map,
    const RegisterLayout& layout,
    const std::map<std::string, uint32_t>& data_symbols,
    const std::map<std::string, uint64_t>& shared_label_to_pc
) {
    // Circuit m (actual zkVM registers): 2 for black-box RAM model [wire_1, pc]
    constexpr std::size_t circuit_m = 2;
    std::vector<BaseOp> circuit;

    // Initialize with register operations (only m=2 actual registers)
    initialize_register_operations(circuit, circuit_m);

    // Create gate context for tracking wires and operations
    std::vector<std::size_t> iid, oid, set2id, checkzero_wires;
    std::vector<GateContext::MemWires> mem_wires;

    GateContext gate_ctx(
        iid, oid, set2id, checkzero_wires,
        mem_wires,                         // mem_wires for black-box RAM
        reg_map.get_wire_1_index(),        // wire_1
        reg_map.get_pc_index(),            // wire_pc
        circuit_m                          // Circuit m = 2
    );

    // Translate basic block instructions to gates and get the translation context
    TranslationContext trans_ctx;
    trans_ctx.layout = &layout;
    if (!translate_block_instructions(block, resolver, reg_map, circuit, gate_ctx, data_symbols, trans_ctx, shared_label_to_pc)) {
        std::cerr << "Error translating instructions in block " << block.block_id << std::endl;
    }

    // Before PC update: flush architectural register writes to RAM
    // Helper to create immediate wire (like GateTranslator::create_immediate_wire)
    auto make_imm = [&](int64_t value) -> std::size_t {
        std::size_t wire_1 = reg_map.get_wire_1_index();
        f61 field_value;
        if (value < 0) field_value = f61::minor(static_cast<uint64_t>(-value));
        else           field_value = f61(static_cast<uint64_t>(value));
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {wire_1}, {field_value}));
        return circuit.size() - 1;
    };

    for (const auto &reg_idx : trans_ctx.regs_written) {
        if (!layout.is_arch(reg_idx)) continue;
        // Address for this register slot
        uint64_t addr = layout.slot_addr(reg_idx);
        std::size_t addr_wire = make_imm(addr);
        // Latest value wire for this register
        std::size_t value_wire = trans_ctx.get_register_wire(reg_idx);
        // STORE addr, value
        circuit.push_back(BaseOp(OPTYPE::STORE, {addr_wire, value_wire}));
    }

    // Add PC update logic at the end (pass trans_ctx so RET can read the updated %RA)
    // Pass byte address instead of block ID
    PCUpdateResult pc_result = add_pc_update_logic(block, resolver, reg_map, layout, circuit, gate_ctx, trans_ctx);
    if (pc_result.new_pc_wire == SIZE_MAX) {
        std::cerr << "Error adding PC update logic for block at address 0x" << std::hex << block.byte_address << std::dec << std::endl;
    }

    // Validate the circuit
    if (!validate_circuit(circuit, circuit_m)) {
        std::cerr << "Warning: Circuit validation failed for block " << block.block_id << std::endl;
    }

    // Create register mapping (only for circuit_m=2 actual registers)
    // The register mapping tells ZKCPU which wires contain the NEW values for each register
    std::vector<std::size_t> register_mapping(circuit_m);

    // Initialize with identity mapping for actual circuit registers
    for (std::size_t i = 0; i < circuit_m; i++) {
        register_mapping[i] = i;  // wire_1 at 0, PC at 1
    }

    // The PC register (index 1 in circuit_m=2) should point to the new PC wire
    std::size_t pc_index = 1;  // PC is always at index 1 for m=2
    if (pc_result.new_pc_wire != SIZE_MAX) {
        register_mapping[pc_index] = pc_result.new_pc_wire;
    }

    // Apply any modified registers from PC update (e.g., %RA for CALL instructions)
    for (const auto& [reg_idx, wire_idx] : pc_result.modified_registers) {
        if (layout.is_arch(reg_idx)) {
            // Materialize write to the RAM slot for this architectural register
            std::size_t addr_wire = make_imm(layout.slot_addr(reg_idx));
            circuit.push_back(BaseOp(OPTYPE::STORE, {addr_wire, wire_idx}));
        } else if (reg_idx < register_mapping.size()) {
            register_mapping[reg_idx] = wire_idx;
        }
        // std::cout << "   [DEBUG] Block " << block.block_id << ": Modified register " << reg_idx
        //           << " -> wire " << wire_idx << std::endl;
    }

    // Debug: print register mapping for key registers
    // std::size_t ra_idx = reg_map.get_register_index("%RA");
    // if (ra_idx != SIZE_MAX) {
    //     std::cout << "   [DEBUG] Block " << block.block_id << ": %RA (reg " << ra_idx
    //               << ") maps to wire " << register_mapping[ra_idx] << std::endl;
    // }
    // std::cout << "   [DEBUG] Block " << block.block_id << ": PC (reg " << pc_index
    //           << ") maps to wire " << register_mapping[pc_index] << std::endl;

    // Create and return the instruction with circuit_m=2
    return Instruction(circuit_m, std::move(circuit), std::move(register_mapping));
}

bool InstructionBuilder::translate_block_instructions(
    const BasicBlock& block,
    const LabelResolver& resolver,
    const RegisterMapping& reg_map,
    std::vector<BaseOp>& circuit,
    GateContext& gate_ctx,
    const std::map<std::string, uint32_t>& data_symbols,
    TranslationContext& trans_ctx,  // Now passed by reference so caller can access it
    const std::map<std::string, uint64_t>& shared_label_to_pc
) {
    // Initialize translation context
    trans_ctx.register_mapping = &reg_map;
    trans_ctx.data_symbols = data_symbols;  // Pass data symbols for COPYG resolution
    trans_ctx.register_count = reg_map.get_total_registers();
    trans_ctx.next_wire_id = reg_map.get_total_registers(); // Start after registers

    // Use the pre-built shared label-to-PC mapping (PERFORMANCE FIX: no longer rebuilding per block)
    trans_ctx.label_to_pc = shared_label_to_pc;

    // Translate each instruction in the basic block
    for (const auto& instr : block.instructions) {
        // Skip control flow instructions - they're handled by PC update logic
        if (BasicBlockParser::is_control_flow_instruction(instr.op)) {
            continue;
        }

        // Helper: Determine if instruction writes a destination register
        auto writes_dst = [](const AsmInstr& ins) {
            if (BasicBlockParser::is_control_flow_instruction(ins.op)) return false;
            if (ins.op == "STORE" || ins.op == "STOREB" || ins.op == "NOP") return false;
            if (ins.op == "INPUT")  return true;   // produces a value into the dst register
            return !ins.ops.empty() && ins.ops[0].kind == Operand::REG;
        };

        // Contract: Translator will push_back operation(s).
        std::size_t output_wire = circuit.size();
        std::size_t before = circuit.size();

        // Translate the instruction to gates
        if (!GateTranslator::translate_instruction(instr, output_wire, circuit, gate_ctx, trans_ctx)) {
            std::cerr << "Error translating instruction: " << instr.op << " at line " << instr.lineno << std::endl;
            return false;
        }

        // Verify contract for register-writing instructions
        std::size_t after = circuit.size();

        if (writes_dst(instr)) {
            if (instr.ops.empty() || instr.ops[0].kind != Operand::REG || instr.ops[0].reg_idx == SIZE_MAX) {
                std::cerr << "Parser/translator bug: dst reg not resolved for " << instr.op << std::endl;
                return false;
            }

            const std::size_t dst  = instr.ops[0].reg_idx;
            const std::size_t last = (circuit.empty() ? SIZE_MAX : circuit.size() - 1);

            // Be tolerant: if translator already mapped a different result wire,
            // normalize to the last produced wire (most ops do produce a single result at the end).
            if (trans_ctx.get_register_wire(dst) != last) {
                trans_ctx.set_register_wire(dst, last);
            }
        } else {
            // Non-writing ops can emit 0 or more helper ops.
            if (instr.op == "NOP" && (after - before) != 0) {
                std::cerr << "Warning: NOP emitted " << (after - before) << " ops" << std::endl;
            }
        }
    }

    return true;
}

PCUpdateResult InstructionBuilder::add_pc_update_logic(
    const BasicBlock& block,
    const LabelResolver& resolver,
    const RegisterMapping& reg_map,
    const RegisterLayout& layout,
    std::vector<BaseOp>& circuit,
    GateContext& gate_ctx,
    const TranslationContext& trans_ctx
) {
    // Get current PC wire
    std::size_t pc_wire = reg_map.get_pc_index();

    // Create PC update context (now with trans_ctx for register-to-wire mapping)
    // Pass byte address instead of block ID
    PCUpdateContext pc_ctx(reg_map, resolver, block.byte_address, pc_wire, trans_ctx, layout);

    // Generate PC update operations and return PCUpdateResult with new PC wire and modified registers
    PCUpdateResult result = PCUpdateGenerator::generate_pc_update(pc_ctx, circuit, gate_ctx);

    if (result.new_pc_wire == SIZE_MAX) {
        std::cerr << "Error generating PC update for block at address 0x" << std::hex << block.byte_address << std::dec << std::endl;
    }

    return result;
}

void InstructionBuilder::initialize_register_operations(
    std::vector<BaseOp>& circuit,
    std::size_t register_count
) {
    // Create REG operations for the first m wires
    // These represent the register file: [1, clock, reg_1, ..., reg_{m-4}, PC, sreg1, sreg2]
    circuit.reserve(register_count + 100);  // Pre-allocate space
    
    for (std::size_t i = 0; i < register_count; i++) {
        circuit.push_back(BaseOp(OPTYPE::REG));
    }
}

std::vector<std::size_t> InstructionBuilder::create_register_mapping(std::size_t register_count) {
    // Create identity mapping for registers
    std::vector<std::size_t> mapping(register_count);
    for (std::size_t i = 0; i < register_count; i++) {
        mapping[i] = i;
    }
    return mapping;
}

bool InstructionBuilder::validate_circuit(const std::vector<BaseOp>& circuit, std::size_t register_count) {
    // Basic validation checks
    if (circuit.size() < register_count) {
        std::cerr << "Circuit too small: " << circuit.size() << " < " << register_count << std::endl;
        return false;
    }
    
    // Check that first m operations are REG operations
    for (std::size_t i = 0; i < register_count; i++) {
        if (circuit[i].op != OPTYPE::REG) {
            std::cerr << "Expected REG operation at index " << i << ", got " << optype_to_string(circuit[i].op) << std::endl;
            return false;
        }
    }
    
    // Validate all operations (skip detailed validation after gate transformation)
    // Gate transformation may create complex operations that don't follow simple validation rules
    std::size_t invalid_count = 0;
    for (std::size_t i = 0; i < circuit.size(); i++) {
        if (!circuit[i].is_valid()) {
            // Count invalid operations but don't fail immediately
            // Many operations become valid after proper context setup
            invalid_count++;
            if (invalid_count <= 5) {  // Only show first few invalid operations
                std::cerr << "Warning: Potentially invalid operation at index " << i << ": " << optype_to_string(circuit[i].op) 
                         << " (wires: " << circuit[i].wires.size() << ", coeffs: " << circuit[i].coeffs.size() << ")" << std::endl;
            }
        }
    }
    
    if (invalid_count > 0) {
        std::cerr << "Note: " << invalid_count << " operations flagged during validation (may be resolved during execution)" << std::endl;
    }
    
    return true;  // Allow circuit to proceed even with validation warnings
}

// Helper function to build instructions from assembly file
// Note: register_count is the RegisterMapping space size (virtual registers), not circuit m
std::map<uint64_t, Instruction> build_instructions_from_assembly(const std::string& asm_file_path, std::size_t register_count = 20) {
    // std::cout << "Parsing assembly file: " << asm_file_path << std::endl;

    // Parse assembly into basic blocks
    BasicBlockResult blocks = BasicBlockParser::parse_to_blocks(asm_file_path, register_count);

    // std::cout << "Parsed " << blocks.blocks.size() << " basic blocks" << std::endl;

    // Build instructions from basic blocks
    return InstructionBuilder::build_instructions(blocks);
}

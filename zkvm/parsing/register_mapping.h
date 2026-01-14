#pragma once
#include <unordered_map>
#include <string>
#include <cstddef>

/**
 * Maps assembly register names to tight-zkvm register indices
 * Based on zkassembler register layout and tight-zkvm's fixed register scheme
 */
class RegisterMapping {
private:
    std::unordered_map<std::string, std::size_t> reg_map;
    std::size_t total_registers;
    
public:
    /**
     * Initialize register mapping for given total register count
     * Layout: [1, clock, reg_1, reg_2, ..., reg_{m-4}, PC, sreg1, sreg2]
     */
    RegisterMapping(std::size_t m) : total_registers(m) {
        // General purpose registers %GR1-%GR6 (Note: %GR0 removed - not used in assembly)
        for (int i = 1; i <= 6; i++) {
            reg_map["%GR" + std::to_string(i)] = 1 + i;
        }

        // System registers
        reg_map["%SP"] = 8;     // Stack pointer
        reg_map["%RT0"] = 9;    // Return value 0
        reg_map["%RT1"] = 10;   // Return value 1
        reg_map["%HP"] = 11;    // Heap pointer
        reg_map["%RA"] = 12;    // Return address
        reg_map["%FP"] = 13;    // Frame pointer

        // Special purpose registers for ZK operations
        reg_map["%TMP0"] = 14;  // Temporary 0
        reg_map["%TMP1"] = 15;  // Temporary 1
        reg_map["%OFF"] = 16;   // Offset temporary
        // Removed: %GR0, %SFT, %POV0, %POV1, %POV2, %MASK, %BASE (not used in assembly)

        // Fixed zkvm special registers
        // PC at reg[m-3], sreg1 at reg[m-2], sreg2 at reg[m-1]
        // These will be handled specially, not through normal register mapping
    }
    
    /**
     * Get zkvm register index for assembly register name
     * @param reg_name Assembly register name (e.g., "%GR1", "%SP")
     * @return Register index, or SIZE_MAX if not found
     */
    std::size_t get_register_index(const std::string& reg_name) const {
        auto it = reg_map.find(reg_name);
        return (it != reg_map.end()) ? it->second : SIZE_MAX;
    }
    
    /**
     * Check if register name is valid
     */
    bool is_valid_register(const std::string& reg_name) const {
        return reg_map.find(reg_name) != reg_map.end();
    }
    
    /**
     * Get PC register index (at index 1 for m=2)
     */
    std::size_t get_pc_index() const {
        return 1;
    }

    /**
     * Get wire_1 index (constant 1, always at 0)
     */
    std::size_t get_wire_1_index() const {
        return 0;
    }
    
    /**
     * Get total number of registers
     */
    std::size_t get_total_registers() const {
        return total_registers;
    }

    /**
     * Get register name from index (reverse lookup)
     * @param idx Register index
     * @return Register name, or "r{idx}" if not a named register
     */
    std::string get_register_name(std::size_t idx) const {
        // For m=2: [wire_1, PC]
        if (idx == 0) return "wire_1";
        if (idx == 1) return "%PC";

        // Search for named register
        for (const auto& pair : reg_map) {
            if (pair.second == idx) {
                return pair.first;
            }
        }

        // Default: return generic name
        return "r" + std::to_string(idx);
    }
};

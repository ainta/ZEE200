#pragma once
#include "machine.h"
#include <vector>
#include <map>
#include <string>
#include <cstdint>

// Forward declare types from zkvm
struct AsmInstr;

namespace cleartext {

/**
 * Execute zkvm assembly in cleartext (non-cryptographic) mode
 * This is straightforward CPU-like execution for the prover
 *
 * @param assembly - Vector of parsed assembly instructions
 * @param ram_size - Size of RAM in words
 * @param max_steps - Maximum number of execution steps
 * @param labels - Map from label names to instruction indices (for control flow)
 * @param data_symbols - Map from data symbol names to addresses (for COPYG)
 * @param data_image - Data section byte image to load into RAM
 * @param data_base_addr - Base address for data section (default: 0x10000)
 * @return Vector of uint32_t values representing the final input stack contents
 *         (in FIFO order, ready to be loaded into zkVM input queue)
 */
std::vector<uint32_t> execute_cleartext_from_assembly(
    const std::vector<AsmInstr>& assembly,
    size_t ram_size = 1024,
    size_t max_steps = 2000000000,
    const std::map<std::string, size_t>& labels = std::map<std::string, size_t>(),
    const std::map<std::string, uint32_t>& data_symbols = std::map<std::string, uint32_t>(),
    const std::vector<uint8_t>& data_image = std::vector<uint8_t>(),
    uint32_t data_base_addr = 0x10000,
    uint32_t qed_memory_addr = 0xFFFFFFFFu // default is out of bounds, if not set, the execution will continue until the end of the program
);

} // namespace cleartext

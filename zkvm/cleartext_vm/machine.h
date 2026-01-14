#pragma once
#include <vector>
#include <stack>
#include <cstdint>

namespace cleartext
{

    /**
     * CleartextMachine - represents the state of the cleartext VM
     * This matches the Machine structure from zk-machine-cleartext
     * Updated: 20 registers (was 32) after removing unused registers
     */
    struct CleartextMachine{
        uint32_t pc;                      // Program counter
        std::vector<uint32_t> registry;   // 20 registers (reduced from 32)
        std::vector<uint32_t> memory;     // RAM (word-addressed)
        std::vector<uint64_t> program;    // Program code (64-bit instructions)
        std::stack<uint32_t> input;       // Input stack (LIFO, but oracles push reversed for FIFO)
        std::vector<uint32_t> input_tape; // Records values popped by INPUT (for ZK input_queue)
        uint32_t qed_memory_addr;      // Address of memory location where means touching this address will prove the program is executed as intended
                                          // default is out of bounds, which means the execution will continue until the end of the program
        bool qed_memory_addr_touched;  // Flag to indicate if the qed_memory_addr has been touched

        CleartextMachine() : pc(0){
            registry.resize(20, 0);
        }

        CleartextMachine(std::size_t memory_size) : pc(0){
            registry.resize(20, 0);
            memory.resize(memory_size, 0);
        }
    };

} // namespace cleartext

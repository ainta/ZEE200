#pragma once
#include <cstddef>

namespace RomOffsets {
    // Bitwise operation lookup tables (256x256 = 65536 entries each)
    static constexpr size_t XOR32_SIZE = (1 << 16);  // 65536 entries
    static constexpr size_t AND32_SIZE = (1 << 16);  // 65536 entries
    static constexpr size_t OR32_SIZE  = (1 << 16);  // 65536 entries

    // Power-of-2 lookup table for byte operations (shift amounts 0-31)
    static constexpr size_t BYTE_SHIFT_POW2_SIZE = 32;  // entries 0..31

    // Absolute offsets in RAM (all outside 32-bit address space)
    static constexpr uint64_t AND_OFFSET  = (1ULL << 36);    // AND32 table in RAM
    static constexpr uint64_t OR_OFFSET   = (1ULL << 37);    // OR32 table in RAM
    static constexpr uint64_t XOR_OFFSET  = (1ULL << 38);    // XOR32 table in RAM
    static constexpr uint64_t POW2_OFFSET = (1ULL << 39);    // POW2 / BYTE_SHIFT_POW2 table in RAM

    // MOD4 table: RAM[MOD4_OFFSET + i] = i % 4 for i = 0..65535
    static constexpr uint64_t MOD4_OFFSET = (1ULL << 40);  // 0x10000000000
    static constexpr size_t MOD4_SIZE     = (1 << 16);     // 65536 entries

    // HIGH8 table: RAM[HIGH8_OFFSET + i] = i >> 8 for i = 0..65535
    // Returns the high 8 bits of a 16-bit value
    static constexpr uint64_t HIGH8_OFFSET = (1ULL << 41);  // 0x20000000000
    static constexpr size_t HIGH8_SIZE     = (1 << 16);     // 65536 entries
}

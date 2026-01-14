#pragma once

#include "parsing/register_mapping.h"
#include <algorithm>
#include <cstddef>
#include <cstdint>

/**
 * Describes how architectural registers are embedded as RAM slots.
 *
 * This is the structured replacement for the old no_reg_config.h globals.
 * We keep the "2 real registers (wire_1, %PC), rest as RAM slots" model,
 * but make the mapping explicit and derivable from RegisterMapping.
 */
struct RegisterLayout {
    // Byte address base such that slot_addr(idx) = slot_base + idx
    // for any architectural register index idx.
    uint64_t    slot_base = 0;

    // Inclusive index range of registers that live in RAM slots.
    // Matches the old [g_no_reg_first_index, g_no_reg_last_index].
    std::size_t arch_min  = 0;
    std::size_t arch_max  = 0;

    // Named indices for convenience.
    std::size_t sp_idx = static_cast<std::size_t>(-1);
    std::size_t fp_idx = static_cast<std::size_t>(-1);
    std::size_t hp_idx = static_cast<std::size_t>(-1);
    std::size_t ra_idx = static_cast<std::size_t>(-1);

    bool is_arch(std::size_t idx) const {
        return idx >= arch_min && idx <= arch_max;
    }

    // Byte address of the RAM slot backing register index idx.
    uint64_t slot_addr(std::size_t idx) const {
        return slot_base + idx;
    }

    /**
     * Construct the default layout from a RegisterMapping of size m.
     * We use the mapping's indices for %GR1..%OFF and place their slots
     * at addresses starting near 2^35, outside the 32‑bit program space.
     */
    static RegisterLayout make_default(std::size_t virtual_reg_count) {
        RegisterMapping reg_map(virtual_reg_count);
        RegisterLayout layout;

        // Collect all architectural register indices we want to live in RAM.
        std::vector<std::size_t> arch;
        auto push = [&](const char* name) {
            std::size_t idx = reg_map.get_register_index(name);
            if (idx != SIZE_MAX) arch.push_back(idx);
            return idx;
        };

        // General-purpose + system registers
        push("%GR1");
        push("%GR2");
        push("%GR3");
        push("%GR4");
        push("%GR5");
        push("%GR6");
        std::size_t sp = push("%SP");
        push("%RT0");
        push("%RT1");
        std::size_t hp = push("%HP");
        std::size_t ra = push("%RA");
        std::size_t fp = push("%FP");
        // ZKVM temporaries
        push("%TMP0");
        push("%TMP1");
        push("%OFF");

        if (arch.empty()) {
            // Should never happen with the fixed 20‑register mapping.
            throw std::runtime_error("RegisterLayout::make_default: no architectural registers found");
        }

        auto mm = std::minmax_element(arch.begin(), arch.end());
        layout.arch_min = *mm.first;
        layout.arch_max = *mm.second;

        // Place slots at addresses REG_OFFSET + (idx - arch_min), with REG_OFFSET = 2^35.
        // This is equivalent to slot_base = 2^35 - arch_min and slot_addr(idx) = slot_base + idx.
        constexpr uint64_t REG_OFFSET = (1ULL << 35);
        layout.slot_base = REG_OFFSET - layout.arch_min;

        layout.sp_idx = sp;
        layout.fp_idx = fp;
        layout.hp_idx = hp;
        layout.ra_idx = ra;

        return layout;
    }
};


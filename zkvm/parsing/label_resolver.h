#pragma once
#include <unordered_map>
#include <string>
#include <vector>
#include <cstddef>
#include <cstdint>

#include "basic_block_parser.h"

/**
 * Label resolver for tight-zkvm assembly translation
 *
 * Provides mapping from labels → blocks and exposes helpers to resolve
 * control-flow either by block-id (legacy) or by byte address (current).
 */

class LabelResolver {
public:
    /**
     * Initialize resolver with parsed basic blocks
     */
    explicit LabelResolver(const BasicBlockResult& blocks);

    // -------------------------
    // Byte-address oriented API
    // -------------------------

    /**
     * Lookup block by its starting byte address.
     * @return pointer to BasicBlock or nullptr if not found
     */
    const BasicBlock* get_block_by_address(uint64_t byte_address) const;

    /**
     * Resolve the target *byte address* for the control-flow at a block
     * identified by its starting byte address.
     * - For JUMP/CALL: returns target block's start address
     * - For FALL_THROUGH: returns the next block's start address
     * - For RET/HALT: returns UINT64_MAX (dynamic/no static target)
     * - On failure: returns UINT64_MAX
     */
    uint64_t resolve_control_flow_target_address(uint64_t current_block_address) const;

    /**
     * Get the fallthrough block's *byte address* for a block identified
     * by its starting byte address.
     * @return next block's start address, or UINT64_MAX if none
     */
    uint64_t get_fallthrough_address(uint64_t current_block_address) const;

    /**
     * Resolve a label to its start *byte address*.
     * @return byte address, or UINT64_MAX if label not found
     */
    uint64_t resolve_label_to_address(const std::string& label) const;

    /**
     * Convert a block ID to its start *byte address*.
     * @return byte address, or UINT64_MAX if invalid
     */
    uint64_t block_id_to_byte_address(std::size_t block_id) const;

    // -----------------------
    // Label / symbol helpers
    // -----------------------

    /**
     * Resolve label to block ID.
     * @return Block ID, or SIZE_MAX if label not found
     */
    std::size_t resolve_label_to_block_id(const std::string& label) const;

    /** Check if a label exists. */
    bool has_label(const std::string& label) const;

    /** Return all defined labels (sorted). */
    std::vector<std::string> get_all_labels() const;

    // ----------------------------
    // Legacy block-id oriented API
    // ----------------------------

    /**
     * Resolve control flow target for a given block ID.
     * Returns target block ID, or SIZE_MAX if no static target.
     * (RET/HALT return SIZE_MAX.)
     */
    std::size_t resolve_control_flow_target(std::size_t block_id) const;

    /** Get control-flow type string for a block ID ("" if invalid). */
    std::string get_control_flow_type(std::size_t block_id) const;

    /**
     * Get next sequential block ID (fallthrough).
     * @return Next block ID, or SIZE_MAX if this is the last block
     */
    std::size_t get_next_block_id(std::size_t block_id) const;

    /** Get total number of blocks. */
    std::size_t get_block_count() const;

    /** Check if a block ID is valid. */
    bool is_valid_block_id(std::size_t block_id) const;

    /** Get block pointer by block ID (nullptr if invalid). */
    const BasicBlock* get_block(std::size_t block_id) const;

    /** Get block pointer by array index (nullptr if invalid). */
    const BasicBlock* get_block_by_index(std::size_t index) const;

    /**
     * Find entry point block:
     *  - prefer "main", then "_start", else the first block if any.
     * @return entry block ID, or SIZE_MAX if none
     */
    std::size_t find_entry_block() const;

private:
    const BasicBlockResult& blocks_;

    // block_id → index into blocks_.blocks
    std::unordered_map<std::size_t, std::size_t> block_id_to_index_;

    // start byte address → index into blocks_.blocks
    std::unordered_map<uint64_t, std::size_t> addr_to_index_;

    // Build internal maps (id and address).
    void build_mappings();
};

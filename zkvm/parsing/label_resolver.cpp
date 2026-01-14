#include "label_resolver.h"
#include <algorithm>
#include <iostream>
#include <climits>

LabelResolver::LabelResolver(const BasicBlockResult& blocks) : blocks_(blocks) {
    build_mappings();
}

void LabelResolver::build_mappings() {
    // Build block_id/address → index mapping for efficient lookup
    for (std::size_t i = 0; i < blocks_.blocks.size(); i++) {
        block_id_to_index_[blocks_.blocks[i].block_id]   = i;
        addr_to_index_[blocks_.blocks[i].byte_address]   = i;
    }
}

std::size_t LabelResolver::resolve_label_to_block_id(const std::string& label) const {
    auto it = blocks_.label_to_block_id.find(label);
    return (it != blocks_.label_to_block_id.end()) ? it->second : SIZE_MAX;
}

uint64_t LabelResolver::resolve_label_to_address(const std::string& label) const {
    auto it = blocks_.label_to_address.find(label);
    return (it != blocks_.label_to_address.end()) ? it->second : UINT64_MAX;
}

uint64_t LabelResolver::block_id_to_byte_address(std::size_t block_id) const {
    auto idx_it = block_id_to_index_.find(block_id);
    if (idx_it == block_id_to_index_.end()) return UINT64_MAX;
    return blocks_.blocks[idx_it->second].byte_address;
}

bool LabelResolver::has_label(const std::string& label) const {
    return blocks_.label_to_block_id.find(label) != blocks_.label_to_block_id.end();
}

std::vector<std::string> LabelResolver::get_all_labels() const {
    std::vector<std::string> labels;
    labels.reserve(blocks_.label_to_block_id.size());
    for (const auto& pair : blocks_.label_to_block_id) {
        labels.push_back(pair.first);
    }
    std::sort(labels.begin(), labels.end());
    return labels;
}

std::size_t LabelResolver::resolve_control_flow_target(std::size_t block_id) const {
    auto idx_it = block_id_to_index_.find(block_id);
    if (idx_it == block_id_to_index_.end()) return SIZE_MAX;

    const BasicBlock& block = blocks_.blocks[idx_it->second];

    if (block.control_flow_type == "FALL_THROUGH") {
        return get_next_block_id(block_id);
    } else if (!block.control_flow_target.empty()) {
        return resolve_label_to_block_id(block.control_flow_target);
    } else if (block.control_flow_type == "RET" ||
               block.control_flow_type == "HALT" ||
               block.control_flow_type == "QED") {
        // RET/HALT/QED don't have static targets - handled at runtime
        return SIZE_MAX;
    }
    return SIZE_MAX;
}

std::string LabelResolver::get_control_flow_type(std::size_t block_id) const {
    auto idx_it = block_id_to_index_.find(block_id);
    if (idx_it == block_id_to_index_.end()) return "";
    return blocks_.blocks[idx_it->second].control_flow_type;
}

std::size_t LabelResolver::get_next_block_id(std::size_t block_id) const {
    auto idx_it = block_id_to_index_.find(block_id);
    if (idx_it == block_id_to_index_.end()) return SIZE_MAX;
    std::size_t current_index = idx_it->second;
    if (current_index + 1 < blocks_.blocks.size()) {
        return blocks_.blocks[current_index + 1].block_id;
    }
    return SIZE_MAX;
}

std::size_t LabelResolver::get_block_count() const {
    return blocks_.blocks.size();
}

bool LabelResolver::is_valid_block_id(std::size_t block_id) const {
    return block_id_to_index_.find(block_id) != block_id_to_index_.end();
}

const BasicBlock* LabelResolver::get_block(std::size_t block_id) const {
    auto idx_it = block_id_to_index_.find(block_id);
    if (idx_it == block_id_to_index_.end()) return nullptr;
    return &blocks_.blocks[idx_it->second];
}

const BasicBlock* LabelResolver::get_block_by_index(std::size_t index) const {
    if (index >= blocks_.blocks.size()) return nullptr;
    return &blocks_.blocks[index];
}

std::size_t LabelResolver::find_entry_block() const {
    // Prefer "main", then "_start", else first block
    std::size_t main_block = resolve_label_to_block_id("main");
    if (main_block != SIZE_MAX) return main_block;
    std::size_t start_block = resolve_label_to_block_id("_start");
    if (start_block != SIZE_MAX) return start_block;
    if (!blocks_.blocks.empty()) return blocks_.blocks[0].block_id;
    return SIZE_MAX;
}

// Debug (commented out in your code base)
// void print_label_mappings(const LabelResolver& resolver) { ... }

// Address-based API implementations
const BasicBlock* LabelResolver::get_block_by_address(uint64_t byte_address) const {
    auto it = addr_to_index_.find(byte_address);
    if (it == addr_to_index_.end()) return nullptr;
    return &blocks_.blocks[it->second];
}

uint64_t LabelResolver::resolve_control_flow_target_address(uint64_t current_block_address) const {
    const BasicBlock* block = get_block_by_address(current_block_address);
    if (!block) return UINT64_MAX;

    if (block->control_flow_type == "FALL_THROUGH") {
        return get_fallthrough_address(current_block_address);
    } else if (!block->control_flow_target.empty()) {
        auto label_it = blocks_.label_to_address.find(block->control_flow_target);
        if (label_it != blocks_.label_to_address.end()) return label_it->second;
        return UINT64_MAX;
    } else if (block->control_flow_type == "RET" ||
               block->control_flow_type == "HALT" ||
               block->control_flow_type == "QED") {
        return UINT64_MAX;  // dynamic/no static target
    }
    return UINT64_MAX;
}

uint64_t LabelResolver::get_fallthrough_address(uint64_t current_block_address) const {
    auto it = addr_to_index_.find(current_block_address);
    if (it == addr_to_index_.end()) return UINT64_MAX;

    std::size_t current_index = it->second;
    if (current_index + 1 < blocks_.blocks.size()) {
        return blocks_.blocks[current_index + 1].byte_address;
    }
    return UINT64_MAX;
}

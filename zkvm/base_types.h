#pragma once

#include <vector>
#include <string>
#include <cassert>
#include "types.h"

static constexpr std::size_t BITS_PER_BYTE = 8;
static constexpr std::size_t BITS_PER_UINT16 = 16;
static constexpr std::size_t BITS_PER_UINT32 = 32;
static constexpr std::size_t BITS_PER_UINT48 = 48;
static constexpr uint64_t UINT8_MASK = (1ULL << 8) - 1;
static constexpr uint64_t UINT16_MASK = (1ULL << 16) - 1;
static constexpr uint64_t UINT32_MASK = (1ULL << 32) - 1;
static constexpr std::size_t BYTES_PER_UINT32 = 4;

/**
 * Represents a basic operation in the circuit with its type, wire connections, and coefficients.
 * Each operation connects to specific wires and may have associated coefficients for linear operations.
 */
class BaseOp {
public:
    OPTYPE op;
    std::vector<std::size_t> wires;
    std::vector<f61> coeffs;
    std::int64_t imm; // immediate value
    
    BaseOp() : op(OPTYPE::INPUT) {}
    explicit BaseOp(OPTYPE operation) : op(operation) {}
    BaseOp(OPTYPE operation, std::vector<std::size_t> wire_indices, std::vector<f61> coefficients = {}, std::int64_t imm = 0)
        : op(operation), wires(std::move(wire_indices)), coeffs(std::move(coefficients)), imm(imm) {}
    
    /** 
     * Validates that the operation has the correct number of wires and coefficients.
     * @return true if the operation is valid, false otherwise
     */
    bool is_valid() const {
        switch (op) {
            case OPTYPE::ROM:
            case OPTYPE::LOAD:
            case OPTYPE::SRLI:
            case OPTYPE::MUL32I:
            case OPTYPE::MSB:
            case OPTYPE::POW2:
            case OPTYPE::MOD4:
            case OPTYPE::AND32I:
            case OPTYPE::OR32I:
            case OPTYPE::XOR32I:
                return wires.size() == 1;
            case OPTYPE::MUL:
            case OPTYPE::STORE:
            case OPTYPE::ADD32:
            case OPTYPE::MUL32:
            case OPTYPE::SUB32:
            case OPTYPE::XOR32:
            case OPTYPE::OR32:
            case OPTYPE::AND32:
            case OPTYPE::UDIV:
            case OPTYPE::UREM:
            case OPTYPE::ULT:
            case OPTYPE::ULTE:
                return wires.size() == 2;
            case OPTYPE::EQZ:
                // EQZ can have 1 wire (pre-transformation) or 2 wires (post-transformation as LINEAR)
                return wires.size() >= 1 && wires.size() <= 2;
            case OPTYPE::LINEAR:
                return wires.size() == coeffs.size() || coeffs.empty();
            case OPTYPE::INPUT:
            case OPTYPE::REG:
            case OPTYPE::MEM:
            case OPTYPE::ZKSET:
                return true;  // These operations have flexible wire requirements
            // High-level memory operations (take 1 address wire)
            case OPTYPE::ULOADB:
            case OPTYPE::LOADB:
            case OPTYPE::ULOADH:
            case OPTYPE::LOADH:
                return wires.size() == 1;
            // High-level store operations (take 2 wires: address, value)
            case OPTYPE::STOREB:
            case OPTYPE::STOREH:
                return wires.size() == 2;
            // High-level signed division/remainder
            case OPTYPE::SDIV:
            case OPTYPE::SREM:
                return wires.size() == 2;
            default:
                return true;
        }
    }
    
    std::size_t expected_wire_count() const {
        switch (op) {
            case OPTYPE::ROM:
            case OPTYPE::LOAD:
            case OPTYPE::EQZ:
            case OPTYPE::MSB:
            case OPTYPE::SRLI:
            case OPTYPE::MUL32I:
            case OPTYPE::POW2:
            case OPTYPE::MOD4:
            case OPTYPE::AND32I:
            case OPTYPE::OR32I:
            case OPTYPE::XOR32I:
                return 1;
            case OPTYPE::MUL:
            case OPTYPE::STORE:
            case OPTYPE::ADD32:
            case OPTYPE::MUL32:
            case OPTYPE::SUB32:
            case OPTYPE::XOR32:
            case OPTYPE::OR32:
            case OPTYPE::AND32:
            case OPTYPE::UDIV:
            case OPTYPE::UREM:
            case OPTYPE::ULT:
            case OPTYPE::ULTE:
                return 2;
            case OPTYPE::LINEAR:
                return 0;
            // High-level memory operations
            case OPTYPE::ULOADB:
            case OPTYPE::LOADB:
            case OPTYPE::ULOADH:
            case OPTYPE::LOADH:
                return 1;
            case OPTYPE::STOREB:
            case OPTYPE::STOREH:
            case OPTYPE::SDIV:
            case OPTYPE::SREM:
                return 2;
            default:
                return 0;
        }
    }
};

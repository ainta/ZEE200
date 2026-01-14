#pragma once
#include "base_gate.h"
#include <cassert>

/**
 * Shift right arithmetic immediate gate
 * SRAI a imm result
 *   result = (signed)a >> imm (arithmetic shift preserves sign bit)
 *
 * Implementation: Decompose using only primitives
 * For arithmetic right shift, we need to handle sign extension
 * a = lower_bits + (result << imm) + (sign_bit << 31)
 * where result is the output, lower_bits are the discarded bits
 */
class SraiGate : public BaseGate {
public:
    OPTYPE get_type() const override { return OPTYPE::SRAI; }
    std::string get_name() const override { return "SraiGate"; }

    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& /*registry*/) override {
        assert(op.wires.size() == 1);
        std::size_t a_id = op.wires[0];
        int64_t shift_amount = op.imm;

        assert(shift_amount >= 0 && shift_amount < 32);

        circuit[op_index] = BaseOp(OPTYPE::INPUT);
        std::size_t result_id = op_index;

        if (shift_amount == 0) {
            // No shift: result = a
            circuit.push_back(BaseOp(OPTYPE::LINEAR, {result_id, a_id}, {1, f61::minor(1)}));
            ctx.checkzero_wires.push_back(circuit.size() - 1);
            return;
        }

        // Decompose result into 16-bit chunks
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t r0_id = circuit.size() - 1;
        ctx.set2id.push_back(r0_id);

        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t r16_id = circuit.size() - 1;
        ctx.set2id.push_back(r16_id);

        circuit.push_back(BaseOp(OPTYPE::LINEAR, {r0_id, r16_id}, {1, 1<<16}));
        std::size_t result_reconstructed_id = circuit.size() - 1;

        // result_reconstructed should equal result_id
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {result_id, result_reconstructed_id}, {1, f61::minor(1)}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // Extract sign bit (bit 31 of 'a')
        // sign_bit is boolean
        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t sign_bit_id = circuit.size() - 1;

        // Boolean constraint: sign_bit * (1 - sign_bit) = 0
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {sign_bit_id, ctx.wire_1}, {f61::minor(1), 1}));
        std::size_t one_minus_sign_id = circuit.size() - 1;
        circuit.push_back(BaseOp(OPTYPE::MUL, {sign_bit_id, one_minus_sign_id}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // Decompose lower_bits (bits that get shifted out)
        // Need to ensure lower_bits < 2^shift_amount
        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t lower_bits_id = circuit.size() - 1;

        // Range check: lower_bits must be in [0, 2^shift_amount)
        // We do this by requiring lower_bits * 2^(32-shift_amount) to be in [0, 2^32)
        // which we can check by decomposing into two 16-bit chunks
        if (shift_amount <= 16) {
            circuit.push_back(BaseOp(OPTYPE::ZKSET));
            std::size_t scaled_id = circuit.size() - 1;
            ctx.set2id.push_back(scaled_id);

            circuit.push_back(BaseOp(OPTYPE::LINEAR, {lower_bits_id, scaled_id},
                                    {f61::minor(1ULL << (16 - shift_amount)), 1}));
            ctx.checkzero_wires.push_back(circuit.size() - 1);
        } else {
            circuit.push_back(BaseOp(OPTYPE::ZKSET));
            std::size_t scaled_lo_id = circuit.size() - 1;
            ctx.set2id.push_back(scaled_lo_id);

            circuit.push_back(BaseOp(OPTYPE::ZKSET));
            std::size_t scaled_hi_id = circuit.size() - 1;
            ctx.set2id.push_back(scaled_hi_id);

            circuit.push_back(BaseOp(OPTYPE::LINEAR, {lower_bits_id, scaled_lo_id, scaled_hi_id},
                                    {f61::minor(1ULL << (32 - shift_amount)), 1, f61::minor(1<<16)}));
            ctx.checkzero_wires.push_back(circuit.size() - 1);
        }

        // Main constraint: a = lower_bits + result * 2^shift_amount + sign_bit * 2^31 (mod 2^32)
        // But we need to be careful about overflow
        //
        // Actually, let's think differently:
        // If sign_bit = 0: a = lower_bits + result * 2^shift_amount
        // If sign_bit = 1: a = lower_bits + result * 2^shift_amount - 2^32 + 2^31
        //                    = lower_bits + result * 2^shift_amount - 2^31
        //
        // So: a + sign_bit * 2^31 = lower_bits + result * 2^shift_amount (as integers)
        //
        // We need to handle the case where result has bit 31 set for sign extension
        //
        // Let me use a different formulation:
        // a (as 32-bit) = lower_bits + (result << shift_amount) (mod 2^32)
        // and sign_bit = bit 31 of a
        //
        // For arithmetic shift, if sign_bit=1, result should have upper bits set to 1
        // result (arithmetic) = (a >> shift_amount) | (sign_bit * fill_mask)
        // where fill_mask = 0xFFFFFFFF << (32 - shift_amount)
        //
        // Let's decompose this differently:
        // Define result_unsigned = a >> shift_amount (logical shift)
        // Then result_arithmetic = result_unsigned + sign_bit * sign_extension_value
        // where sign_extension_value = fill_mask

        // Actually, let's use a cleaner approach:
        // We'll decompose 'a' as: a = a_lower_31bits + sign_bit * 2^31
        // Then a_lower_31bits >> shift_amount gives us part of the result
        // And if sign_bit=1, we add the sign extension

        // Let me restart with a simpler formulation:
        // a (mod 2^32) = lower_bits + result_shifted
        // where result_shifted = result * 2^shift_amount (may overflow 32 bits)
        //
        // We need to track overflow: result_shifted = r_low + r_high * 2^32
        // So: a = lower_bits + r_low (mod 2^32)
        //     and r_high is the overflow (which relates to sign extension)

        // Actually the cleanest way: use the fact that
        // For arithmetic right shift by k bits:
        //   result = (a >> k) for positive a
        //   result = (a >> k) | (0xFFFFFFFF << (32-k)) for negative a
        //
        // We can write: a = lower_bits + (result << k) - (sign_bit << 31) * fill
        // where fill accounts for the sign extension overflow

        // Let's implement it more directly:
        // constraint: a = lower_bits + result * 2^shift_amount + overflow * 2^32 - sign_bit * sign_extension_contribution

        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t overflow_id = circuit.size() - 1;

        // Boolean constraint for overflow (can be negative, so we need to handle this carefully)
        // Actually, for arithmetic shift, we need: a + sign_bit * fill_mask = lower_bits + result * 2^shift_amount
        // where fill_mask = (0xFFFFFFFF - 0xFFFFFFFF << shift_amount) + 2^32
        //                 = 2^shift_amount - 1 + 2^32

        // This is getting complex. Let me use the simplest formulation:
        // Main constraint: a = lower_bits + result_shifted_low - overflow * 2^32
        // where result_shifted = result * 2^shift_amount = result_shifted_low + overflow * 2^32
        // and overflow = result >> (32 - shift_amount)

        // For arithmetic shift, the overflow bits should match the sign bit pattern
        // We'll enforce: overflow = sign_bit * expected_overflow
        // where expected_overflow = (0xFFFFFFFF >> (32 - shift_amount)) if shift_amount > 0

        uint64_t fill_mask = (shift_amount >= 32) ? 0xFFFFFFFFULL : ((0xFFFFFFFFULL) << (32 - shift_amount));
        uint64_t expected_overflow_value = fill_mask >> 32;

        // Overflow must match sign-extended pattern
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {overflow_id, sign_bit_id},
                                {1, f61::minor(expected_overflow_value)}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // Main arithmetic constraint
        // a = lower_bits + (result << shift_amount) - overflow * 2^32 (as integers)
        // over F_p: a + overflow * 2^32 - lower_bits - result * 2^shift_amount = 0
        circuit.push_back(BaseOp(OPTYPE::LINEAR,
            {a_id, overflow_id, lower_bits_id, result_id},
            {1, f61(1ULL << 32), f61::minor(1), f61::minor(1ULL << shift_amount)}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // Constraint to ensure a = a_lower + sign_bit * 2^31
        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t a_lower_id = circuit.size() - 1;

        // Decompose a_lower into two 16-bit chunks for range check
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t a_l0_id = circuit.size() - 1;
        ctx.set2id.push_back(a_l0_id);

        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t a_l15_id = circuit.size() - 1;
        ctx.set2id.push_back(a_l15_id);

        // a_lower = a_l0 + a_l15 * 2^15 (ensure it's 31 bits)
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {a_lower_id, a_l0_id, a_l15_id},
                                {1, f61::minor(1), f61::minor(1<<15)}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // Range check a_l0: must be < 2^15
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t a_l0_scaled_id = circuit.size() - 1;
        ctx.set2id.push_back(a_l0_scaled_id);

        circuit.push_back(BaseOp(OPTYPE::LINEAR, {a_l0_id, a_l0_scaled_id},
                                {f61::minor(1<<1), 1}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // a = a_lower + sign_bit * 2^31
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {a_id, a_lower_id, sign_bit_id},
                                {1, f61::minor(1), f61::minor(1ULL << 31)}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);
    }

    void execute(std::size_t op_index, const BaseOp& op,
                std::vector<f61>& wire_val, ExecuteContext& ctx,
                GateRegistry& /*registry*/) override {
        assert(op.wires.size() == 1);
        uint64_t a = wire_val[op.wires[0]].val;
        int64_t shift_amount = op.imm;

        assert(shift_amount >= 0 && shift_amount < 32);
        assert(a < (1ULL << 32));

        // Perform arithmetic shift (sign-extending)
        int32_t a_signed = static_cast<int32_t>(a);
        int32_t result_signed = a_signed >> shift_amount;
        uint32_t result = static_cast<uint32_t>(result_signed);

        wire_val[op_index] = result;

        if (shift_amount == 0) {
            ctx.num_wires++;  // constraint wire
            return;
        }

        // Compute all intermediate values
        uint64_t r0 = result & 0xFFFF;
        uint64_t r16 = result >> 16;
        uint64_t sign_bit = (a >> 31) & 1;
        uint64_t lower_bits = a & ((1ULL << shift_amount) - 1);

        // Compute overflow: (result << shift_amount) >> 32
        uint64_t result_shifted = ((uint64_t)result) << shift_amount;
        uint64_t overflow = result_shifted >> 32;

        uint64_t a_lower = a & 0x7FFFFFFFULL; // lower 31 bits
        uint64_t a_l0 = a_lower & ((1<<15) - 1);
        uint64_t a_l15 = a_lower >> 15;

        // Set witnesses
        std::size_t r0_id = ctx.num_wires++;
        wire_val[r0_id] = r0;
        std::size_t r16_id = ctx.num_wires++;
        wire_val[r16_id] = r16;
        ctx.num_wires++; // result_reconstructed
        ctx.num_wires++; // constraint

        std::size_t sign_bit_id = ctx.num_wires++;
        wire_val[sign_bit_id] = sign_bit;
        ctx.num_wires++; // one_minus_sign
        ctx.num_wires++; // boolean constraint

        std::size_t lower_bits_id = ctx.num_wires++;
        wire_val[lower_bits_id] = lower_bits;

        // Range check for lower_bits
        if (shift_amount <= 16) {
            wire_val[ctx.num_wires++] = lower_bits << (16 - shift_amount);
            ctx.num_wires++; // constraint
        } else {
            uint64_t scaled = lower_bits << (32 - shift_amount);
            wire_val[ctx.num_wires++] = scaled & 0xFFFF;
            wire_val[ctx.num_wires++] = scaled >> 16;
            ctx.num_wires++; // constraint
        }

        std::size_t overflow_id = ctx.num_wires++;
        wire_val[overflow_id] = overflow;
        ctx.num_wires++; // overflow constraint
        ctx.num_wires++; // main arithmetic constraint

        std::size_t a_lower_id = ctx.num_wires++;
        wire_val[a_lower_id] = a_lower;
        wire_val[ctx.num_wires++] = a_l0;
        wire_val[ctx.num_wires++] = a_l15;
        ctx.num_wires++; // a_lower decomposition constraint
        wire_val[ctx.num_wires++] = a_l0 << 1;
        ctx.num_wires++; // a_l0 range check constraint
        ctx.num_wires++; // a = a_lower + sign_bit constraint
    }
};

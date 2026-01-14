#pragma once
#include "base_gate.h"
#include <cassert>

/**
 * Variable arithmetic right shift gate.
 *
 * SRA dst, a, k
 *   dst = (int32_t)a >> k
 *
 * Gate implementation (over F_{2^61-1}):
 *   - Let s    = MSB(a) ∈ {0,1}
 *   - Let pow  = 2^k        via POW2
 *   - Let q_u  = floor(a / pow) via UDIV
 *   - Introduce t with constraint t * pow = 2^32
 *   - Define result_enc = q_u + s * (2^32 - t)
 *   - Range-check result_enc ∈ [0,2^32) via two ZKSET limbs.
 *
 * This keeps the cost dominated by ZKSET, with exactly one MEM access
 * coming from POW2's ROM lookup.
 */
class SraGate : public BaseGate {
public:
    OPTYPE get_type() const override { return OPTYPE::SRA; }
    std::string get_name() const override { return "SraGate"; }

    void transform(std::size_t op_index,
                   BaseOp op,
                   std::vector<BaseOp>& circuit,
                   GateContext& ctx,
                   GateRegistry& registry) override {
        assert(op.wires.size() == 2);
        std::size_t a_id = op.wires[0];
        std::size_t k_id = op.wires[1];

        // Sign bit s = MSB(a)
        std::size_t sign_id = emit_and_transform(
            BaseOp(OPTYPE::MSB, {a_id}),
            circuit, ctx, registry);

        // pow = 2^k via ROM (POW2 gate)
        std::size_t pow_id = emit_and_transform(
            BaseOp(OPTYPE::POW2, {k_id}),
            circuit, ctx, registry);

        // Unsigned quotient q_u = floor(a / pow)
        std::size_t q_id = emit_and_transform(
            BaseOp(OPTYPE::UDIV, {a_id, pow_id}),
            circuit, ctx, registry);

        // t input, constrained by t * pow = 2^32
        circuit.push_back(BaseOp(OPTYPE::INPUT));
        std::size_t t_id = circuit.size() - 1;

        // prod = pow * t
        circuit.push_back(BaseOp(OPTYPE::MUL, {pow_id, t_id}));
        std::size_t prod_id = circuit.size() - 1;

        // prod - 2^32 = 0  ⇒ prod = 2^32
        circuit.push_back(BaseOp(
            OPTYPE::LINEAR,
            {prod_id, ctx.wire_1},
            {1, f61::minor(1ULL << 32)}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // const_2_32 = 2^32 * 1
        circuit.push_back(BaseOp(
            OPTYPE::LINEAR,
            {ctx.wire_1},
            {f61(1ULL << 32)}));
        std::size_t c32_id = circuit.size() - 1;

        // delta = 2^32 - t
        circuit.push_back(BaseOp(
            OPTYPE::LINEAR,
            {c32_id, t_id},
            {1, f61::minor(1)}));
        std::size_t delta_id = circuit.size() - 1;

        // correction = s * delta
        circuit.push_back(BaseOp(OPTYPE::MUL, {sign_id, delta_id}));
        std::size_t corr_id = circuit.size() - 1;

        // result_enc = q_u + correction
        circuit.push_back(BaseOp(
            OPTYPE::LINEAR,
            {q_id, corr_id},
            {1, 1}));
        std::size_t result_id = circuit.size() - 1;

        // Range-check result_enc ∈ [0, 2^32) via two 16‑bit limbs
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t r_lo_id = circuit.size() - 1;
        ctx.set2id.push_back(r_lo_id);

        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t r_hi_id = circuit.size() - 1;
        ctx.set2id.push_back(r_hi_id);

        // recon = r_lo + r_hi * 2^16
        circuit.push_back(BaseOp(
            OPTYPE::LINEAR,
            {r_lo_id, r_hi_id},
            {1, f61(1ULL << 16)}));
        std::size_t recon_id = circuit.size() - 1;

        // result_enc - recon = 0
        circuit.push_back(BaseOp(
            OPTYPE::LINEAR,
            {result_id, recon_id},
            {1, f61::minor(1)}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        // Expose result_enc as the gate output at op_index
        circuit[op_index] = BaseOp(OPTYPE::LINEAR, {result_id}, {1});
    }

    void execute(std::size_t op_index,
                 const BaseOp& op,
                 std::vector<f61>& wire_val,
                 ExecuteContext& ctx,
                 GateRegistry& registry) override {
        assert(op.wires.size() == 2);
        uint64_t a = wire_val[op.wires[0]].val;
        uint64_t k = wire_val[op.wires[1]].val;

        // Inputs are 32-bit words; shift amount assumed in [0,31]
        assert(a < (1ULL << 32));
        assert(k < 32);

        uint64_t shift = k;

        // Cleartext arithmetic shift result
        int32_t a_signed = static_cast<int32_t>(a);
        int32_t res_signed = (shift == 0) ? a_signed : (a_signed >> shift);
        uint32_t res = static_cast<uint32_t>(res_signed);

        // Intermediate values for the gadget
        uint64_t sign = (a >> 31) & 1;
        uint64_t pow = (shift == 0) ? 1ULL : (1ULL << shift);
        uint64_t q_u = (pow == 0) ? 0 : (a / pow);
        uint64_t t = (shift == 0) ? (1ULL << 32) : (1ULL << (32 - shift));
        uint64_t delta = (1ULL << 32) - t;
        uint64_t corr = sign * delta;
        uint64_t result_enc = (q_u + corr) & ((1ULL << 32) - 1);

        // Top-level result wire
        wire_val[op_index] = f61(result_enc);

        // 1) MSB(a) gate
        std::size_t sign_id = alloc_and_execute(
            OPTYPE::MSB,
            BaseOp(OPTYPE::MSB, {op.wires[0]}),
            f61(sign),
            wire_val, ctx, registry);

        // 2) POW2(k) gate
        std::size_t pow_id = alloc_and_execute(
            OPTYPE::POW2,
            BaseOp(OPTYPE::POW2, {op.wires[1]}),
            f61(pow),
            wire_val, ctx, registry);

        // 3) UDIV(a, pow) gate
        std::size_t q_id = alloc_and_execute(
            OPTYPE::UDIV,
            BaseOp(OPTYPE::UDIV, {op.wires[0], pow_id}),
            f61(q_u),
            wire_val, ctx, registry);

        (void)sign_id;
        (void)q_id;

        // 4) t INPUT
        std::size_t t_id = ctx.num_wires++;
        wire_val[t_id] = f61(t);

        // 5) prod = pow * t
        std::size_t prod_id = ctx.num_wires++;
        wire_val[prod_id] = f61(pow * t);

        // 6) prod - 2^32 == 0  (checkzero wire)
        ctx.num_wires++;

        // 7) const 2^32
        std::size_t c32_id = ctx.num_wires++;
        wire_val[c32_id] = f61(1ULL << 32);

        // 8) delta = 2^32 - t
        std::size_t delta_id = ctx.num_wires++;
        wire_val[delta_id] = f61(delta);

        // 9) corr = sign * delta
        std::size_t corr_id = ctx.num_wires++;
        wire_val[corr_id] = f61(corr);

        // 10) result_enc = q_u + corr
        std::size_t result_id = ctx.num_wires++;
        wire_val[result_id] = f61(result_enc);

        // 11–12) r_lo, r_hi (16‑bit limbs)
        uint64_t r_lo = result_enc & 0xFFFFULL;
        uint64_t r_hi = (result_enc >> 16) & 0xFFFFULL;

        std::size_t r_lo_id = ctx.num_wires++;
        wire_val[r_lo_id] = f61(r_lo);

        std::size_t r_hi_id = ctx.num_wires++;
        wire_val[r_hi_id] = f61(r_hi);

        // 13) recon = r_lo + r_hi * 2^16
        ctx.num_wires++;

        // 14) result_enc - recon == 0 (checkzero wire)
        ctx.num_wires++;
    }
};


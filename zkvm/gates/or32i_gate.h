#pragma once
#include "../rom_offsets.h"
#include "and32i_gate.h"

/**
 * Optimized 32-bit OR immediate gate (OR32I)
 *
 * Mirrors the structure / wire ordering of And32IGate:
 *  - split_word_to_halfwords: ZKSET(h1), ZKSET(h0), checkzero
 *  - fast paths when imm high16 or low16 is 0000 / FFFF
 *  - halfword->bytes via HIGH8 + LINEAR remainder (addr, LOAD(byte1), byte0 LINEAR)
 *
 * Byte shortcuts for OR:
 *  - imm_byte == 0x00 => out = x_byte          (no op)
 *  - imm_byte == 0xFF => out = 0xFF            (LINEAR const)
 *  - else             => LOAD(OR_OFFSET + x*256 + imm)
 */
class Or32IGate : public And32IGate {
public:
    OPTYPE get_type() const override { return OPTYPE::OR32I; }
    std::string get_name() const override { return "Or32IGate"; }

    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& registry) override {
        assert(op.wires.size() == 1);
        std::size_t x_id = op.wires[0];

        std::uint32_t imm = static_cast<std::uint32_t>(op.imm) & 0xFFFFFFFFu;
        std::uint16_t imm_lo16 = static_cast<std::uint16_t>(imm & 0xFFFFu);
        std::uint16_t imm_hi16 = static_cast<std::uint16_t>((imm >> 16) & 0xFFFFu);
        std::uint8_t ib[4] = {
            static_cast<std::uint8_t>(imm & 0xFFu),
            static_cast<std::uint8_t>((imm >> 8) & 0xFFu),
            static_cast<std::uint8_t>((imm >> 16) & 0xFFu),
            static_cast<std::uint8_t>((imm >> 24) & 0xFFu),
        };

        const bool fast_halfword_path1 = (imm_hi16 == 0) || (imm_hi16 == 0xFFFFu);
        const bool fast_halfword_path2 = (imm_lo16 == 0) || (imm_lo16 == 0xFFFFu);

        auto [h0_wire, h1_wire] = split_word_to_halfwords(x_id, circuit, ctx);

        // Fast path: high16 is trivial => only need low bytes + (high passthrough/const)
        if (fast_halfword_path1) {
            auto [x_b0, x_b1] = decompose_halfword_to_bytes(h0_wire, circuit, ctx, registry);

            std::size_t out_b0 = or_byte_with_imm(x_b0, ib[0], circuit, ctx, registry);
            std::size_t out_b1 = or_byte_with_imm(x_b1, ib[1], circuit, ctx, registry);

            circuit.push_back(BaseOp(OPTYPE::LINEAR, {out_b0, out_b1}, {1, 1 << 8}));
            std::size_t low16_out_wire = circuit.size() - 1;

            if (imm_hi16 == 0) {
                // high passthrough
                circuit[op_index] = BaseOp(OPTYPE::LINEAR, {low16_out_wire, h1_wire}, {1, 1ULL << 16});
                return;
            } else {
                // high becomes 0xFFFF
                circuit[op_index] = BaseOp(OPTYPE::LINEAR,
                                           {low16_out_wire, ctx.wire_1},
                                           {1, static_cast<std::uint64_t>(0xFFFFu) << 16});
                return;
            }
        }

        // Fast path: low16 is trivial => only need high bytes + (low passthrough/const)
        if (fast_halfword_path2) {
            auto [x_b2, x_b3] = decompose_halfword_to_bytes(h1_wire, circuit, ctx, registry);

            std::size_t out_b2 = or_byte_with_imm(x_b2, ib[2], circuit, ctx, registry);
            std::size_t out_b3 = or_byte_with_imm(x_b3, ib[3], circuit, ctx, registry);

            if (imm_lo16 == 0) {
                // low passthrough
                circuit[op_index] = BaseOp(OPTYPE::LINEAR,
                                           {h0_wire, out_b2, out_b3},
                                           {1, 1 << 16, 1 << 24});
                return;
            } else {
                // low becomes 0xFFFF
                circuit[op_index] = BaseOp(OPTYPE::LINEAR,
                                           {ctx.wire_1, out_b2, out_b3},
                                           {0xFFFFu, 1 << 16, 1 << 24});
                return;
            }
        }

        // General path: reuse the same byte-decomposition as And32IGate (even though it double-decomposes)
        std::vector<std::size_t> x_chunks = create_byte_decomposition(x_id, circuit, ctx, registry);

        std::size_t out_b[4];
        for (int i = 0; i < 4; i++) {
            out_b[i] = or_byte_with_imm(x_chunks[i], ib[i], circuit, ctx, registry);
        }

        circuit[op_index] = BaseOp(OPTYPE::LINEAR,
            {out_b[0], out_b[1], out_b[2], out_b[3]},
            {1, 1 << 8, 1 << 16, 1 << 24});
    }

    void execute(std::size_t op_index, const BaseOp& op,
                 std::vector<f61>& wire_val, ExecuteContext& ctx,
                 GateRegistry& registry) override {
        assert(op.wires.size() == 1);

        uint64_t x32 = wire_val[op.wires[0]].val & 0xFFFFFFFFull;
        uint32_t imm = static_cast<uint32_t>(op.imm) & 0xFFFFFFFFu;

        uint64_t result = (x32 | static_cast<uint64_t>(imm)) & 0xFFFFFFFFull;

        std::uint16_t imm_lo16 = static_cast<std::uint16_t>(imm & 0xFFFFu);
        std::uint16_t imm_hi16 = static_cast<std::uint16_t>((imm >> 16) & 0xFFFFu);
        std::uint8_t ib[4] = {
            static_cast<std::uint8_t>(imm & 0xFFu),
            static_cast<std::uint8_t>((imm >> 8) & 0xFFu),
            static_cast<std::uint8_t>((imm >> 16) & 0xFFu),
            static_cast<std::uint8_t>((imm >> 24) & 0xFFu),
        };

        const bool fast_halfword_path1 = (imm_hi16 == 0) || (imm_hi16 == 0xFFFFu);
        const bool fast_halfword_path2 = (imm_lo16 == 0) || (imm_lo16 == 0xFFFFu);

        uint16_t h0 = static_cast<uint16_t>(x32 & 0xFFFFull);
        uint16_t h1 = static_cast<uint16_t>((x32 >> 16) & 0xFFFFull);

        // split_word_to_halfwords: ZKSET(h1), ZKSET(h0), checkzero
        wire_val[ctx.num_wires++] = f61(h1);
        wire_val[ctx.num_wires++] = f61(h0);
        wire_val[ctx.num_wires++] = f61(0);

        if (fast_halfword_path1) {
            uint8_t x_b0, x_b1;
            emit_halfword_to_bytes_execute(h0, x_b0, x_b1, wire_val, ctx, registry);

            emit_or_byte_execute(x_b0, ib[0], static_cast<uint8_t>(result & 0xFFu), wire_val, ctx, registry);
            emit_or_byte_execute(x_b1, ib[1], static_cast<uint8_t>((result >> 8) & 0xFFu), wire_val, ctx, registry);

            // low16_out wire always emitted in this branch
            wire_val[ctx.num_wires++] = f61(static_cast<uint16_t>(result & 0xFFFFu));

            wire_val[op_index] = f61(result);
            return;
        }

        if (fast_halfword_path2) {
            uint8_t x_b2, x_b3;
            emit_halfword_to_bytes_execute(h1, x_b2, x_b3, wire_val, ctx, registry);

            emit_or_byte_execute(x_b2, ib[2], static_cast<uint8_t>((result >> 16) & 0xFFu), wire_val, ctx, registry);
            emit_or_byte_execute(x_b3, ib[3], static_cast<uint8_t>((result >> 24) & 0xFFu), wire_val, ctx, registry);

            // No extra wires beyond what transform emits (constants are embedded in final LINEAR)
            wire_val[op_index] = f61(result);
            return;
        }

        // General path: create_byte_decomposition(x_id, ...) was emitted after the split (same as And32IGate)
        uint64_t xbytes[4] = { x32 & 0xFF, (x32 >> 8) & 0xFF, (x32 >> 16) & 0xFF, (x32 >> 24) & 0xFF };
        set_byte_decomposition_witnesses(x32, xbytes, wire_val, ctx, registry);

        for (int i = 0; i < 4; i++) {
            emit_or_byte_execute(static_cast<uint8_t>(xbytes[i]), ib[i],
                                 static_cast<uint8_t>((result >> (i * 8)) & 0xFFu),
                                 wire_val, ctx, registry);
        }

        wire_val[op_index] = f61(result);
    }

protected:
    // OR per-byte with immediate using shortcut for 0x00 and 0xFF
    std::size_t or_byte_with_imm(std::size_t x_byte_wire,
                                 std::uint8_t imm_byte,
                                 std::vector<BaseOp>& circuit,
                                 GateContext& ctx,
                                 GateRegistry& registry) {
        if (imm_byte == 0x00) return x_byte_wire;

        if (imm_byte == 0xFF) {
            circuit.push_back(BaseOp(OPTYPE::LINEAR, {ctx.wire_1}, {0xFF}));
            return circuit.size() - 1;
        }

        // idx = OR_OFFSET + x*256 + imm
        circuit.push_back(BaseOp(OPTYPE::LINEAR,
            {x_byte_wire, ctx.wire_1},
            {1 << 8, static_cast<std::uint64_t>(RomOffsets::OR_OFFSET + imm_byte)}));
        std::size_t idx_wire = circuit.size() - 1;

        return emit_and_transform(BaseOp(OPTYPE::LOAD, {idx_wire}), circuit, ctx, registry);
    }

    void emit_or_byte_execute(uint8_t x_byte,
                              uint8_t imm_byte,
                              uint8_t out_byte,
                              std::vector<f61>& wire_val,
                              ExecuteContext& ctx,
                              GateRegistry& registry) {
        if (imm_byte == 0x00) return; // passthrough

        if (imm_byte == 0xFF) {
            wire_val[ctx.num_wires++] = f61(0xFF);
            return;
        }

        uint64_t idx = static_cast<uint64_t>(RomOffsets::OR_OFFSET)
                     + static_cast<uint64_t>(x_byte) * 256ull
                     + static_cast<uint64_t>(imm_byte);
        wire_val[ctx.num_wires++] = f61(idx);

        alloc_and_execute(OPTYPE::LOAD,
                          BaseOp(OPTYPE::LOAD, {ctx.num_wires - 1}),
                          f61(out_byte),
                          wire_val, ctx, registry);
    }
};

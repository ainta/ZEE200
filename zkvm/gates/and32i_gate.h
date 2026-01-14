#pragma once
#include "../rom_offsets.h"
#include "and32_gate.h"

/**
 * Optimized 32-bit AND immediate gate (AND32I)
 *
 * Key optimizations:
 * 1) Immediate is known; no need to decompose it.
 * 2) Per-byte short-circuit:
 *    - imm_byte == 0x00 => out_byte = 0 (no LOAD)
 *    - imm_byte == 0xFF => out_byte = x_byte (no LOAD)
 *    - else => one AND ROM lookup (LOAD)
 * 3) If high16 or low16 is 0000 or FFFF, then we can skip the byte decomposition and use the fast path.
 */
class And32IGate : public And32Gate {
public:
    OPTYPE get_type() const override { return OPTYPE::AND32I; }
    std::string get_name() const override { return "And32IGate"; }

    void transform(std::size_t op_index, BaseOp op,
                   std::vector<BaseOp>& circuit, GateContext& ctx,
                   GateRegistry& registry) override {
        assert(op.wires.size() == 1);
        std::size_t x_id = op.wires[0];

        std::uint32_t imm = static_cast<std::uint32_t>(op.imm) & 0xFFFFFFFFu;
        std::uint8_t ib[4] = {
            static_cast<std::uint8_t>(imm & 0xFFu),
            static_cast<std::uint8_t>((imm >> 8) & 0xFFu),
            static_cast<std::uint8_t>((imm >> 16) & 0xFFu),
            static_cast<std::uint8_t>((imm >> 24) & 0xFFu),
        };

        const bool fast_halfword_path1 =
            (imm >> 16) == 0 || (imm >> 16) == 0xFFFF;
        const bool fast_halfword_path2 =
            (imm & 0xFFFF) == 0 || (imm & 0xFFFF) == 0xFFFF;

        // Step 1: split x into 16-bit halves using ZKSET:
        // x = h0 + h1*2^16, with h0,h1 in [0,65535]
        auto [h0_wire, h1_wire] = split_word_to_halfwords(x_id, circuit, ctx);
        
        if(fast_halfword_path1){
            auto [x_b0, x_b1] = decompose_halfword_to_bytes(h0_wire, circuit, ctx, registry);

            // Compute output low bytes with per-byte short-circuit
            std::size_t out_b0 = and_byte_with_imm(x_b0, ib[0], circuit, ctx, registry);
            std::size_t out_b1 = and_byte_with_imm(x_b1, ib[1], circuit, ctx, registry);
    
            // low16_out = out_b0 + out_b1*256
            circuit.push_back(BaseOp(OPTYPE::LINEAR, {out_b0, out_b1}, {1, 1 << 8}));
            std::size_t low16_out_wire = circuit.size() - 1;
            if ((imm >> 16) == 0) {
                circuit[op_index] = BaseOp(OPTYPE::LINEAR, {low16_out_wire}, {1});
                return;
            }

            // Else imm >> 16 == 0xFFFF: upper 16 bits are masked with 0xFFFF => passthrough
            // result = low16_out + h1*2^16
            circuit[op_index] = BaseOp(OPTYPE::LINEAR, {low16_out_wire, h1_wire}, {1, 1ULL << 16});
            return;    
        }
        else if(fast_halfword_path2){
            auto [x_b2, x_b3] = decompose_halfword_to_bytes(h1_wire, circuit, ctx, registry);

            // Compute output high bytes with per-byte short-circuit
            std::size_t out_b2 = and_byte_with_imm(x_b2, ib[2], circuit, ctx, registry);
            std::size_t out_b3 = and_byte_with_imm(x_b3, ib[3], circuit, ctx, registry);

            if((imm & 0xFFFF) == 0) {
                // result = (out_b2 + out_b3*256) << 16
                circuit[op_index] = BaseOp(OPTYPE::LINEAR, {out_b2, out_b3}, {1 << 16, 1 << 24});
                return;
            }
            // else imm & 0xFFFF == 0xFFFF: lower 16 bits are masked to 0xFF => passthrough
            // result = out_b3
            circuit[op_index] = BaseOp(OPTYPE::LINEAR, {out_b2, out_b3, h0_wire}, {1 << 16, 1 << 24, 1});
            return;
        }


        // Split x into 4 uint8 chunks: [byte0, byte1, byte2, byte3]
        std::vector<std::size_t> x_chunks = create_byte_decomposition(x_id, circuit, ctx, registry);

        // Perform ROM lookups for each byte using recursive LOAD calls
        std::size_t out_b[4];
        for (int i = 0; i < 4; i++) {
            out_b[i] = and_byte_with_imm(x_chunks[i], ib[i], circuit, ctx, registry);
        }

        // Combine results
        circuit[op_index] = BaseOp(OPTYPE::LINEAR,
            {out_b[0], out_b[1], out_b[2], out_b[3]},
            {1, 1<<8, 1<<16, 1<<24});
    }

    void execute(std::size_t op_index, const BaseOp& op,
        std::vector<f61>& wire_val, ExecuteContext& ctx,
        GateRegistry& registry) override {

        uint64_t x32 = wire_val[op.wires[0]].val & 0xFFFFFFFFull;
        uint32_t imm = static_cast<uint32_t>(op.imm) & 0xFFFFFFFFu;

        uint64_t result = (x32 & static_cast<uint64_t>(imm)) & 0xFFFFFFFFull;

        std::uint8_t ib[4] = {
            static_cast<std::uint8_t>(imm & 0xFFu),
            static_cast<std::uint8_t>((imm >> 8) & 0xFFu),
            static_cast<std::uint8_t>((imm >> 16) & 0xFFu),
            static_cast<std::uint8_t>((imm >> 24) & 0xFFu),
        };

        const bool fast_halfword_path1 = ((imm >> 16) == 0) || ((imm >> 16) == 0xFFFFu);
        const bool fast_halfword_path2 = ((imm & 0xFFFFu) == 0) || ((imm & 0xFFFFu) == 0xFFFFu);

        uint16_t h0 = static_cast<uint16_t>(x32 & 0xFFFFull);
        uint16_t h1 = static_cast<uint16_t>((x32 >> 16) & 0xFFFFull);

        // split_word_to_halfwords: ZKSET(h1), ZKSET(h0), checkzero
        wire_val[ctx.num_wires++] = f61(h1);
        wire_val[ctx.num_wires++] = f61(h0);
        wire_val[ctx.num_wires++] = f61(0); // checkzero

        if (fast_halfword_path1) {
            // decompose_halfword_to_bytes(h0) (new layout)
            uint8_t x_b0, x_b1;
            emit_halfword_to_bytes_execute(h0, x_b0, x_b1, wire_val, ctx, registry);

            // AND low bytes with imm bytes (short-circuit mirrored)
            emit_and_byte_execute(x_b0, ib[0], result & 0xFFu, wire_val, ctx, registry);
            emit_and_byte_execute(x_b1, ib[1], (result >> 8) & 0xFFu, wire_val, ctx, registry);

            // low16_out LINEAR wire (always emitted in this branch)
            wire_val[ctx.num_wires++] = f61(static_cast<uint16_t>(result & 0xFFFFu));

            wire_val[op_index] = f61(result);
            return;
        }

        if (fast_halfword_path2) {
            // decompose_halfword_to_bytes(h1) (new layout)
            uint8_t x_b2, x_b3;
            emit_halfword_to_bytes_execute(h1, x_b2, x_b3, wire_val, ctx, registry);

            // AND high bytes with imm bytes (short-circuit mirrored)
            emit_and_byte_execute(x_b2, ib[2], (result >> 16) & 0xFFu, wire_val, ctx, registry);
            emit_and_byte_execute(x_b3, ib[3], (result >> 24) & 0xFFu, wire_val, ctx, registry);

            wire_val[op_index] = f61(result);
            return;
        }

        // General path unchanged: transform emits create_byte_decomposition(x_id, ...) AFTER the split.
        // create_byte_decomposition is still the And32Gate version, so keep using its witness setter.
        uint64_t xbytes[4] = { x32 & 0xFF, (x32 >> 8) & 0xFF, (x32 >> 16) & 0xFF, (x32 >> 24) & 0xFF };
        set_byte_decomposition_witnesses(x32, xbytes, wire_val, ctx, registry);

        for(int i = 0; i < 4; i++) {
            emit_and_byte_execute(xbytes[i], ib[i], (result >> (i * 8)) & 0xFFu, wire_val, ctx, registry);
        }

        wire_val[op_index] = f61(result);
    }


protected:
    // word = h0 + h1*2^16, both halves are ZKSET, then checkzero
    std::pair<std::size_t, std::size_t>
    split_word_to_halfwords(std::size_t word_wire,
                            std::vector<BaseOp>& circuit,
                            GateContext& ctx) {
        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t h1_wire = circuit.size() - 1;
        ctx.set2id.push_back(h1_wire);

        circuit.push_back(BaseOp(OPTYPE::ZKSET));
        std::size_t h0_wire = circuit.size() - 1;
        ctx.set2id.push_back(h0_wire);

        circuit.push_back(BaseOp(OPTYPE::LINEAR,
            {word_wire, h1_wire, h0_wire},
            {1, f61::minor(1ULL << 16), f61::minor(1)}));
        ctx.checkzero_wires.push_back(circuit.size() - 1);

        return {h0_wire, h1_wire};
    }

    // half = byte0 + byte1*256
    // byte1 is obtained via HIGH8 ROM: byte1 = half >> 8
    // byte0 is INPUT, checked by checkzero.
    std::pair<std::size_t, std::size_t>
    decompose_halfword_to_bytes(std::size_t half_wire,
                               std::vector<BaseOp>& circuit,
                               GateContext& ctx,
                               GateRegistry& registry) {
        // addr = HIGH8_OFFSET + half
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {half_wire, ctx.wire_1},
                                 {1, RomOffsets::HIGH8_OFFSET}));
        std::size_t addr_wire = circuit.size() - 1;

        // LOAD(addr) -> byte1
        std::size_t byte1_wire = emit_and_transform(
            BaseOp(OPTYPE::LOAD, {addr_wire}),
            circuit, ctx, registry);

        // byte0 = half - byte1*256
        circuit.push_back(BaseOp(OPTYPE::LINEAR, {half_wire, byte1_wire}, {1, f61::minor(256)}));
        std::size_t byte0_wire = circuit.size() - 1;

        return {byte0_wire, byte1_wire};
    }

    // Emit AND with immediate byte using short-circuit.
    // Returns a wire producing out_byte.
    std::size_t and_byte_with_imm(std::size_t x_byte_wire,
                                 std::uint8_t imm_byte,
                                 std::vector<BaseOp>& circuit,
                                 GateContext& ctx,
                                 GateRegistry& registry) {
        if (imm_byte == 0x00) {
            circuit.push_back(BaseOp(OPTYPE::LINEAR, {ctx.wire_1}, {0}));
            return circuit.size() - 1;
        }
        if (imm_byte == 0xFF) {
            return x_byte_wire;
        }

        // idx = AND_OFFSET + x_byte*256 + imm_byte
        circuit.push_back(BaseOp(OPTYPE::LINEAR,
            {x_byte_wire, ctx.wire_1},
            {1 << 8, static_cast<std::uint64_t>(RomOffsets::AND_OFFSET + imm_byte)}));
        std::size_t idx_wire = circuit.size() - 1;

        return emit_and_transform(BaseOp(OPTYPE::LOAD, {idx_wire}), circuit, ctx, registry);
    }

    // Helper: execute-side mirror of decompose_halfword_to_bytes() as you rewrote it.
    // Emits wires in exactly this order:
    //  1) addr_wire (LINEAR)
    //  2) LOAD(addr) for byte1
    //  3) byte0_wire (LINEAR = half - 256*byte1)
    void emit_halfword_to_bytes_execute(uint16_t half,
        uint8_t& out_b0,
        uint8_t& out_b1,
        std::vector<f61>& wire_val,
        ExecuteContext& ctx,
        GateRegistry& registry) {
        out_b0 = static_cast<uint8_t>(half & 0xFFu);
        out_b1 = static_cast<uint8_t>((half >> 8) & 0xFFu);

        // (1) addr_wire
        wire_val[ctx.num_wires++] = f61(static_cast<uint64_t>(RomOffsets::HIGH8_OFFSET) + half);

        // (2) LOAD -> byte1
        alloc_and_execute(
        OPTYPE::LOAD,
        BaseOp(OPTYPE::LOAD, {ctx.num_wires - 1}),
        f61(out_b1),
        wire_val, ctx, registry);

        // (3) byte0_wire = half - 256*byte1  (LINEAR output wire)
        wire_val[ctx.num_wires++] = f61(out_b0);
    }

    // Execute-side mirror of and_byte_with_imm: allocate exactly what transform emits.
    void emit_and_byte_execute(uint8_t x_byte,
                              uint8_t imm_byte,
                              uint8_t out_byte,
                              std::vector<f61>& wire_val,
                              ExecuteContext& ctx,
                              GateRegistry& registry) {
        if (imm_byte == 0x00) {
            // LINEAR({1},{0})
            wire_val[ctx.num_wires++] = f61(0);
            return;
        }
        if (imm_byte == 0xFF) {
            // reused x_byte wire, no allocation
            return;
        }

        // idx LINEAR
        uint64_t idx = static_cast<uint64_t>(RomOffsets::AND_OFFSET) + (static_cast<uint64_t>(x_byte) * 256ull) + imm_byte;
        wire_val[ctx.num_wires++] = f61(idx);

        // LOAD(idx) -> out_byte
        alloc_and_execute(OPTYPE::LOAD,
                          BaseOp(OPTYPE::LOAD, {ctx.num_wires - 1}),
                          f61(out_byte),
                          wire_val, ctx, registry);
    }
};
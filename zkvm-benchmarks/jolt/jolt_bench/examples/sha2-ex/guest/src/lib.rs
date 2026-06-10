#![cfg_attr(feature = "guest", no_std)]

// Same message as benchmarks/sha256/sha256.c in tight-zkvm.
const MSG: &[u8] = b"abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq";

// Expected SHA256 digest of MSG (32 bytes), matching the C benchmark.
const EXPECTED_HASH: [u8; 32] = [
    0x24, 0x8d, 0x6a, 0x61, 0xd2, 0x06, 0x38, 0xb8, 0xe5, 0xc0, 0x26, 0x93, 0x0c, 0x3e, 0x60,
    0x39, 0xa3, 0x3c, 0xe4, 0x59, 0x64, 0xff, 0x21, 0x67, 0xf6, 0xec, 0xed, 0xd4, 0x19, 0xdb,
    0x06, 0xc1,
];

const SHA256_DIGEST_SIZE: usize = 32;
const SHA256_BLOCK_SIZE: usize = 64;
const SHA256_DATA_LENGTH: usize = 16;

#[allow(non_camel_case_types)]
type u32x = u32;

struct Sha256Ctx {
    state: [u32x; 8],
    count: u64,
    block: [u8; SHA256_BLOCK_SIZE],
    index: usize,
}

#[inline]
fn rotl32(n: u32x, x: u32x) -> u32x {
    x.rotate_left(n)
}

#[inline]
fn choice(x: u32x, y: u32x, z: u32x) -> u32x {
    z ^ (x & (y ^ z))
}

#[inline]
fn majority(x: u32x, y: u32x, z: u32x) -> u32x {
    (x & y) ^ (z & (x ^ y))
}

#[inline]
fn big_s0(x: u32x) -> u32x {
    rotl32(30, x) ^ rotl32(19, x) ^ rotl32(10, x)
}

#[inline]
fn big_s1(x: u32x) -> u32x {
    rotl32(26, x) ^ rotl32(21, x) ^ rotl32(7, x)
}

#[inline]
fn small_s0(x: u32x) -> u32x {
    rotl32(25, x) ^ rotl32(14, x) ^ (x >> 3)
}

#[inline]
fn small_s1(x: u32x) -> u32x {
    rotl32(15, x) ^ rotl32(13, x) ^ (x >> 10)
}

#[inline]
fn expand(w: &mut [u32x; SHA256_DATA_LENGTH], i: usize) -> u32x {
    let idx = i & 15;
    let t = small_s1(w[(i.wrapping_sub(2)) & 15])
        .wrapping_add(w[(i.wrapping_sub(7)) & 15])
        .wrapping_add(small_s0(w[(i.wrapping_sub(15)) & 15]));
    w[idx] = w[idx].wrapping_add(t);
    w[idx]
}

#[inline]
fn round(
    a: &mut u32x,
    b: &mut u32x,
    c: &mut u32x,
    d: &mut u32x,
    e: &mut u32x,
    f: &mut u32x,
    g: &mut u32x,
    h: &mut u32x,
    k: u32x,
    data: u32x,
) {
    *h = h
        .wrapping_add(big_s1(*e))
        .wrapping_add(choice(*e, *f, *g))
        .wrapping_add(k)
        .wrapping_add(data);
    *d = d.wrapping_add(*h);
    *h = h
        .wrapping_add(big_s0(*a))
        .wrapping_add(majority(*a, *b, *c));
}

const K: [u32x; 64] = [
    0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4,
    0xab1c5ed5, 0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe,
    0x9bdc06a7, 0xc19bf174, 0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f,
    0x4a7484aa, 0x5cb0a9dc, 0x76f988da, 0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7,
    0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967, 0x27b70a85, 0x2e1b2138, 0x4d2c6dfc,
    0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85, 0xa2bfe8a1, 0xa81a664b,
    0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070, 0x19a4c116,
    0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
    0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7,
    0xc67178f2,
];

fn nettle_sha256_compress(state: &mut [u32x; 8], input: &[u8; SHA256_BLOCK_SIZE]) {
    let mut data: [u32x; SHA256_DATA_LENGTH] = [0; SHA256_DATA_LENGTH];
    // READ_UINT32
    for (i, chunk) in input.chunks_exact(4).take(SHA256_DATA_LENGTH).enumerate() {
        data[i] = ((chunk[0] as u32x) << 24)
            | ((chunk[1] as u32x) << 16)
            | ((chunk[2] as u32x) << 8)
            | (chunk[3] as u32x);
    }

    let mut a = state[0];
    let mut b = state[1];
    let mut c = state[2];
    let mut d = state[3];
    let mut e = state[4];
    let mut f = state[5];
    let mut g = state[6];
    let mut h = state[7];

    let mut i: usize = 0;

    // First 16 rounds
    while i < 16 {
        for j in 0..8 {
            let k_val = K[i + j];
            let d_val = data[i + j];
            match j {
                0 => round(
                    &mut a, &mut b, &mut c, &mut d, &mut e, &mut f, &mut g, &mut h, k_val, d_val,
                ),
                1 => round(
                    &mut h, &mut a, &mut b, &mut c, &mut d, &mut e, &mut f, &mut g, k_val, d_val,
                ),
                2 => round(
                    &mut g, &mut h, &mut a, &mut b, &mut c, &mut d, &mut e, &mut f, k_val, d_val,
                ),
                3 => round(
                    &mut f, &mut g, &mut h, &mut a, &mut b, &mut c, &mut d, &mut e, k_val, d_val,
                ),
                4 => round(
                    &mut e, &mut f, &mut g, &mut h, &mut a, &mut b, &mut c, &mut d, k_val, d_val,
                ),
                5 => round(
                    &mut d, &mut e, &mut f, &mut g, &mut h, &mut a, &mut b, &mut c, k_val, d_val,
                ),
                6 => round(
                    &mut c, &mut d, &mut e, &mut f, &mut g, &mut h, &mut a, &mut b, k_val, d_val,
                ),
                7 => round(
                    &mut b, &mut c, &mut d, &mut e, &mut f, &mut g, &mut h, &mut a, k_val, d_val,
                ),
                _ => {}
            }
        }
        i += 8;
    }

    // Remaining rounds with message schedule expansion
    while i < 64 {
        for j in 0..16 {
            let idx = i + j;
            if idx >= 64 {
                break;
            }
            let w = expand(&mut data, idx);
            let k_val = K[idx];
            match j % 8 {
                0 => round(
                    &mut a, &mut b, &mut c, &mut d, &mut e, &mut f, &mut g, &mut h, k_val, w,
                ),
                1 => round(
                    &mut h, &mut a, &mut b, &mut c, &mut d, &mut e, &mut f, &mut g, k_val, w,
                ),
                2 => round(
                    &mut g, &mut h, &mut a, &mut b, &mut c, &mut d, &mut e, &mut f, k_val, w,
                ),
                3 => round(
                    &mut f, &mut g, &mut h, &mut a, &mut b, &mut c, &mut d, &mut e, k_val, w,
                ),
                4 => round(
                    &mut e, &mut f, &mut g, &mut h, &mut a, &mut b, &mut c, &mut d, k_val, w,
                ),
                5 => round(
                    &mut d, &mut e, &mut f, &mut g, &mut h, &mut a, &mut b, &mut c, k_val, w,
                ),
                6 => round(
                    &mut c, &mut d, &mut e, &mut f, &mut g, &mut h, &mut a, &mut b, k_val, w,
                ),
                7 => round(
                    &mut b, &mut c, &mut d, &mut e, &mut f, &mut g, &mut h, &mut a, k_val, w,
                ),
                _ => {}
            }
        }
        i += 16;
    }

    state[0] = state[0].wrapping_add(a);
    state[1] = state[1].wrapping_add(b);
    state[2] = state[2].wrapping_add(c);
    state[3] = state[3].wrapping_add(d);
    state[4] = state[4].wrapping_add(e);
    state[5] = state[5].wrapping_add(f);
    state[6] = state[6].wrapping_add(g);
    state[7] = state[7].wrapping_add(h);
}

fn sha256_init(ctx: &mut Sha256Ctx) {
    ctx.state = [
        0x6a09e667,
        0xbb67ae85,
        0x3c6ef372,
        0xa54ff53a,
        0x510e527f,
        0x9b05688c,
        0x1f83d9ab,
        0x5be0cd19,
    ];
    ctx.count = 0;
    ctx.index = 0;
    ctx.block = [0u8; SHA256_BLOCK_SIZE];
}

fn md_update(ctx: &mut Sha256Ctx, mut data: &[u8]) {
    if ctx.index != 0 {
        let md_left = SHA256_BLOCK_SIZE - ctx.index;
        if data.len() < md_left {
            ctx.block[ctx.index..ctx.index + data.len()].copy_from_slice(data);
            ctx.index += data.len();
            return;
        } else {
            ctx.block[ctx.index..].copy_from_slice(&data[..md_left]);
            nettle_sha256_compress(&mut ctx.state, &ctx.block);
            ctx.count = ctx.count.wrapping_add(1);
            data = &data[md_left..];
        }
    }

    while data.len() >= SHA256_BLOCK_SIZE {
        let (block_bytes, rest) = data.split_at(SHA256_BLOCK_SIZE);
        let mut block = [0u8; SHA256_BLOCK_SIZE];
        block.copy_from_slice(block_bytes);
        nettle_sha256_compress(&mut ctx.state, &block);
        ctx.count = ctx.count.wrapping_add(1);
        data = rest;
    }

    ctx.block[..data.len()].copy_from_slice(data);
    ctx.index = data.len();
}

fn md_pad(ctx: &mut Sha256Ctx, size: usize) {
    let mut md_i = ctx.index;
    assert!(md_i < SHA256_BLOCK_SIZE);
    ctx.block[md_i] = 0x80;
    md_i += 1;
    if md_i > (SHA256_BLOCK_SIZE - size) {
        for i in md_i..SHA256_BLOCK_SIZE {
            ctx.block[i] = 0;
        }
        nettle_sha256_compress(&mut ctx.state, &ctx.block);
        md_i = 0;
    }
    for i in md_i..(SHA256_BLOCK_SIZE - size) {
        ctx.block[i] = 0;
    }
    // Note: ctx.index is intentionally left unchanged, mirroring the C macro.
}

fn write_uint64_be(p: &mut [u8], i: u64) {
    p[0] = ((i >> 56) & 0xff) as u8;
    p[1] = ((i >> 48) & 0xff) as u8;
    p[2] = ((i >> 40) & 0xff) as u8;
    p[3] = ((i >> 32) & 0xff) as u8;
    p[4] = ((i >> 24) & 0xff) as u8;
    p[5] = ((i >> 16) & 0xff) as u8;
    p[6] = ((i >> 8) & 0xff) as u8;
    p[7] = (i & 0xff) as u8;
}

fn nettle_write_be32(length: usize, dst: &mut [u8], src: &[u32x; 8]) {
    let words = length / 4;
    let leftover = length % 4;
    let mut offset = 0;
    for i in 0..words {
        let v = src[i];
        dst[offset] = ((v >> 24) & 0xff) as u8;
        dst[offset + 1] = ((v >> 16) & 0xff) as u8;
        dst[offset + 2] = ((v >> 8) & 0xff) as u8;
        dst[offset + 3] = (v & 0xff) as u8;
        offset += 4;
    }
    if leftover != 0 {
        let word = src[words];
        let mut j = leftover;
        match leftover {
            3 => {
                j -= 1;
                dst[offset + j] = ((word >> 8) & 0xff) as u8;
                j -= 1;
                dst[offset + j] = ((word >> 16) & 0xff) as u8;
                j -= 1;
                dst[offset + j] = ((word >> 24) & 0xff) as u8;
            }
            2 => {
                j -= 1;
                dst[offset + j] = ((word >> 16) & 0xff) as u8;
                j -= 1;
                dst[offset + j] = ((word >> 24) & 0xff) as u8;
            }
            1 => {
                dst[offset] = ((word >> 24) & 0xff) as u8;
            }
            _ => {}
        }
    }
}

fn sha256_write_digest(ctx: &mut Sha256Ctx, length: usize, digest: &mut [u8]) {
    assert!(length <= SHA256_DIGEST_SIZE);
    md_pad(ctx, 8);
    let bit_count = (ctx.count << 9) | ((ctx.index as u64) << 3);
    let start = SHA256_BLOCK_SIZE - 8;
    write_uint64_be(&mut ctx.block[start..], bit_count);
    nettle_sha256_compress(&mut ctx.state, &ctx.block);
    nettle_write_be32(length, digest, &ctx.state);
}

fn sha256_digest(ctx: &mut Sha256Ctx, length: usize, digest: &mut [u8]) {
    sha256_write_digest(ctx, length, digest);
    sha256_init(ctx);
}

#[jolt::provable(memory_size = 1048576, max_trace_length = 8388608)]
fn sha256_bench(iterations: u32) -> u32 {
    let mut buffer = [0u8; SHA256_DIGEST_SIZE];

    for _ in 0..iterations {
        for b in buffer.iter_mut() {
            *b = 0;
        }
        let mut ctx = Sha256Ctx {
            state: [0; 8],
            count: 0,
            block: [0; SHA256_BLOCK_SIZE],
            index: 0,
        };
        sha256_init(&mut ctx);
        md_update(&mut ctx, MSG);
        sha256_digest(&mut ctx, SHA256_DIGEST_SIZE, &mut buffer);
    }

    let mut ok: u32 = 1;
    for i in 0..8 {
        if EXPECTED_HASH[i] != buffer[i] {
            ok = 0;
            break;
        }
    }

    ok
}

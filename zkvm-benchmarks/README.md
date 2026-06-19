# SP1 and Jolt zkVM Benchmark Reproduction

This folder contains the source, version pins, scripts, and expected results
for the SP1 and Jolt benchmark runs used in the ZEE200 comparison.

The package excludes multi-GB build directories, raw terminal logs, and
generated proving artifacts. Running the scripts writes local logs under
`sp1/logs/` and `jolt/logs/`.

## Contents

- `sp1/sp1_bench/`: SP1 benchmark workspace for fibonacci, mergesort, and
  SHA-256.
- `sp1/scripts/`: SP1 build and run helpers.
- `jolt/jolt_bench/`: Jolt benchmark guest/host source files.
- `jolt/patches/jolt-v0.3.0-alpha-integration.patch`: Jolt integration patch.
- `jolt/scripts/`: Jolt checkout and run helpers.
- `expected-results.tsv`: paper runtimes and deterministic instruction/cycle
  counts.

## Version Pins

SP1:

- Source: `sp1/sp1_bench/`
- `sp1-sdk` / `sp1-zkvm`: `succinctlabs/sp1` tag `v5.2.4`
- Locked commit from `Cargo.lock`:
  `2a51f3dd370e4c5f74d04dfd89359a13a7e93f99`

Jolt:

- Upstream: `https://github.com/a16z/jolt`
- Tag: `v0.3.0-alpha`
- Commit: `5101ad2143039de6f279613810414c3d071d1f8f`
- Benchmark source: `jolt/jolt_bench/`
- Integration patch: `jolt/patches/jolt-v0.3.0-alpha-integration.patch`

The Jolt integration patch adds the mergesort workspace members and sets guest
Rust compilation to `-C opt-level=3`.

## Expected Results

The expected results are listed in:

```bash
cd zkvm-benchmarks
cat expected-results.tsv
```

The paper runtimes are the Table 3 prover computation times in seconds. Timing
is machine-dependent; the deterministic instruction/cycle counts and public
outputs are included to identify matching benchmark programs and inputs.

## Reproduce SP1 Benchmarks

Prerequisites:

- Rust and `rustup`.
- `protobuf-compiler` (`protoc`) and common Rust build dependencies.
- Rust toolchains installed by SP1, including the `succinct` toolchain.
- Docker access for the Groth16 wrapping step. Check that `docker info`
  succeeds before running `run-groth16.sh`.

On Ubuntu:

```bash
sudo apt-get update
sudo apt-get install -y curl ca-certificates git build-essential pkg-config \
  libssl-dev protobuf-compiler
```

If SP1 is already installed, remove the stale SP1 state before installing the
pinned version:

```bash
rm -rf "$HOME/.sp1"
rustup toolchain remove succinct || true
```

Install and check SP1 `v5.2.4`:

```bash
curl -L https://sp1up.succinct.xyz | bash
export PATH="$HOME/.sp1/bin:$PATH"
sp1up -v 5.2.4
cargo +succinct --version
cargo prove --version
docker info
```

Run every SP1 benchmark case:

```bash
cd zkvm-benchmarks/sp1
unset CARGO_TARGET_DIR
./scripts/build-guests.sh
./scripts/run-stark.sh
./scripts/run-groth16.sh
```

This builds the guest ELFs and runs both proof modes for:

| benchmark | inputs |
| --- | --- |
| fibonacci | `n = 20`, `n = 23` |
| mergesort | `n = 500`, `n = 5000` |
| sha256 | `iterations = 10`, `iterations = 200` |

The generated logs are written to `sp1/logs/`. `run-stark.sh` runs the
core/STARK proof path reported in the SP1 STARK row; this mode does not
provide zero knowledge. `run-groth16.sh` runs the Groth16-wrapped proof path
reported in the SP1 Groth16 row and uses Docker. `build-guests.sh` scopes the
SP1 guest ELF `RUSTFLAGS` to guest compilation only; do not export those flags
before running the host proof scripts. SP1 v5.2.4 also expects Cargo's target
directory path to contain a component named `target`, so unset custom
`CARGO_TARGET_DIR` values before running `run-stark.sh` or `run-groth16.sh`.

## Reproduce Jolt Benchmarks

Prerequisites:

- Rust and `rustup`.
- Rust toolchain from Jolt's `rust-toolchain.toml`.
- `riscv64-unknown-elf-gcc` available on `PATH`.
- Enough memory for Jolt's prover setup and Dory SRS.

On Ubuntu:

```bash
sudo apt-get update
sudo apt-get install -y curl ca-certificates git clang build-essential \
  pkg-config libssl-dev gcc-riscv64-unknown-elf
```

Prepare a patched Jolt checkout:

```bash
cd zkvm-benchmarks/jolt
./scripts/prepare-jolt.sh
```

Run every Jolt benchmark case:

```bash
./scripts/run-all.sh
```

The Jolt script clears the relevant `/tmp/jolt-guest-targets/...` guest build
caches before running so the `opt-level=3` patch is reflected in the compiled
guest binaries. The generated logs are written to `jolt/logs/`. Jolt's default
prove-and-verify mode logs `valid: true` on success; this mode is succinct but
does not provide zero knowledge, and this package does not include a Jolt
Groth16-wrapper path.

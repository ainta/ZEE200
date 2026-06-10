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

The paper runtimes are the Table 5 prover computation times in seconds. Timing
is machine-dependent; the deterministic instruction/cycle counts and public
outputs are included to identify matching benchmark programs and inputs.

## Reproduce SP1 Benchmarks

Prerequisites:

- Rust toolchains installed by SP1, including the `succinct` toolchain.
- `cargo +succinct` available. If missing, install SP1 with the official
  `sp1up` flow for SP1 `v5.2.4`.

Run every SP1 benchmark case:

```bash
cd zkvm-benchmarks/sp1
./scripts/run-all.sh
```

This builds the guest ELFs and runs both proof modes for:

| benchmark | inputs |
| --- | --- |
| fibonacci | `n = 20`, `n = 23` |
| mergesort | `n = 500`, `n = 5000` |
| sha256 | `iterations = 10`, `iterations = 200` |

The generated logs are written to `sp1/logs/`.

To run proof modes separately:

```bash
./scripts/build-guests.sh
./scripts/run-stark.sh
./scripts/run-groth16.sh
```

## Reproduce Jolt Benchmarks

Prerequisites:

- Rust toolchain from Jolt's `rust-toolchain.toml`.
- `riscv64-unknown-elf-gcc` available on `PATH`.
- Enough memory for Jolt's prover setup and Dory SRS.

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
guest binaries. The generated logs are written to `jolt/logs/`.

# ZEE200

This is the artifact for the paper `ZEE200: Zero Knowledge for Everything and Everyone @ 200 KHz` to be presented on ACM CCS 2026.

## Overview

ZEE200 is an instruction-based zero-knowledge virtual machine built on a tight ZK CPU and VOLE-based ZK. Proof costs scale with the number of executed instructions, not the entire program size, and memory is modeled via a black-box ZK RAM (IZKRAM).

This repository contains:
- The **ZEE200** backend (implemented in this repo).
- A **ZEE baseline** implementation (`zee-processor`).
- An LLVM/Newlib **frontend toolchain** (via Docker) for compiling C → ZEE assembly → ZK programs.
- Benchmarks and scripts to reproduce the evaluation from the paper.

## Documentation

The original paper describes the design and evaluation.
Example workloads and scripts live under `benchmarks/` and `scripts/`.

## Getting Started

### Prerequisites

- CMake (>=3.10), a C++17 compiler, and `make`.
- Docker (for the LLVM/Newlib toolchain; the zkVM itself does not require Docker).

### Install dependencies (recommended on Linux)

On a fresh Ubuntu-like system, run:

```bash
./setup.sh
```

This installs the EMP toolkit and other libraries used by the ZEE baseline and by some development tooling. It requires `sudo` for the final `apt` step.

### Build the ZEE200 backend

From the repo root:

```bash
mkdir -p build
cd build
cmake ..
make -j
```

This builds `test_zkvm_generic_asm_test` under `build/bin/`.

### Build the ZEE baseline (optional)

To build the ZEE reference prover/verifier (`ZKMachine`) used by the ZEE scripts:

```bash
cd zee-processor
cmake .
make -j
```

This produces a `zee-processor/ZKMachine` binary, which is what the `scripts/zee/run_*.sh` helpers expect.

### Network emulation (optional)

Some experiments in the paper assume a bounded bandwidth and non-zero latency between prover and verifier. The helper script `set_net.sh` configures this using Linux `tc` on a single machine.

- Script location: `set_net.sh` (repo root)
- Usage:
  - `IF=<iface> ./set_net.sh <rate_mbit:100|500|1000> <one_way_delay_ms>`
  - By default `IF=lo` (loopback).
  - The delay is one-way; RTT is roughly `2 × one_way_delay_ms`.
- Example: approximate **1 Gbit/s bandwidth** and **2 ms RTT** on loopback:
  - `./set_net.sh 1000 1`
- To clear the shaping rules:
  - `sudo tc qdisc del dev $IF root`  (replace `$IF` with your interface, e.g., `lo`)

### Frontend toolchain: C → ZEE .s → .zk (Docker)

The frontend lives under `toolchain/` and is intended to run inside a Docker image (`zee-toolchain:20.04`) so it uses a consistent LLVM 10 / newlib environment. On first use, the Docker scripts will build the `zee-toolchain:20.04` image if it is missing; this can take a while, but subsequent runs reuse the image and are much faster.

From the repo root:

```bash
# 1) Compile C to ZEE assembly (.s) via Docker
#    This will build the zee-toolchain:20.04 image automatically if missing.
./toolchain/compile_c_docker.sh \
  benchmarks/fib_stdin/fib_stdin.c \
  benchmarks/fib_stdin/fib_stdin.s

# 2) Convert ZEE .s to a ZK program (.zk) for zee-processor
./toolchain/s_to_zk_docker.sh \
  benchmarks/fib_stdin/fib_stdin.s \
  benchmarks/fib_stdin/fib_stdin.zk
```

You can reuse these commands for other C benchmarks under `benchmarks/` by adjusting the input and output paths. The first build of the `zee-toolchain:20.04` image can consume a significant amount of disk space (on the order of ~16 GB for the image and build artefacts), so make sure you have enough free space.

If Docker requires `sudo` on your system:

- The simplest option is to prefix the commands with `sudo`.
- On Linux with Docker Engine, you can instead allow your user to run Docker without `sudo`:

  ```bash
  # Create the docker group if it does not exist
  getent group docker >/dev/null || sudo groupadd docker

  # Add the current user to the docker group
  sudo usermod -aG docker "$USER"

  # Apply the new group membership (or log out and log back in)
  newgrp docker
  ```

  Membership in the `docker` group effectively grants root-equivalent privileges on the host.

- On macOS (Docker Desktop), `usermod`/`newgrp` and the `docker` Unix group are not used; just install and run Docker Desktop and ensure `docker` is on your `PATH`.

## Benchmark Scripts

The `scripts/` directory contains small, explicit scripts for each benchmark and backend. All of them are meant to be run from the repo root.

Each benchmark has:
- A top-level `run_*_prover.sh` and `run_*_verifier.sh` that select the backend (`zee200` or `zee`) and print any relevant input instructions.
- Backend-specific implementations under:
  - `scripts/zkvm/` for the ZEE200 backend.
  - `scripts/zee/` for the ZEE baseline.

Examples:

### sed (bug trigger)

```bash
# ZEE200 backend
./scripts/run_sed_prover.sh zee200
./scripts/run_sed_verifier.sh zee200

# ZEE baseline
./scripts/run_sed_prover.sh zee
./scripts/run_sed_verifier.sh zee
```

### Fibonacci (fib_stdin)

These use the `benchmarks/fib_stdin/` program, which reads from stdin.

```bash
# Prover (ZEE200)
./scripts/run_fib_prover.sh zee200
# Input pattern in prover terminal:
#   1) Dummy integer (e.g., 12345)
#   2) Fibonacci index n (e.g., 20 or 23)

# Verifier (ZEE200)
./scripts/run_fib_verifier.sh zee200
```

Swap `zee200` → `zee` to run the ZEE baseline instead.

### SHA-256

```bash
# Prover (ZEE200)
./scripts/run_sha_prover.sh zee200
# Input pattern in prover terminal:
#   1) Dummy integer (e.g., 12345)
#   2) Iteration count (e.g., 10 or 200)

# Verifier
./scripts/run_sha_verifier.sh zee200
```

### mergesort / gzip / RAM sweeps

Other benchmarks follow the same naming pattern:

- Mergesort:
  - `./scripts/run_mergesort500_prover.sh <zee200|zee>`
  - `./scripts/run_mergesort500_verifier.sh <zee200|zee>`
  - `./scripts/run_mergesort5000_prover.sh <zee200|zee>`
  - `./scripts/run_mergesort5000_verifier.sh <zee200|zee>`

- gzip (bug trigger and decompression):
  - `./scripts/run_gzip_bug_prover.sh <zee200|zee>`
  - `./scripts/run_gzip_bug_verifier.sh <zee200|zee>`
  - `./scripts/run_gzip_decompress_prover.sh <zee200|zee>`
  - `./scripts/run_gzip_decompress_verifier.sh <zee200|zee>`

- Empty-program RAM sweeps (Table on ZK RAM usage):
  - ZEE200: `./scripts/run_empty_ram_sweep_zee200.sh`
  - ZEE:        `./scripts/run_empty_ram_sweep_zee.sh`

These scripts set up temporary working directories, copy only the necessary binaries and inputs, and log results under `benchmarks/*/` so the raw data is easy to inspect.

## Project Structure

At a high level:

```text
ZEE200/
├── benchmarks/             # C sources, ZEE .s/.zk, inputs, and eval helpers
│   ├── empty/              # Empty program + RAM sweep logs
│   ├── fib_stdin/          # Recursive Fibonacci benchmark
│   ├── gzip/               # gzip bug + decompression benchmarks
│   ├── mergesort/          # mergesort benchmarks (n=500, 5000)
│   ├── sed/                # sed vulnerability benchmark
│   └── sha256/             # SHA-256 benchmark
├── emp-zk/                 # EMP toolkit ZK library
├── scripts/                # Top-level and backend-specific runners
│   ├── run_*_prover.sh     # One script per benchmark (backend selector)
│   ├── run_*_verifier.sh   # Matching verifier scripts
│   ├── zkvm/               # ZEE200-specific runners
│   └── zee/                # ZEE baseline-specific runners
├── toolchain/              # Frontend toolchain (LLVM, newlib, Docker scripts)
│   ├── zk-llvm-backend/    # ZEE LLVM backend + newlib sources
│   ├── zknewlib/           # Newlib build directory for zk target
│   ├── zee-cleartext/      # Cleartext ISA→ZK ISA tools (isaconverter, zkassembler)
│   ├── compile_c.sh        # C → ZEE .s (host)
│   ├── compile_c_docker.sh # C → ZEE .s (Docker; preferred)
│   └── s_to_zk_docker.sh   # ZEE .s → .zk (Docker)
├── zk-ram/                 # IZKRAM / ZKSet implementations
├── zkvm/                   # Core ZEE200 backend implementation
│   ├── generic_asm_test.cpp  # Main driver (test_zkvm_generic_asm_test)
│   ├── common_test_base.h    # ZK protocol harness
│   ├── instruction.h         # Circuit representation
│   ├── zkcpu.h               # VM coordinator
│   ├── gates/                # Gate(Gadget) implementations
│   ├── parsing/              # Assembly parser
│   ├── translation/          # ASM→circuit lowering
│   └── cleartext_vm/         # Cleartext reference VM
├── zee-processor/           # ZEE baseline prover/verifier (ZKMachine)
└── build/                   # Local build directory (not committed)
    └── bin/                 # Built binaries (e.g., test_zkvm_generic_asm_test)
```

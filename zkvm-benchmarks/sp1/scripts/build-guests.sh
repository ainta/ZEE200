#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT/sp1_bench"

if ! rustup toolchain list | grep -q '^succinct'; then
  echo "missing Rust toolchain 'succinct'; install SP1 v5.2.4 tooling first" >&2
  exit 1
fi

cargo +succinct build -p fibonacci-program --target=riscv32im-succinct-zkvm-elf --release
cargo +succinct build -p mergesort-program --target=riscv32im-succinct-zkvm-elf --release
cargo +succinct build -p sha256-program --target=riscv32im-succinct-zkvm-elf --release

#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT/sp1_bench"

if ! rustup toolchain list | grep -q '^succinct'; then
  echo "missing Rust toolchain 'succinct'; install SP1 v5.2.4 tooling first" >&2
  exit 1
fi

SP1_GUEST_RUSTFLAGS="${SP1_GUEST_RUSTFLAGS:--C passes=lower-atomic -C link-arg=-Ttext=0x00201000 -C link-arg=--image-base=0x00200800 -C panic=abort --cfg getrandom_backend=\"custom\" -C llvm-args=-misched-prera-direction=bottomup -C llvm-args=-misched-postra-direction=bottomup}"

# These flags are for SP1 guest ELFs only; do not export them for host proof commands.
RUSTFLAGS="$SP1_GUEST_RUSTFLAGS" cargo +succinct build -p fibonacci-program --target=riscv32im-succinct-zkvm-elf --release
RUSTFLAGS="$SP1_GUEST_RUSTFLAGS" cargo +succinct build -p mergesort-program --target=riscv32im-succinct-zkvm-elf --release
RUSTFLAGS="$SP1_GUEST_RUSTFLAGS" cargo +succinct build -p sha256-program --target=riscv32im-succinct-zkvm-elf --release

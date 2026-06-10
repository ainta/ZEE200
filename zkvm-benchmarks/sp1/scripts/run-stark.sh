#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="$ROOT/logs"
mkdir -p "$OUT"

: "${RAYON_NUM_THREADS:=1}"
: "${SP1_PROVER:=cpu}"
export RAYON_NUM_THREADS SP1_PROVER

cd "$ROOT/sp1_bench/script"

cargo run --release -- --prove --program fibonacci --n 20 \
  2>&1 | tee "$OUT/fibonacci_20_stark.log"
cargo run --release -- --prove --program fibonacci --n 23 \
  2>&1 | tee "$OUT/fibonacci_23_stark.log"
cargo run --release -- --prove --program mergesort --n 500 \
  2>&1 | tee "$OUT/mergesort_500_stark.log"
cargo run --release -- --prove --program mergesort --n 5000 \
  2>&1 | tee "$OUT/mergesort_5000_stark.log"
cargo run --release -- --prove --program sha256 --n 10 \
  2>&1 | tee "$OUT/sha256_10_stark.log"
cargo run --release -- --prove --program sha256 --n 200 \
  2>&1 | tee "$OUT/sha256_200_stark.log"

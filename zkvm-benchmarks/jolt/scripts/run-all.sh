#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
JOLT_DIR="${JOLT_DIR:-$ROOT/work/jolt}"
OUT="$ROOT/logs"
mkdir -p "$OUT"

: "${RAYON_NUM_THREADS:=1}"
: "${RUST_LOG:=info}"
export RAYON_NUM_THREADS RUST_LOG

if [ ! -d "$JOLT_DIR/.git" ]; then
  echo "missing Jolt checkout at $JOLT_DIR; run ./scripts/prepare-jolt.sh first" >&2
  exit 1
fi

rm -rf \
  /tmp/jolt-guest-targets/mergesort-guest-mergesort \
  /tmp/jolt-guest-targets/sha2-guest-sha256_bench \
  /tmp/jolt-guest-targets/fibonacci-guest-fib

cd "$JOLT_DIR"

cargo run --release -p fibonacci -- 20 \
  2>&1 | tee "$OUT/fibonacci_20_jolt.log"
cargo run --release -p fibonacci -- 23 \
  2>&1 | tee "$OUT/fibonacci_23_jolt.log"
cargo run --release -p mergesort -- 500 \
  2>&1 | tee "$OUT/mergesort_500_jolt.log"
cargo run --release -p mergesort -- 5000 \
  2>&1 | tee "$OUT/mergesort_5000_jolt.log"
cargo run --release -p sha2-ex -- 10 \
  2>&1 | tee "$OUT/sha256_10_jolt.log"
cargo run --release -p sha2-ex -- 200 \
  2>&1 | tee "$OUT/sha256_200_jolt.log"

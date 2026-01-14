#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

if [[ -x "$REPO_ROOT/test_zkvm_generic_asm_test" ]]; then
  ZKVM_BIN="$REPO_ROOT/test_zkvm_generic_asm_test"
elif [[ -x "$REPO_ROOT/build/bin/test_zkvm_generic_asm_test" ]]; then
  ZKVM_BIN="$REPO_ROOT/build/bin/test_zkvm_generic_asm_test"
else
  echo "Error: test_zkvm_generic_asm_test not found in repo root or build/bin" >&2
  exit 1
fi

WORKDIR="$(mktemp -d /tmp/zkvm_mergesort5000_prover_XXXXXX)"
echo "[zee200 mergesort5000 prover] WORKDIR=$WORKDIR"

cp "$ZKVM_BIN" "$WORKDIR/test_zkvm_generic_asm_test"
cp "$REPO_ROOT/benchmarks/mergesort/mergesort.s" "$WORKDIR/"
cp "$REPO_ROOT/benchmarks/mergesort/mergesort_input_5000.txt" "$WORKDIR/"

cd "$WORKDIR"

./test_zkvm_generic_asm_test \
  --party 1 \
  --port 12345 \
  --address 0 \
  --asm mergesort.s \
  --ram-size $((1<<17)) \
  < mergesort_input_5000.txt

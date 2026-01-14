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

if [[ ! -f "$REPO_ROOT/benchmarks/fib_stdin/fib_stdin.s" ]]; then
  (cd "$REPO_ROOT" && ./toolchain/compile_c_docker.sh \
    benchmarks/fib_stdin/fib_stdin.c \
    benchmarks/fib_stdin/fib_stdin.s)
fi

WORKDIR="$(mktemp -d /tmp/zkvm_fib23_prover_XXXXXX)"
echo "[zee200 fib23 prover] WORKDIR=$WORKDIR"

cp "$ZKVM_BIN" "$WORKDIR/test_zkvm_generic_asm_test"
cp "$REPO_ROOT/benchmarks/fib_stdin/fib_stdin.s" "$WORKDIR/"

cd "$WORKDIR"

./test_zkvm_generic_asm_test \
  --party 1 \
  --port 12345 \
  --address 0 \
  --asm fib_stdin.s \
  --ram-size $((1<<13))

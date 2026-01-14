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

WORKDIR="$(mktemp -d /tmp/zkvm_sed_verifier_XXXXXX)"
echo "[zee200 sed verifier] WORKDIR=$WORKDIR"

cp "$ZKVM_BIN" "$WORKDIR/test_zkvm_generic_asm_test"
cp "$REPO_ROOT/benchmarks/sed/sed.s" "$WORKDIR/"
cp "$REPO_ROOT/benchmarks/sed/noeol.inp" "$WORKDIR/" 2>/dev/null || true

cd "$WORKDIR"

./test_zkvm_generic_asm_test \
  --party 2 \
  --port 12345 \
  --address 127.0.0.1 \
  --asm sed.s \
  --ram-size $((1<<15)) \
  --qed-addr $(((1<<15)/2))

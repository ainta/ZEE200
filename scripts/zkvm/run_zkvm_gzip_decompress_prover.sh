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

WORKDIR="$(mktemp -d /tmp/zkvm_gzip_decompress_prover_XXXXXX)"
echo "[zee200 gzip_decompress prover] WORKDIR=$WORKDIR"

cp "$ZKVM_BIN" "$WORKDIR/test_zkvm_generic_asm_test"
cp "$REPO_ROOT/benchmarks/gzip/gzip.s" "$WORKDIR/"
cp "$REPO_ROOT/benchmarks/gzip/sample.jpg" "$WORKDIR/"
cp "$REPO_ROOT/benchmarks/gzip/gzip_decompress_input" "$WORKDIR/"

cd "$WORKDIR"

gzip -c sample.jpg > sample.jpg.gz
# Ensure decompression has to recreate sample.jpg, and does not
# early-exit with "already exists".
rm -f sample.jpg

./test_zkvm_generic_asm_test \
  --party 1 \
  --port 12345 \
  --address 0 \
  --asm gzip.s \
  --gcd 2 \
  --ram-size $((1<<19)) \
  < gzip_decompress_input

#!/usr/bin/env bash
set -euo pipefail

# Run the empty-program RAM-size sweep for the ZEE200 backend.
# Usage (from repo root):
#   ./scripts/run_empty_ram_sweep_zee200.sh
#
# For each RAM size 2^e (e = 10..30), starts:
#   - prover in the background
#   - then verifier in the foreground
# and logs to benchmarks/empty/ram_prover.log / ram_verifier.log.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Locate zkvm binary
if [[ -x "$REPO_ROOT/test_zkvm_generic_asm_test" ]]; then
  ZKVM_BIN="$REPO_ROOT/test_zkvm_generic_asm_test"
elif [[ -x "$REPO_ROOT/build/bin/test_zkvm_generic_asm_test" ]]; then
  ZKVM_BIN="$REPO_ROOT/build/bin/test_zkvm_generic_asm_test"
else
  echo "Error: test_zkvm_generic_asm_test not found in repo root or build/bin" >&2
  exit 1
fi

EMPTY_DIR="$REPO_ROOT/benchmarks/empty"
EMPTY_S="$EMPTY_DIR/empty.s"
if [[ ! -f "$EMPTY_S" ]]; then
  echo "Error: empty.s not found at $EMPTY_S" >&2
  exit 1
fi

cd "$EMPTY_DIR"

PROVER_LOG="ram_prover.log"
VERIFIER_LOG="ram_verifier.log"
: >"$PROVER_LOG"
: >"$VERIFIER_LOG"

echo "[empty RAM sweep zee200] Using binary: $ZKVM_BIN"
echo "[empty RAM sweep zee200] Logs: $EMPTY_DIR/$PROVER_LOG (prover), $EMPTY_DIR/$VERIFIER_LOG (verifier)"

for e in $(seq 10 30); do
  r=$((1<<e))
  echo "===== RAM=$r (2^$e) =====" | tee -a "$PROVER_LOG"
  echo "===== RAM=$r (2^$e) =====" >>"$VERIFIER_LOG"

  "$ZKVM_BIN" \
    --party 1 --port 12345 --address 0 \
    --asm "$EMPTY_S" --ram-size "$r" \
    >>"$PROVER_LOG" 2>&1 &
  PROVER_PID=$!

  sleep 1

  "$ZKVM_BIN" \
    --party 2 --port 12345 --address 127.0.0.1 \
    --asm "$EMPTY_S" --ram-size "$r" \
    >>"$VERIFIER_LOG" 2>&1

  wait "$PROVER_PID"
done

echo "[empty RAM sweep zee200] Done."

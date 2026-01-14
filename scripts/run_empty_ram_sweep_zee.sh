#!/usr/bin/env bash
set -euo pipefail

# Run the empty-program RAM-size sweep for ZEE (ZKMachine).
# Usage (from repo root):
#   ./scripts/run_empty_ram_sweep_zee.sh
#
# For each t in 8..23 (RAM ~ 2^(t+2)), starts:
#   - prover in background
#   - then verifier in foreground
# and logs to benchmarks/empty/ram_zee_prover.log / ram_zee_verifier.log.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

ZKM_BIN="$REPO_ROOT/zee-processor/ZKMachine"
if [[ ! -x "$ZKM_BIN" ]]; then
  echo "Error: ZKMachine binary not found at $ZKM_BIN" >&2
  exit 1
fi

EMPTY_DIR="$REPO_ROOT/benchmarks/empty"
EMPTY_ZK="$EMPTY_DIR/empty.zk"
if [[ ! -f "$EMPTY_ZK" ]]; then
  echo "Error: empty.zk not found at $EMPTY_ZK" >&2
  exit 1
fi

cd "$EMPTY_DIR"

rm -rf data
mkdir -p data

PROVER_LOG="ram_zee_prover.log"
VERIFIER_LOG="ram_zee_verifier.log"
: >"$PROVER_LOG"
: >"$VERIFIER_LOG"

echo "[empty RAM sweep zee] Using ZKMachine: $ZKM_BIN"
echo "[empty RAM sweep zee] Logs: $EMPTY_DIR/$PROVER_LOG (prover), $EMPTY_DIR/$VERIFIER_LOG (verifier)"

for t in $(seq 8 23); do
  echo "===== $(date -Is) | t=$t | RAM=2^($t+2) =====" | tee -a "$PROVER_LOG"
  echo "===== $(date -Is) | t=$t | RAM=2^($t+2) =====" >>"$VERIFIER_LOG"

  "$ZKM_BIN" P 44444 "$t" "$EMPTY_ZK" >>"$PROVER_LOG" 2>&1 &
  PROVER_PID=$!

  sleep 1

  "$ZKM_BIN" V 44444 "$t" "$EMPTY_ZK" >>"$VERIFIER_LOG" 2>&1

  wait "$PROVER_PID"
done

echo "[empty RAM sweep zee] Done."

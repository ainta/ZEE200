#!/usr/bin/env bash
set -euo pipefail

set -euo pipefail

# Run the mergesort benchmark with n=5000.
# Usage:
#   ./scripts/run_mergesort5000_prover.sh <zee200|zee>

BACKEND="${1:-}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "$BACKEND" != "zee200" && "$BACKEND" != "zee" ]]; then
  echo "usage: $0 <zee200|zee>" >&2
  exit 1
fi

echo "[mergesort5000 prover] backend=$BACKEND"

if [[ "$BACKEND" == "zee200" ]]; then
  exec "$SCRIPT_DIR/zkvm/run_zkvm_mergesort5000_prover.sh"
else
  exec "$SCRIPT_DIR/zee/run_zee_mergesort5000_prover.sh"
fi

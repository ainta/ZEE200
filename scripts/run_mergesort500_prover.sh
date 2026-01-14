#!/usr/bin/env bash
set -euo pipefail

set -euo pipefail

# Run the mergesort benchmark with n=500 (bug-free).
# Usage:
#   ./scripts/run_mergesort500_prover.sh <zee200|zee>

BACKEND="${1:-}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "$BACKEND" != "zee200" && "$BACKEND" != "zee" ]]; then
  echo "usage: $0 <zee200|zee>" >&2
  exit 1
fi

echo "[mergesort500 prover] backend=$BACKEND"

if [[ "$BACKEND" == "zee200" ]]; then
  exec "$SCRIPT_DIR/zkvm/run_zkvm_mergesort500_prover.sh"
else
  exec "$SCRIPT_DIR/zee/run_zee_mergesort500_prover.sh"
fi

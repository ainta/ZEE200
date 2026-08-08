#!/usr/bin/env bash
set -euo pipefail

# Run the Fibonacci benchmark (fib_stdin) prover.
# Usage (from repo root):
#   ./scripts/run_fib_prover.sh <zee200|zee> [20|23]
# Input pattern in the prover terminal:
#   - First input: dummy integer (e.g., 12345)
#   - Second input: the selected Fibonacci index

BACKEND="${1:-}"
VARIANT="${2:-20}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "$BACKEND" != "zee200" && "$BACKEND" != "zee" ]]; then
  echo "usage: $0 <zee200|zee> [20|23]" >&2
  exit 1
fi

if [[ "$VARIANT" != "20" && "$VARIANT" != "23" ]]; then
  echo "usage: $0 <zee200|zee> [20|23]" >&2
  exit 1
fi

echo "[fib prover] backend=$BACKEND variant=$VARIANT"
echo "[fib prover] Input pattern:"
echo "  - First input: dummy integer (e.g., 12345)"
echo "  - Second input: Fibonacci index n=$VARIANT"

if [[ "$BACKEND" == "zee200" ]]; then
  exec "$SCRIPT_DIR/zkvm/run_zkvm_fib${VARIANT}_prover.sh"
else
  exec "$SCRIPT_DIR/zee/run_zee_fib${VARIANT}_prover.sh"
fi

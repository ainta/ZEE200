#!/usr/bin/env bash
set -euo pipefail

# Run the Fibonacci benchmark (fib_stdin) prover.
# Usage (from repo root):
#   ./scripts/run_fib_prover.sh <zee200|zee>
# Input pattern in the prover terminal:
#   - First input: dummy integer (e.g., 12345)
#   - Second input: Fibonacci index n (e.g., 20 or 23)

BACKEND="${1:-}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "$BACKEND" != "zee200" && "$BACKEND" != "zee" ]]; then
  echo "usage: $0 <zee200|zee>" >&2
  exit 1
fi

echo "[fib prover] backend=$BACKEND"
echo "[fib prover] Input pattern:"
echo "  - First input: dummy integer (e.g., 12345)"
echo "  - Second input: Fibonacci index n (e.g., 20 or 23)"

if [[ "$BACKEND" == "zee200" ]]; then
  exec "$SCRIPT_DIR/zkvm/run_zkvm_fib20_prover.sh"
else
  exec "$SCRIPT_DIR/zee/run_zee_fib20_prover.sh"
fi

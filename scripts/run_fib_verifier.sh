#!/usr/bin/env bash
set -euo pipefail

set -euo pipefail

# Run the Fibonacci benchmark verifier.
# Usage:
#   ./scripts/run_fib_verifier.sh <zee200|zee> [20|23]

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

echo "[fib verifier] backend=$BACKEND variant=$VARIANT"

if [[ "$BACKEND" == "zee200" ]]; then
  exec "$SCRIPT_DIR/zkvm/run_zkvm_fib${VARIANT}_verifier.sh"
else
  exec "$SCRIPT_DIR/zee/run_zee_fib${VARIANT}_verifier.sh"
fi

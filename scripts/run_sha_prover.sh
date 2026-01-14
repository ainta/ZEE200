#!/usr/bin/env bash
set -euo pipefail

# Run the SHA-256 benchmark prover.
# Usage:
#   ./scripts/run_sha_prover.sh <zee200|zee>
# Input pattern:
#   - First input: dummy integer (e.g., 12345)
#   - Second input: iteration count (e.g., 10 or 200)

BACKEND="${1:-}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "$BACKEND" != "zee200" && "$BACKEND" != "zee" ]]; then
  echo "usage: $0 <zee200|zee>" >&2
  exit 1
fi

echo "[sha prover] backend=$BACKEND"
echo "[sha prover] Input pattern:"
echo "  - First input: dummy integer (e.g., 12345)"
echo "  - Second input: iteration count (e.g., 10 or 200)"

if [[ "$BACKEND" == "zee200" ]]; then
  exec "$SCRIPT_DIR/zkvm/run_zkvm_sha10_prover.sh"
else
  exec "$SCRIPT_DIR/zee/run_zee_sha10_prover.sh"
fi

#!/usr/bin/env bash
set -euo pipefail

set -euo pipefail

# Run the sed benchmark verifier.
# Usage:
#   ./scripts/run_sed_verifier.sh <zee200|zee>

BACKEND="${1:-}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "$BACKEND" != "zee200" && "$BACKEND" != "zee" ]]; then
  echo "usage: $0 <zee200|zee>" >&2
  exit 1
fi

echo "[sed verifier] backend=$BACKEND"

if [[ "$BACKEND" == "zee200" ]]; then
  exec "$SCRIPT_DIR/zkvm/run_zkvm_sed_verifier.sh"
else
  exec "$SCRIPT_DIR/zee/run_zee_sed_verifier.sh"
fi

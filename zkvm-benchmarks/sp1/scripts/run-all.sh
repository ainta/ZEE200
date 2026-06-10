#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

"$ROOT/scripts/build-guests.sh"
"$ROOT/scripts/run-stark.sh"
"$ROOT/scripts/run-groth16.sh"

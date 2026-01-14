#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

ZKM_BIN="$REPO_ROOT/zee-processor/ZKMachine"
if [[ ! -x "$ZKM_BIN" ]]; then
  echo "Error: ZKMachine binary not found at $ZKM_BIN" >&2
  exit 1
fi

WORKDIR="$(mktemp -d /tmp/zee_sed_prover_XXXXXX)"
echo "[zee sed prover] WORKDIR=$WORKDIR"

cp "$ZKM_BIN" "$WORKDIR/ZKMachine"
cp "$REPO_ROOT/benchmarks/sed/sed.zk" "$WORKDIR/"
cp "$REPO_ROOT/benchmarks/sed/sed_input" "$WORKDIR/"
cp "$REPO_ROOT/benchmarks/sed/noeol.inp" "$WORKDIR/" 2>/dev/null || true
mkdir -p "$WORKDIR/data"

cd "$WORKDIR"

./ZKMachine P 44444 $((15-2)) sed.zk < sed_input

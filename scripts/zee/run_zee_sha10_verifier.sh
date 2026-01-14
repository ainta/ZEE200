#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

ZKM_BIN="$REPO_ROOT/zee-processor/ZKMachine"
if [[ ! -x "$ZKM_BIN" ]]; then
  echo "Error: ZKMachine binary not found at $ZKM_BIN" >&2
  exit 1
fi

WORKDIR="$(mktemp -d /tmp/zee_sha10_verifier_XXXXXX)"
echo "[zee sha10 verifier] WORKDIR=$WORKDIR"

cp "$ZKM_BIN" "$WORKDIR/ZKMachine"
cp "$REPO_ROOT/benchmarks/sha256/sha256.zk" "$WORKDIR/"
mkdir -p "$WORKDIR/data"

cd "$WORKDIR"

./ZKMachine V 44444 $((13-2)) sha256.zk

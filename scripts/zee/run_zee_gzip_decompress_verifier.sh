#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

ZKM_BIN="$REPO_ROOT/zee-processor/ZKMachine"
if [[ ! -x "$ZKM_BIN" ]]; then
  echo "Error: ZKMachine binary not found at $ZKM_BIN" >&2
  exit 1
fi

WORKDIR="$(mktemp -d /tmp/zee_gzip_decompress_verifier_XXXXXX)"
echo "[zee gzip_decompress verifier] WORKDIR=$WORKDIR"

cp "$ZKM_BIN" "$WORKDIR/ZKMachine"
cp "$REPO_ROOT/benchmarks/gzip/gzip.zk" "$WORKDIR/"
cp "$REPO_ROOT/benchmarks/gzip/sample.jpg" "$WORKDIR/"
cp "$REPO_ROOT/benchmarks/gzip/gzip_decompress_input" "$WORKDIR/"
mkdir -p "$WORKDIR/data"

cd "$WORKDIR"

gzip -c sample.jpg > sample.jpg.gz

./ZKMachine V 44444 $((19-2)) gzip.zk

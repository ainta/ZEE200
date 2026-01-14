#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

ZKM_BIN="$REPO_ROOT/zee-processor/ZKMachine"
if [[ ! -x "$ZKM_BIN" ]]; then
  echo "Error: ZKMachine binary not found at $ZKM_BIN" >&2
  exit 1
fi

if [[ ! -f "$REPO_ROOT/benchmarks/fib_stdin/fib_stdin.zk" ]]; then
  echo "Error: benchmarks/fib_stdin/fib_stdin.zk not found (run run_zee_fib20_prover.sh once first)" >&2
  exit 1
fi

WORKDIR="$(mktemp -d /tmp/zee_fib20_verifier_XXXXXX)"
echo "[zee fib20 verifier] WORKDIR=$WORKDIR"

cp "$ZKM_BIN" "$WORKDIR/ZKMachine"
cp "$REPO_ROOT/benchmarks/fib_stdin/fib_stdin.zk" "$WORKDIR/"
mkdir -p "$WORKDIR/data"

cd "$WORKDIR"

./ZKMachine V 44444 $((13-2)) fib_stdin.zk

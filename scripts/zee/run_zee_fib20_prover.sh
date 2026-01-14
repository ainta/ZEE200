#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

ZKM_BIN="$REPO_ROOT/zee-processor/ZKMachine"
if [[ ! -x "$ZKM_BIN" ]]; then
  echo "Error: ZKMachine binary not found at $ZKM_BIN" >&2
  exit 1
fi

# Ensure fib_stdin.zk exists (generate via Docker toolchain if needed)
if [[ ! -f "$REPO_ROOT/benchmarks/fib_stdin/fib_stdin.zk" ]]; then
  if [[ ! -f "$REPO_ROOT/benchmarks/fib_stdin/fib_stdin.s" ]]; then
    (cd "$REPO_ROOT" && ./toolchain/compile_c_docker.sh \
      benchmarks/fib_stdin/fib_stdin.c \
      benchmarks/fib_stdin/fib_stdin.s)
  fi
  (cd "$REPO_ROOT" && ./toolchain/s_to_zk_docker.sh \
    benchmarks/fib_stdin/fib_stdin.s \
    benchmarks/fib_stdin/fib_stdin.zk)
fi

WORKDIR="$(mktemp -d /tmp/zee_fib20_prover_XXXXXX)"
echo "[zee fib20 prover] WORKDIR=$WORKDIR"

cp "$ZKM_BIN" "$WORKDIR/ZKMachine"
cp "$REPO_ROOT/benchmarks/fib_stdin/fib_stdin.zk" "$WORKDIR/"
mkdir -p "$WORKDIR/data"

cd "$WORKDIR"

./ZKMachine P 44444 $((13-2)) fib_stdin.zk

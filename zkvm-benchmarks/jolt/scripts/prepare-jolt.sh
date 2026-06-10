#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORK_DIR="${1:-$ROOT/work/jolt}"
PATCH="$ROOT/patches/jolt-v0.3.0-alpha-integration.patch"
BENCH="$ROOT/jolt_bench"
JOLT_REF="5101ad2143039de6f279613810414c3d071d1f8f"

if [ ! -d "$WORK_DIR/.git" ]; then
  mkdir -p "$(dirname "$WORK_DIR")"
  git clone https://github.com/a16z/jolt.git "$WORK_DIR"
fi

git -C "$WORK_DIR" fetch --tags origin
git -C "$WORK_DIR" checkout --detach "$JOLT_REF"
git -C "$WORK_DIR" clean -fdx

rm -rf \
  "$WORK_DIR/examples/fibonacci" \
  "$WORK_DIR/examples/mergesort" \
  "$WORK_DIR/examples/sha2-ex" \
  "$WORK_DIR/script.sh"

cp -a "$BENCH/examples/fibonacci" "$WORK_DIR/examples/"
cp -a "$BENCH/examples/mergesort" "$WORK_DIR/examples/"
cp -a "$BENCH/examples/sha2-ex" "$WORK_DIR/examples/"
cp -a "$BENCH/script.sh" "$WORK_DIR/"

git -C "$WORK_DIR" apply "$PATCH"

echo "Prepared patched Jolt checkout at $WORK_DIR"

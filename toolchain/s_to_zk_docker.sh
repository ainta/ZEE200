#!/usr/bin/env bash

# Convert a ZEE assembly file (.s) into a ZK program file (.zk)
# using the same Docker toolchain image as compile_c_docker.sh.
#
# Pipeline inside the container:
#   input.s
#     ├─ toolchain/zee-cleartext/isaconverter → input.zk.s   (ZK-instrumented ZEE asm)
#     ├─ toolchain/zee-cleartext/zkassembler  → *.text.hex, *.data.hex
#     └─ stitch (this script)                 → program.zk   (for zee-processor)
#
# Usage (from anywhere inside the repo):
#   ./toolchain/s_to_zk_docker.sh path/to/program.s [output.zk]
#
# If [output.zk] is omitted, the result is:
#   <same-dir>/<basename>.zk

set -euo pipefail

if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo "Usage: $0 <input.s> [output.zk]" >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TOOLCHAIN_ROOT="$SCRIPT_DIR"

INPUT_ARG="$1"

# Resolve input .s to an absolute path and ensure it is inside the repo.
INPUT_ABS="$(cd "$(dirname "$INPUT_ARG")" && pwd)/$(basename "$INPUT_ARG")"
if [[ ! -f "$INPUT_ABS" ]]; then
  echo "Error: input .s file not found: $INPUT_ABS" >&2
  exit 1
fi

case "$INPUT_ABS" in
  "$REPO_ROOT"/*) ;;
  *)
    echo "Error: input .s file must be inside the repository: $REPO_ROOT" >&2
    exit 1
    ;;
esac

INPUT_REL="${INPUT_ABS#$REPO_ROOT/}"

# Derive ZK program output path
if [[ $# -eq 2 ]]; then
  OUTPUT_ARG="$2"
  OUTPUT_ABS="$(cd "$(dirname "$OUTPUT_ARG")" && pwd)/$(basename "$OUTPUT_ARG")"
  case "$OUTPUT_ABS" in
    "$REPO_ROOT"/*) ;;
    *)
      echo "Error: output .zk path must be inside the repository: $REPO_ROOT" >&2
      exit 1
      ;;
  esac
  PROGRAM_REL="${OUTPUT_ABS#$REPO_ROOT/}"
else
  base_rel="${INPUT_REL%.s}"
  PROGRAM_REL="${base_rel}.zk"
fi

# We will generate a ZK-instrumented assembly file alongside the input.
BASE_REL="${INPUT_REL%.s}"
ZKASM_REL="${BASE_REL}.zk.s"

TOOLCHAIN_IMAGE="${ZEE_TOOLCHAIN_IMAGE:-zee-toolchain:20.04}"

echo "[s->zk-docker] Repo root: $REPO_ROOT"
echo "[s->zk-docker] Input .s:  $INPUT_REL"
echo "[s->zk-docker] ZK asm:    $ZKASM_REL"
echo "[s->zk-docker] Program:   $PROGRAM_REL"
echo "[s->zk-docker] Preferred toolchain image: $TOOLCHAIN_IMAGE"

# Ensure the toolchain image exists (build it if not)
if ! docker image inspect "$TOOLCHAIN_IMAGE" >/dev/null 2>&1; then
  if [[ -f "$SCRIPT_DIR/Dockerfile.toolchain" ]]; then
    echo "[s->zk-docker] No toolchain image found; building $TOOLCHAIN_IMAGE..."
    docker build -t "$TOOLCHAIN_IMAGE" -f "$SCRIPT_DIR/Dockerfile.toolchain" "$REPO_ROOT"
  else
    echo "[s->zk-docker] Error: no toolchain image and no Dockerfile.toolchain found." >&2
    exit 1
  fi
fi

echo "[s->zk-docker] Using toolchain image: $TOOLCHAIN_IMAGE"

docker run --rm \
  -e INPUT_S_REL="$INPUT_REL" \
  -e ZKASM_REL="$ZKASM_REL" \
  -e PROGRAM_REL="$PROGRAM_REL" \
  -v "$REPO_ROOT":/workspace \
  -w /workspace \
  "$TOOLCHAIN_IMAGE" \
  bash -lc '
    set -euo pipefail

    echo "[container s->zk] Ensuring zee-cleartext tools (isaconverter, zkassembler) are built..."
    BUILD_DIR="/tmp/zee-cleartext-build"
    rm -rf "$BUILD_DIR"
    mkdir -p "$BUILD_DIR"
    cd "$BUILD_DIR"
    cmake /workspace/toolchain/zee-cleartext >/dev/null
    make -j"$(nproc)" isaconverter zkassembler >/dev/null

    cd /workspace

    echo "[container s->zk] Converting $INPUT_S_REL -> $ZKASM_REL (ZK-instrumented asm)..."
    "$BUILD_DIR/isaconverter" "$INPUT_S_REL" > "$ZKASM_REL"

    echo "[container s->zk] Assembling $ZKASM_REL to hex..."
    "$BUILD_DIR/zkassembler" "$ZKASM_REL"

    base="${ZKASM_REL%.s}"
    data_hex="${base}.data.hex"
    text_hex="${base}.text.hex"

    if [[ ! -f "$data_hex" || ! -f "$text_hex" ]]; then
      echo "[container s->zk] Error: expected $data_hex and $text_hex from zkassembler." >&2
      exit 1
    fi

    datalen=$(wc -l < "$data_hex")
    textlen=$(wc -l < "$text_hex")

    echo "[container s->zk] Stitching into program: $PROGRAM_REL"
    {
      echo "$datalen"
      echo "$textlen"
      cat "$data_hex"
      cat "$text_hex"
    } > "$PROGRAM_REL"
  '

echo "[s->zk-docker] Done."

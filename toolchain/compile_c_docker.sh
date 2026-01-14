#!/usr/bin/env bash

# Compile a C file to ZEE assembly using Docker.
#
# This script runs the existing toolchain/compile_c.sh inside an
# Ubuntu 20.04 container with clang-10/LLVM 10 and gold installed.
# It mounts this repository at /workspace inside the container.
#
# Usage (from anywhere inside the repo):
#   ./toolchain/compile_c_docker.sh path/to/program.c [output.s]
#
# If [output.s] is omitted, compile_c.sh will use its default:
#   examples/files/<basename>.generated.s

set -euo pipefail

if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo "Usage: $0 <input.c> [output.s]" >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

INPUT_ARG="$1"

# Resolve input C file to an absolute path and ensure it is inside the repo.
INPUT_ABS="$(cd "$(dirname "$INPUT_ARG")" && pwd)/$(basename "$INPUT_ARG")"
if [[ ! -f "$INPUT_ABS" ]]; then
  echo "Error: input C file not found: $INPUT_ABS" >&2
  exit 1
fi

case "$INPUT_ABS" in
  "$REPO_ROOT"/*) ;;
  *)
    echo "Error: input C file must be inside the repository: $REPO_ROOT" >&2
    exit 1
    ;;
esac

INPUT_REL="${INPUT_ABS#$REPO_ROOT/}"

OUTPUT_REL=""
if [[ $# -eq 2 ]]; then
  OUTPUT_ARG="$2"
  OUTPUT_ABS="$(cd "$(dirname "$OUTPUT_ARG")" && pwd)/$(basename "$OUTPUT_ARG")"
  case "$OUTPUT_ABS" in
    "$REPO_ROOT"/*) ;;
    *)
      echo "Error: output path must be inside the repository: $REPO_ROOT" >&2
      exit 1
      ;;
  esac
  OUTPUT_REL="${OUTPUT_ABS#$REPO_ROOT/}"
fi

TOOLCHAIN_IMAGE="${ZEE_TOOLCHAIN_IMAGE:-zee-toolchain:20.04}"

echo "[docker-toolchain] Repo root: $REPO_ROOT"
echo "[docker-toolchain] Input:     $INPUT_REL"
if [[ -n "$OUTPUT_REL" ]]; then
  echo "[docker-toolchain] Output:    $OUTPUT_REL"
fi
echo "[docker-toolchain] Preferred toolchain image: $TOOLCHAIN_IMAGE"

if ! docker image inspect "$TOOLCHAIN_IMAGE" >/dev/null 2>&1; then
  if [[ -f "$SCRIPT_DIR/Dockerfile.toolchain" ]]; then
    echo "[docker-toolchain] No prebuilt toolchain image found; building $TOOLCHAIN_IMAGE..."
    docker build -t "$TOOLCHAIN_IMAGE" -f "$SCRIPT_DIR/Dockerfile.toolchain" "$REPO_ROOT"
  else
    echo "[docker-toolchain] No prebuilt image and no Dockerfile.toolchain; falling back to base ubuntu:20.04" >&2
  fi
fi

if docker image inspect "$TOOLCHAIN_IMAGE" >/dev/null 2>&1; then
  echo "[docker-toolchain] Using toolchain image: $TOOLCHAIN_IMAGE"
  docker run --rm \
    -e LLC_BIN="/opt/zee-llvm/bin/llc" \
    -e INPUT_C_REL="$INPUT_REL" \
    -e OUTPUT_S_REL="$OUTPUT_REL" \
    -v "$REPO_ROOT":/workspace \
    -w /workspace \
    "$TOOLCHAIN_IMAGE" \
    bash -lc '
      set -euo pipefail
      echo "[container] Using prebuilt toolchain image (no apt-get, llc baked)..."
      cd /workspace
      echo "[container] Compiling $INPUT_C_REL via toolchain/compile_c.sh..."
      if [[ -n "${OUTPUT_S_REL:-}" ]]; then
        ./toolchain/compile_c.sh "$INPUT_C_REL" "$OUTPUT_S_REL"
      else
        ./toolchain/compile_c.sh "$INPUT_C_REL"
      fi
    '
else
  DOCKER_IMAGE="ubuntu:20.04"
  echo "[docker-toolchain] Using fallback base image: $DOCKER_IMAGE"

  docker run --rm \
    -e DEBIAN_FRONTEND=noninteractive \
    -e INPUT_C_REL="$INPUT_REL" \
    -e OUTPUT_S_REL="$OUTPUT_REL" \
    -v "$REPO_ROOT":/workspace \
    -w /workspace \
    "$DOCKER_IMAGE" \
    bash -lc '
      set -euo pipefail

      echo "[container] Updating package lists..."
      apt-get update -qq

      echo "[container] Installing clang-10/llvm-10 and build deps..."
      apt-get install -y \
        clang-10 \
        llvm-10 \
        binutils-gold \
        build-essential \
        cmake \
        gcc-multilib \
        g++-multilib \
        libc6-dev-i386 \
        ca-certificates >/dev/null

      echo "[container] (Re)building llc (ZEE) in this environment..."
      cd /workspace/toolchain/zk-llvm-backend/llvm
      rm -rf build
      mkdir -p build
      cd build
      cmake -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD=ZEE .. >/dev/null
      make -j"$(nproc)" llc >/dev/null

      cd /workspace
      echo "[container] Compiling $INPUT_C_REL via toolchain/compile_c.sh..."
      if [[ -n "${OUTPUT_S_REL:-}" ]]; then
        ./toolchain/compile_c.sh "$INPUT_C_REL" "$OUTPUT_S_REL"
      else
        ./toolchain/compile_c.sh "$INPUT_C_REL"
      fi
    '
fi

echo "[docker-toolchain] Done."

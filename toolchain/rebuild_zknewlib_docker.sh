#!/usr/bin/env bash

# Host-side helper to rebuild zknewlib inside an Ubuntu 20.04 Docker
# container with clang-10/LLVM 10, so the resulting LTO bitcode is
# compatible with the LLVM 10 ZEE backend.
#
# Usage (from repository root):
#   ./toolchain/rebuild_zknewlib_docker.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "[rebuild-zknewlib-docker] Repo root: $REPO_ROOT"

if ! command -v docker >/dev/null 2>&1; then
  echo "[rebuild-zknewlib-docker] Error: docker not found in PATH" >&2
  exit 1
fi

DOCKER_IMAGE="ubuntu:20.04"

echo "[rebuild-zknewlib-docker] Using image: $DOCKER_IMAGE"

docker run --rm \
  -e DEBIAN_FRONTEND=noninteractive \
  -v "$REPO_ROOT":/workspace \
  -w /workspace \
  "$DOCKER_IMAGE" \
  bash -lc '
    set -euo pipefail
    echo "[container] Updating package lists..."
    apt-get update -qq
    echo "[container] Installing clang-10/llvm-10 and build deps (including 32-bit libs)..."
    apt-get install -y \
      clang-10 \
      llvm-10 \
      binutils-gold \
      build-essential \
      gawk \
      gcc-multilib \
      g++-multilib \
      libc6-dev-i386 \
      ca-certificates >/dev/null

    echo "[container] clang-10 version:"
    clang-10 --version || true

    echo "[container] Rebuilding zknewlib with clang-10..."
    cd /workspace
    ./toolchain/rebuild_zknewlib_in_container.sh
  '

echo "[rebuild-zknewlib-docker] zknewlib rebuild via Docker completed."

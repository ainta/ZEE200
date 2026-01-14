#!/usr/bin/env bash

# Rebuild zknewlib (newlib for the zk target) assuming a container
# environment that already has clang-10/llvm-10 installed.
#
# This script is intended to be run *inside* a Docker container such as
# ubuntu:20.04 where:
#   - clang-10, llvm-10, binutils-gold, etc. are available
#   - /workspace is a bind mount of the repository root
#
# It configures and builds:
#   toolchain/zknewlib/zk/newlib/libc.a
#   toolchain/zknewlib/zk/newlib/libm.a
#   toolchain/zknewlib/zk/libgloss/zk/libsim.a
# using clang-10 and LLVM 10 LTO bitcode, so they are compatible with
# the LLVM 10-based ZEE backend and gold LTO pipeline.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

ZKLB="$REPO_ROOT/toolchain/zk-llvm-backend"
ZKNEWLIB="$REPO_ROOT/toolchain/zknewlib"

echo "[rebuild-zknewlib] Repo root: $REPO_ROOT"
echo "[rebuild-zknewlib] zk-llvm-backend: $ZKLB"
echo "[rebuild-zknewlib] zknewlib (output): $ZKNEWLIB"

if [[ ! -d "$ZKLB/newlib-3.3.0" ]]; then
  echo "[rebuild-zknewlib] Error: newlib-3.3.0 sources not found under $ZKLB" >&2
  exit 1
fi

if ! command -v clang-10 >/dev/null 2>&1; then
  echo "[rebuild-zknewlib] Error: clang-10 not found in PATH (expected inside container)" >&2
  exit 1
fi

if ! command -v llvm-ar-10 >/dev/null 2>&1 || \
   ! command -v llvm-as-10 >/dev/null 2>&1 || \
   ! command -v llvm-ranlib-10 >/dev/null 2>&1; then
  echo "[rebuild-zknewlib] Error: llvm-ar-10/llvm-as-10/llvm-ranlib-10 not found in PATH" >&2
  exit 1
fi

echo "[rebuild-zknewlib] Cleaning existing zknewlib directory..."
rm -rf "$ZKNEWLIB"
mkdir -p "$ZKNEWLIB"
cd "$ZKNEWLIB"

echo "[rebuild-zknewlib] Configuring newlib for target 'zk' with clang-10/LLVM 10..."
"$ZKLB/newlib-3.3.0/configure" \
  --target='zk' \
  --with-newlib \
  --disable-multilib \
  CC='clang-10 -m32 -D_FORTIFY_SOURCE=0 -D__GLIBC_USE\(...\)=0' \
  CFLAGS='-flto' \
  AR=llvm-ar-10 AS=llvm-as-10 RANLIB=llvm-ranlib-10 \
  --disable-newlib-io-float \
  --disable-newlib-io-long-long \
  CC_FOR_TARGET='clang-10 -m32 -D_FORTIFY_SOURCE=0 -D__GLIBC_USE\(...\)=0' \
  CFLAGS_FOR_TARGET='-flto' \
  AR_FOR_TARGET=llvm-ar-10 \
  AS_FOR_TARGET=llvm-as-10 \
  RANLIB_FOR_TARGET=llvm-ranlib-10

echo "[rebuild-zknewlib] Building zknewlib..."
make -j"$(nproc)"

echo "[rebuild-zknewlib] zknewlib build complete."
echo "[rebuild-zknewlib] Expected artifacts:"
echo "  - $ZKNEWLIB/zk/newlib/libc.a"
echo "  - $ZKNEWLIB/zk/newlib/libm.a"
echo "  - $ZKNEWLIB/zk/libgloss/zk/libsim.a"

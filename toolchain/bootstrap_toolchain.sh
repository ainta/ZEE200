#!/usr/bin/env bash

# Bootstrap the C→ZEE toolchain inside the repo's toolchain directory.
#
# This script builds the vendored toolchain under toolchain/:
#   1. Builds llc with the ZEE backend under toolchain/zk-llvm-backend/llvm
#   2. Configures and builds zknewlib (newlib for zk target) under toolchain/zknewlib
#
# It assumes the zk-llvm-backend sources have already been copied into
# toolchain/zk-llvm-backend (see toolchain/README.md) and does not rely on
# any external zkcompiler checkouts.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

ZKLB="$REPO_ROOT/toolchain/zk-llvm-backend"
ZKNEWLIB="$REPO_ROOT/toolchain/zknewlib"

echo "[bootstrap] Repo root: $REPO_ROOT"

mkdir -p "$REPO_ROOT/toolchain"

if [[ ! -d "$ZKLB" ]]; then
  echo "[bootstrap] Error: zk-llvm-backend sources not found at $ZKLB" >&2
  echo "[bootstrap] Copy zk-llvm-backend into toolchain/zk-llvm-backend or" >&2
  echo "[bootstrap] initialize it as a submodule, then rerun this script." >&2
  exit 1
fi

echo "[bootstrap] Building llc with ZEE backend..."
mkdir -p "$ZKLB/llvm/build"
cd "$ZKLB/llvm/build"
cmake -DCMAKE_BUILD_TYPE=Release \
      -DLLVM_TARGETS_TO_BUILD=ZEE \
      ..
make -j"$(nproc)" llc

echo "[bootstrap] llc built at: $ZKLB/llvm/build/bin/llc"

if [[ ! -d "$ZKNEWLIB" ]]; then
  echo "[bootstrap] Creating zknewlib build directory at $ZKNEWLIB..."
  mkdir -p "$ZKNEWLIB"
fi

echo "[bootstrap] Configuring zknewlib (newlib for zk target)..."
cd "$ZKNEWLIB"

if [[ ! -f "Makefile" ]]; then
  "$ZKLB/newlib-3.3.0/configure" \
    --target='zk' \
    --with-newlib \
    --disable-multilib \
    CC='clang -m32 -D_FORTIFY_SOURCE=0 -D__GLIBC_USE\(...\)=0' \
    CFLAGS='-flto' \
    AR=llvm-ar AS=llvm-as RANLIB=llvm-ranlib \
    --disable-newlib-io-float \
    --disable-newlib-io-long-long \
    CC_FOR_TARGET='clang -m32 -D_FORTIFY_SOURCE=0 -D__GLIBC_USE\(...\)=0' \
    CFLAGS_FOR_TARGET='-flto' \
    AR_FOR_TARGET=llvm-ar \
    AS_FOR_TARGET=llvm-as \
    RANLIB_FOR_TARGET=llvm-ranlib
else
  echo "[bootstrap] zknewlib already configured, skipping configure step."
fi

echo "[bootstrap] Building zknewlib..."
make -j"$(nproc)"

echo "[bootstrap] zknewlib build complete."
echo "[bootstrap] Expected artifacts:"
echo "  - $ZKNEWLIB/zk/newlib/libc.a"
echo "  - $ZKNEWLIB/zk/newlib/libm.a"
echo "  - $ZKNEWLIB/zk/libgloss/zk/libsim.a"

echo "[bootstrap] Toolchain bootstrap finished."

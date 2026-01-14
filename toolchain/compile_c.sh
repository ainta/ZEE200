#!/usr/bin/env bash

# Compile a C file to ZEE assembly using the
# locally vendored toolchain under toolchain/.
#
# This script uses gold LTO to generate optimized LLVM bitcode, then
# uses llc -march=zee (ZEE backend) to generate the final assembly.
#
# Usage:
#   ./toolchain/compile_c.sh path/to/program.c [output.s]
#
# If [output.s] is omitted, the result is written to:
#   examples/files/<basename>.generated.s

set -euo pipefail

if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo "Usage: $0 <input.c> [output.s]" >&2
  exit 1
fi

INPUT_C="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
if [[ ! -f "$INPUT_C" ]]; then
  echo "Error: input C file not found: $INPUT_C" >&2
  exit 1
fi

# Determine repository root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

if [[ $# -eq 2 ]]; then
  OUTPUT_S=$2
else
  base=$(basename "$INPUT_C")
  stem=${base%.*}
  OUTPUT_S="examples/files/${stem}.generated.s"
fi

ZKLB="$REPO_ROOT/toolchain/zk-llvm-backend"

ZKNEWLIB="$REPO_ROOT/toolchain/zknewlib"

if [[ ! -d "$ZKLB" ]]; then
  echo "Error: zk-llvm-backend not found at: $ZKLB" >&2
  echo "Populate toolchain/zk-llvm-backend as described in toolchain/README.md." >&2
  exit 1
fi
if [[ ! -d "$ZKNEWLIB" ]]; then
  echo "Error: zknewlib not found." >&2
  echo "Build newlib under toolchain/zknewlib as described in toolchain/README.md." >&2
  exit 1
fi

# Use start.c which includes software division helpers (SFUDIV, SFSDIV, etc.)
START_C="$ZKLB/zkstartfile/start.c"

LIBC_A="$ZKNEWLIB/zk/newlib/libc.a"
LIBM_A="$ZKNEWLIB/zk/newlib/libm.a"
LIBSIM_A="$ZKNEWLIB/zk/libgloss/zk/libsim.a"

NEWLIB_LIBC_INC="$ZKLB/newlib-3.3.0/newlib/libc/include"

# Use zk-specific target includes for sys/ headers (fcntl.h, etc.)
# These have the correct O_* flag values that match the compiled zknewlib
ZKNEWLIB_TARG_INC="$ZKNEWLIB/zk/newlib/targ-include"

for f in "$START_C" "$LIBC_A"; do
  if [[ ! -e "$f" ]]; then
    echo "Error: required toolchain file not found: $f" >&2
    echo "Verify zk-llvm-backend and zknewlib are built as in toolchain/README.md." >&2
    exit 1
  fi
done

# Use clang-10 for compatibility with newlib bitcode
CLANG="clang-10"
if ! command -v "$CLANG" >/dev/null 2>&1; then
  echo "Error: clang-10 not found. Install clang-10." >&2
  exit 1
fi

# Find LLVMgold.so plugin
LLVMGOLD="/usr/lib/llvm-10/lib/LLVMgold.so"
if [[ ! -f "$LLVMGOLD" ]]; then
  echo "Error: LLVMgold.so not found at $LLVMGOLD" >&2
  exit 1
fi

# Prefer an explicit llc override if provided.
if [[ -n "${LLC_BIN:-}" && -x "${LLC_BIN:-}" ]]; then
  LLC="$LLC_BIN"
elif [[ -x "$ZKLB/llvm/build/bin/llc" ]]; then
  LLC="$ZKLB/llvm/build/bin/llc"
else
  echo "Error: llc (ZEE backend) not found or not executable." >&2
  exit 1
fi

# Work in a temp directory
TMPDIR="$(mktemp -d -t zkvm-compile-XXXXXXXX)"
trap 'rm -rf "$TMPDIR"' EXIT

echo "[toolchain] Using clang: $CLANG"
echo "[toolchain] Using llc:   $LLC"

# Step 1: Run gold LTO linking
# This generates a.out.0.5.precodegen.bc even if the final linking fails
# (the inline asm error occurs AFTER the bitcode is generated)
echo "[toolchain] Running gold LTO (generating optimized bitcode)..."

pushd "$TMPDIR" >/dev/null

"$CLANG" -m32 "$INPUT_C" \
  "$START_C" \
  -l"$LIBC_A" \
  -l"$LIBM_A" \
  -l"$LIBSIM_A" \
  -flto -fuse-ld=gold \
  -Wl,-plugin="$LLVMGOLD" \
  -Wl,-plugin-opt=save-temps \
  -Wl,-e,start \
  -I"$ZKNEWLIB_TARG_INC" \
  -I"$NEWLIB_LIBC_INC" \
  -ffreestanding \
  >/dev/null 2>&1 || true

# The linker will fail with "invalid operand for instruction" but the .bc files
# are generated BEFORE this error occurs
if [[ ! -f a.out.0.5.precodegen.bc ]]; then
  echo "Error: gold LTO did not produce a.out.0.5.precodegen.bc" >&2
  exit 1
fi

popd >/dev/null

# Step 2: Generate ZEE assembly using custom llc backend
echo "[toolchain] Generating ZEE assembly..."
"$LLC" -march=zee --disable-simplify-libcalls \
  "$TMPDIR/a.out.0.5.precodegen.bc" -o "$TMPDIR/program.s" 2>&1 | \
  grep -v "^DEBUG\|^SET_CC\|^GBA\|^Offset" || true

if [[ ! -f "$TMPDIR/program.s" ]]; then
  echo "Error: llc did not produce program.s" >&2
  exit 1
fi

# Step 3: Copy output to destination
mkdir -p "$REPO_ROOT/$(dirname "$OUTPUT_S")"
cp "$TMPDIR/program.s" "$REPO_ROOT/$OUTPUT_S"

# Report stats
LINE_COUNT=$(wc -l < "$REPO_ROOT/$OUTPUT_S")
VMCALL_COUNT=$(grep -c "VMCALL\|INPUT" "$REPO_ROOT/$OUTPUT_S" 2>/dev/null || echo "0")

echo "[toolchain] Generated assembly: $OUTPUT_S"
echo "[toolchain] Lines: $LINE_COUNT, VMCALL/INPUT instructions: $VMCALL_COUNT"

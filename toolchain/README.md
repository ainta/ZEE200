# ZEE C Toolchain (C → zkVM Assembly)

This folder documents and hosts the **frontend toolchain** used to compile
ANSI C programs into the ZEE assembly that the zkVM executes
(`examples/files/*.s`), without requiring any external zkcompiler checkouts
at build or run time. The necessary sources are intended to be vendored
here (copied from the original zk-llvm-backend / newlib trees once).

## Overview

End-to-end pipeline:

1. C source (`foo.c`) + runtime + newlib
   → **clang + LTO + gold** → `a.out.0.5.precodegen.bc`
2. `a.out.0.5.precodegen.bc`
   → **llc -march=zee** → `foo.s` (ZEE assembly)
3. `foo.s`
   → zkVM (`test_zkvm_generic_asm_test`) → cleartext + ZK execution

This `toolchain/` directory is intended to host:

- A local copy of the custom LLVM backend + start files
- A local copy of the newlib build for the zk target
- A small helper script to compile C → `.s` using those local copies

## Directory layout (after bootstrap)

After you bootstrap the toolchain, the layout under `toolchain/` will look like:

```text
toolchain/
  zk-llvm-backend/        # custom LLVM backend (ZEE target)
  zknewlib/               # newlib build for zk target
  zee-cleartext/          # cleartext ISA → ZK ISA tools
  compile_c.sh            # helper: compile C → ZEE assembly
  compile_c_docker.sh     # helper: C → ZEE assembly via Docker
  s_to_zk_docker.sh       # helper: ZEE .s → .zk via Docker
  README.md               # this file
```

The `zk-llvm-backend` and `zknewlib` contents come from the external
`zkcompiler` project, but once copied here the repo is
self-contained for assembly generation.

## Step 1: Vendor zk-llvm-backend sources into toolchain/

One time, copy the zk-llvm-backend sources into this repository so that
the LLVM backend and newlib sources live under `toolchain/`:

```bash
mkdir -p toolchain

# Example (if you have zk-llvm-backend elsewhere on your machine):
cp -a /path/to/zk-llvm-backend toolchain/zk-llvm-backend
```

After this, `toolchain/zk-llvm-backend` should contain:

- `llvm/` (LLVM with ZEE backend)
- `newlib-3.3.0/` (newlib sources)
- `zkstartfile/` (start.c, start2.c)

Once vendored, the repo no longer depends on any external zkcompiler
repos to generate assembly.

## Step 2: Build `llc` with the ZEE backend

From `toolchain/zk-llvm-backend/llvm`:

```bash
cd toolchain/zk-llvm-backend/llvm
mkdir -p build
cd build
cmake -DCMAKE_BUILD_TYPE=Release \
      -DLLVM_TARGETS_TO_BUILD=ZEE \
      ..
make -j"$(nproc)" llc
```

You should end up with:

- `toolchain/zk-llvm-backend/llvm/build/bin/llc`

This `llc` understands `-march=zee` and emits the ZEE-style assembly the zkVM expects.

## Step 3: Build newlib for the zk target

From the parent of `zk-llvm-backend` (here: `toolchain`), configure
and build newlib as in the original zk-machine-cleartext README, but using the
local paths:

```bash
cd toolchain
mkdir -p zknewlib
cd zknewlib

../zk-llvm-backend/newlib-3.3.0/configure \
  --target='zk' \
  --with-newlib \
  --disable-multilib \
  CC='clang -m32 -D_FORTIFY_SOURCE=0 -D__GLIBC_USE\\(...\\)=0' \
  CFLAGS='-flto' \
  AR=llvm-ar AS=llvm-as RANLIB=llvm-ranlib \
  --disable-newlib-io-float \
  --disable-newlib-io-long-long \
  CC_FOR_TARGET='clang -m32 -D_FORTIFY_SOURCE=0 -D__GLIBC_USE\\(...\\)=0' \
  CFLAGS_FOR_TARGET='-flto' \
  AR_FOR_TARGET=llvm-ar \
  AS_FOR_TARGET=llvm-as \
  RANLIB_FOR_TARGET=llvm-ranlib

make -j"$(nproc)"
```

After this, the key artifacts should exist:

- `zknewlib/zk/newlib/libc.a`
- `zknewlib/zk/newlib/libm.a`
- `zknewlib/zk/libgloss/zk/libsim.a`

## Step 4: Compile C → ZEE assembly

Use the helper script from the repository root:

```bash
# Compile a C file to examples/files/foo.s
./toolchain/compile_c.sh path/to/foo.c

# Or specify an explicit output path:
./toolchain/compile_c.sh path/to/foo.c build/bin/foo.s
```

The script:

1. Uses the local `toolchain/zk-llvm-backend` and `toolchain/zknewlib` directories
2. Runs `clang -m32` with:
   - `toolchain/zk-llvm-backend/zkstartfile/start2.c`
   - `toolchain/zknewlib` libraries
   - LTO + gold and `-Wl,-plugin-opt=save-temps`
3. Invokes `toolchain/zk-llvm-backend/llvm/build/bin/llc -march=zee` on
   `a.out.0.5.precodegen.bc`
4. Copies the final `program.s` to the requested path inside the repo

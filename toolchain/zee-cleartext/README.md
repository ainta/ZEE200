# How to build the entire tool chain?

## From C to execute on Cleartext Machine:

Suppose we want to run `foo.c` on our Cleartext Machine, then the the following steps are roughly needed:

1. foo.c + libc.a + libm.a + libsim.a + start.c --- Using clang + LLVM gold linker ---> a.out.0.5.precodegen.bc
2. a.out.0.5.precodegen.bc --- Using llc ---> foo.s
3. foo.s --- Using isaconverter ---> foo.s
4. foo.s --- Using zkassembler ---> foo.text.hex + foo.data.hex
5. foo.text.hex + foo.data.hex + input tape --- Using ClearMachine ---> outputs

## An overview: what we have and where are they?

We have a total of two repo `zk-llvm-backend` and `zk-machine-cleartext`. All the codes about cleartext VM are in these two repo.

Function|Location
--------|--------
LLVM backend support (llc)|zk-llvm-backend/llvm
Newlib support (libc.a/libm.a/libsim.a)|zk-llvm-backend/newlib-3.3.0
Start function (start.c)|zk-llvm-backend/zkstartfile
ZK Assembler|zk-machine-cleartext/src
Converter from Cleartext ISA to ZK ISA|zk-machine-cleartext/src
Cleartext VM|zk-machine-cleartext/src

## Compile the entire tool chain: step by step.

### Build LLVM llc with ZK Backend:

Please refer to `zk-llvm-backend/README.md`. [Click](https://github.com/gconeice/zk-llvm-backend/blob/master/README.md)

### Build LLVM gold plugin(linker):

[Click](https://llvm.org/docs/GoldPlugin.html)

### Build Newlib:

```bash
cd to the place includes zk-llvm-backend folder
mkdir zknewlib
cd zknewlib
../zk-llvm-backend/newlib-3.3.0/configure --target='zk' --with-newlib --disable-multilib CC='clang -m32 -D_FORTIFY_SOURCE=0 -D__GLIBC_USE\\(...\\)=0' CFLAGS='-flto' AR=llvm-ar AS=llvm-as RANLIB=llvm-ranlib --disable-newlib-io-float --disable-newlib-io-long-long CC_FOR_TARGET='clang -m32 -D_FORTIFY_SOURCE=0 -D__GLIBC_USE\\(...\\)=0' CFLAGS_FOR_TARGET='-flto' AR_FOR_TARGET=llvm-ar AS_FOR_TARGET=llvm-as RANLIB_FOR_TARGET=llvm-ranlib
make -j9
```

You should get `zk/newlib/libc.a`, `zk/newlib/libm.a` and `zk/libgloss/zk/libsim.a`.

### To get ClearMachine/isaconverter/zkassembler/char2hex/hex2char:

```bash
cd to the zk-machine-cleartext folder<br/>
mkdir build<br/>
cd build<br/>
cmake ../<br/>
make
```

### Generate the whole LLVM bc file (sed.c, for example):

Suppose we want to build the C program `zk-machine-cleartext/data/sed.c`:

```bash
clang -m32 sed.c PATH_TO_zk-llvm-backend/zk-llvm-backend/zkstartfile/start.c -lPATH_TO_zknewlib/zknewlib/zk/newlib/libc.a -lPATH_TO_zknewlib/zknewlib/zk/newlib/libm.a -lPATH_TO_zknewlib/zknewlib/zk/libgloss/zk/libsim.a -flto -fuse-ld=gold -Wl,-plugin-opt=save-temps -Wl,-e,start -IPATH_TO_zk-llvm-backend/zk-llvm-backend/newlib-3.3.0/newlib/libc/include -ffreestanding
```

You should get `zk-machine-cleartext/data/a.out.0.5.precodegen.bc`

### Compile to ZK assembly and convert it to ZK ISA:

```
PATH_TO_zk-llvm-backend/zk-llvm-backend/llvm/build/bin/llc -march=zee --disable-simplify-libcalls a.out.0.5.precodegen.bc -o sed.s
PATH_TO_zk-machine-cleartext/zk-machine-cleartext/build/isaconverter sed.s > sed.s
```

### ZK assembler to get text.hex and data.hex as VM inputs:

```
PATH_TO_zk-machine-cleartext/zk-machine-cleartext/build/zkassembler sed.s
```

You should get `sed.text.hex` and `sed.data.hex`.

### Run the ZK program on Cleartext VM:

```
cd PATH_TO_zk-machine-cleartext/zk-machine-cleartext/build
./ClearMachine <text> <data> <input> <log-memory-size> <debug? {0,1}>
```

For example:
```
./ClearMachine ../data/sed.text.hex ../data/sed.data.hex  ./input 20 0
```

You should see something like `GNU sed version 1.17`.

BTW, the command line arguments should be encoded into input tape as ascii code each line as a stack ending with 0. `hex2char` and `char2hex` could be helpful here.

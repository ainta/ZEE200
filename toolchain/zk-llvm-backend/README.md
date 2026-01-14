# zk-llvm-backend

## Building with make

cd llvm<br/>
mkdir build && cd build<br/>
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE:STRING=DEBUG(/RELEASE) -DLLVM_TARGETS_TO_BUILD:STRING=ZEE(,X86,...) ../<br/>
make -j9

## Building LLC with ZEE Target

cd llvm<br/>
mkdir build && cd build<br/>
cmake -DCMAKE_BUILD_TYPE:STRING=DEBUG -DLLVM_TARGETS_TO_BUILD:STRING=ZEE ../<br/>
make -j9 llc

## Some Useful LLC options

--disable-simplify-libcalls

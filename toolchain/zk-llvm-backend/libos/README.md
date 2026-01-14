# libos(Library Operating System)

clang a.c -nostdinc -isystem./lib/ -S -emit-llvm<br/>
cd lib<br/>
clang stdio.c -nostdinc -isystem./ -S -emit-llvm<br/>
cd ..<br/>
llvm-link -S a.ll ./lib/stdio.ll -o a.ll<br/>
../llvm/build/bin/llc -march=zee a.ll<br/>

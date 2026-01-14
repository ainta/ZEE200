clang -S -emit-llvm fib.c
clang -S -emit-llvm IO.c
llvm-link -S -o main.ll fib.ll IO.ll

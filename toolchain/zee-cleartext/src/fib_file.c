#include <stdio.h>
#include <stdlib.h>

int fib(int index) {
  if (index == 1 || index == 2) return 1;
  else return fib(index-1) + fib(index-2);
}

int main() {
  FILE * fp = fopen("number.in", "r");
  int in;
  fscanf(fp, "%d", &in);
  int out = fib(in);
  if (out == 55) {
    asm("CALL Proof"); // proof success
  } else {
    asm("CALL Cheat"); // proof failed
  }
}

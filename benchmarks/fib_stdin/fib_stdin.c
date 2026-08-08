#include <stdio.h>
#include <stdlib.h>
int fib(int index) {
  if (index == 1 || index == 2) return 1;
  else return fib(index-1) + fib(index-2);
}
int main() {
  int in;
  //fscanf(fp, "%d", &in);
  scanf("%d", &in);
  int out = fib(in);
  if ((in == 20 && out == 6765) || (in == 23 && out == 28657)) {
    asm("CALL Proof"); // proof success
  } else {
    asm("CALL Cheat"); // proof failed
  }
}

#include "IO/IO.h"

int Fib(int index)
{
	if (index == 1 || index == 2) return 1;
	else return Fib(index-1) + Fib(index-2);
}

int main()
{
	int in = ZKInput();
	int out = Fib(in);
	int res = ZKOutput(out);
	return res;
}

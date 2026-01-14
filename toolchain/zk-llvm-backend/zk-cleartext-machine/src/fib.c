int Fib(int index)
{
	if (index == 1 || index == 2) return 1;
	else return Fib(index-1) + Fib(index-2);
}

int main()
{
	int input;
	asm volatile ("INPUT\t%0\n\t"
	 			  :"=r"(input)
	 	);
	int res = Fib(input);
	asm volatile ("OUTPUT\t%0\n\t"
	 			  :
				  :"r"(res)
	 	);
	return 0;
}

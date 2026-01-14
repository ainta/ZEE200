#include "IO.h"

int ZKInput()
{
	int res;	
	asm volatile ("INPUT\t%0\n\t"
	 			  :"=r"(res)
	 	);
	return res;
}

int ZKOutput(int data)
{
	asm volatile ("OUTPUT\t%0\n\t"
	 			  :
				  :"r"(data)
	 	);
	return 0;
}

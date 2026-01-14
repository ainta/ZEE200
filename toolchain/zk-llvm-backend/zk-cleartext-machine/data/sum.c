#include "IO/IO.h"

int main()
{
	int sum = 0;
	int cnt = ZKInput();
	while (cnt--)
	{
		int tmp = ZKInput();
		sum += tmp;
	}
	ZKOutput(sum);
	return 0;
}

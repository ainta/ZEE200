#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

extern int main(int, char **);

/* #define _init __libc_init_array */

__attribute__((used))
uint32_t SFUDIV(uint32_t x, uint32_t y)
{
	if (y == 0) exit(-1);
	if (x == 0) return 0;
	uint32_t res = 0;
	while (x >= y)
	{
		res++;
		x -= y;
	}
	return res;
}

__attribute__((used))
uint32_t SFUREM(uint32_t x, uint32_t y)
{
	if (y == 0) exit(-1);
	if (x == 0) return 0;
	while (x >= y)
		x -= y;
	return x;
}

__attribute__((used))
int SFSDIV(int x, int y)
{
	if (y == 0) exit(-1);
	if (x == 0) return 0;
	unsigned int xx = x > 0 ? x : -x;
	unsigned int yy = y > 0 ? y : -y;
	unsigned int q = xx / yy;
	if (x > 0 && y > 0) return q;
	if (x > 0 && y < 0) return -q;
	if (x < 0 && y > 0) return -q;
	if (x < 0 && y < 0) return q;
	/* if (x > 0 && y > 0) { */
	/* 	int res = 0; */
	/* 	while (x >= y) */
	/* 	{ */
	/* 		res++; */
	/* 		x -= y; */
	/* 	} */
	/* 	return res; */
	/* } else if (x > 0 && y < 0) { */
	/* 	int res = 0; */
	/* 	while (x >= -y) */
	/* 	{ */
	/* 		res--; */
	/* 		x += y; */
	/* 	} */
	/* 	return res; */
	/* } else if (x < 0 && y > 0) { */
	/* 	int res = 0; */
	/* 	while (-x >= y) */
	/* 	{ */
	/* 		res--; */
	/* 		x += y; */
	/* 	} */
	/* 	return res; */
	/* } else { // x < 0 && y < 0 */
	/* 	int res = 0; */
	/* 	while (-x >= -y) */
	/* 	{ */
	/* 		res++; */
	/* 		x -= y; */
	/* 	} */
	/* 	return res; */
	/* } */
	/* return -1; */
}

__attribute__((used))
int SFSREM(int x, int y)
{
	if (y == 0) exit(-1);
	if (x == 0) return 0;
	unsigned int xx = x > 0 ? x : -x;
	unsigned int yy = y > 0 ? y : -y;
	unsigned int r = xx % yy;
	if (x > 0 && y > 0) return r;
	if (x > 0 && y < 0) return r;
	if (x < 0 && y > 0) return -r;
	if (x < 0 && y < 0) return -r;
	/* if (x > 0 && y > 0) { */
	/* 	while (x >= y) */
	/* 		x -= y; */
	/* 	return x; */
	/* } else if (x > 0 && y < 0) { */
	/* 	while (x >= -y) */
	/* 		x += y; */
	/* 	return x; */
	/* } else if (x < 0 && y > 0) { */
	/* 	while (-x >= y) */
	/* 		x += y; */
	/* 	return x; */
	/* } else { // x < 0 && y < 0 */
	/* 	while (-x >= -y) */
	/* 		x -= y; */
	/* 	return x; */
	/* } */
	/* return -1; */
}

__attribute__((used))
uint64_t SF64UDIV(uint64_t x, uint64_t y)
{
	if (y == 0) exit(-1);
	if (x == 0) return 0;
	uint64_t res = 0;
	uint64_t delta = 1;
	for (;;)
	{
		if (y > x) break;
		uint64_t tmp = x - y;
		if (y > tmp) break;
		y = y << 1;
		delta = delta << 1;
	}
	while (delta)
	{
		if (x >= y)
		{
			res += delta;
			x -= y;
		}
		delta = delta >> 1;
		y = y >> 1;
	}
	return res;
	/* uint64_t res = 0; */
	/* while (x >= y) */
	/* { */
	/* 	res++; */
	/* 	x -= y; */
	/* } */
	/* return res; */
}

__attribute__((used))
uint64_t SF64UREM(uint64_t x, uint64_t y)
{
	if (y == 0) exit(-1);
	if (x == 0) return 0;
	uint64_t delta = 1;
	for (;;)
	{
		if (y > x) break;
		uint64_t tmp = x - y;
		if (y > tmp) break;
		y = y << 1;
		delta = delta << 1;
	}
	while (delta)
	{
		if (x >= y)
			x -= y;
		delta = delta >> 1;
		y = y >> 1;
	}
	return x;
	/* while (x >= y) */
	/* 	x -= y; */
	/* return x; */
}

__attribute__((used))
long long SF64SDIV(long long x, long long y)
{
	if (y == 0) exit(-1);
	if (x == 0) return 0;
	unsigned long long xx = x > 0 ? x : -x;
	unsigned long long yy = y > 0 ? y : -y;
	unsigned long long q = SF64UDIV(xx, yy);
	if (x > 0 && y > 0) return q;
	if (x > 0 && y < 0) return -q;
	if (x < 0 && y > 0) return -q;
	if (x < 0 && y < 0) return q;
	/* if (x > 0 && y > 0) { */
	/* 	long long res = 0; */
	/* 	while (x >= y) */
	/* 	{ */
	/* 		res++; */
	/* 		x -= y; */
	/* 	} */
	/* 	return res; */
	/* } else if (x > 0 && y < 0) { */
	/* 	long long res = 0; */
	/* 	while (x >= -y) */
	/* 	{ */
	/* 		res--; */
	/* 		x += y; */
	/* 	} */
	/* 	return res; */
	/* } else if (x < 0 && y > 0) { */
	/* 	long long res = 0; */
	/* 	while (-x >= y) */
	/* 	{ */
	/* 		res--; */
	/* 		x += y; */
	/* 	} */
	/* 	return res; */
	/* } else { // x < 0 && y < 0 */
	/* 	long long res = 0; */
	/* 	while (-x >= -y) */
	/* 	{ */
	/* 		res++; */
	/* 		x -= y; */
	/* 	} */
	/* 	return res; */
	/* } */
	/* return -1; */
}

__attribute__((used))
long long SF64SREM(long long x, long long y)
{
	if (y == 0) exit(-1);
	if (x == 0) return 0;
	unsigned long long xx = x > 0 ? x : -x;
	unsigned long long yy = y > 0 ? y : -y;
	unsigned long long r = SF64UREM(xx, yy);
	if (x > 0 && y > 0) return r;
	if (x > 0 && y < 0) return r;
	if (x < 0 && y > 0) return -r;
	if (x < 0 && y < 0) return -r;
	
	/* if (x > 0 && y > 0) { */
	/* 	while (x >= y) */
	/* 		x -= y; */
	/* 	return x; */
	/* } else if (x > 0 && y < 0) { */
	/* 	while (x >= -y) */
	/* 		x += y; */
	/* 	return x; */
	/* } else if (x < 0 && y > 0) { */
	/* 	while (-x >= y) */
	/* 		x += y; */
	/* 	return x; */
	/* } else { // x < 0 && y < 0 */
	/* 	while (-x >= -y) */
	/* 		x -= y; */
	/* 	return x; */
	/* } */
	/* return -1; */
}

void start()
{
	
	int rows = 20;
	char **argv = calloc (rows,sizeof(char*));

	char str[20][20];
	for (int i = 0; i < rows; i++) strcpy(str[i], "");

	asm("\tVMCALL\t4");

	int argc = 0;
	for (argc = 0; argc < rows; argc++)
	{
		char ch;
		for (;;)
		{
			__asm__ __volatile__
				("INPUT\t%0"
				 :"=r"(ch));
			if (ch == ' ') continue;
			break;
		}
		for (;;)
		{
			strncat(str[argc], &ch, 1);
			__asm__ __volatile__
				("INPUT\t%0"
				 :"=r"(ch));
			if (ch == ' ') break;
			if (ch == 0) break;
		}
		if (ch == 0)
		{
			argc++;
			break;
		}
	}

	for (int i = 0; i < argc; i++)
		argv[i] = str[i];
		
	int res = main(argc, argv);
	exit(res);
}

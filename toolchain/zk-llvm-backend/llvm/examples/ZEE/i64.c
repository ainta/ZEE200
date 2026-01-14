long long foo(int a, long long b, int c, long long d)
{
	return d;
}

int main()
{
	long long res = foo(2, 3, 4, 21474836486LL);
	return 0;
}

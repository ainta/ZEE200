#include <iostream>
#include <cstdlib>
#include <algorithm>
#include <cstring>
#include <stack>

using namespace std;

stack<int> st;

int main()
{
	char p;
	while (p = getchar())
	{
		if (p == '\n') break;
		st.push(p);
	}
	st.push(0);
	while (!st.empty())
	{
		cout << hex << st.top() <<endl;
		st.pop();
	}
	return 0;
}

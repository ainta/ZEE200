#include <iostream>
#include <cstdlib>
#include <algorithm>
#include <cstring>
#include <stack>

using namespace std;

stack<char> st;

int main()
{
	cin >> hex;
	int p;
	while (cin >> p)
		st.push(char(p));
	while (!st.empty())
	{
		cout << st.top();
		st.pop();
	}
	cout << endl;
	return 0;
}

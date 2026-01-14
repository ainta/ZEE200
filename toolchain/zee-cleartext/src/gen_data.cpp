#include <ctime>
#include <cstdlib>
#include <algorithm>
#include <iostream>

using namespace std;

int n;

int main()
{
	srand(time(0));
	cin >> n;
	cout << n << endl;
	while (n--)
		cout << rand() << ' ';
	cout << endl;
	return 0;
}

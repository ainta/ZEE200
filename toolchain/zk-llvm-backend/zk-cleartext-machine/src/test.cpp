#include "as2hex.h"
#include <iostream>
#include <iomanip>

using namespace std;

int main()
{

	cout << setfill('0') << setw(8) << std::hex << Inst2Int("INPUT %GR0") << endl;
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("SUBI %GR0, %GR0, -1") << endl;
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("COPYI %GR1, 3") << endl;
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("ADD %GR2, %GR0, %GR1") << endl;
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("COPYR %GR3, %GR2") << endl;
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("OUTPUT %GR3") << endl;
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("RET") << endl;	
	
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("SUBI %GR7, %GR7, 8") << endl;	
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("INPUT %GR0") << endl;
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("INPUT %GR1") << endl;
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("STORE %GR0, 4(%GR7)") << endl;
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("STORE %GR1, 8(%GR7)") << endl;
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("LOAD %GR0, 8(%GR7)") << endl;
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("LOAD %GR1, 4(%GR7)") << endl;
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("OUTPUT %GR0") << endl;
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("OUTPUT %GR1") << endl;   
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("ADDI %GR7, %GR7, 8") << endl;	
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("RET") << endl;	

	cout << setfill('0') << setw(8) << std::hex << Inst2Int("STORE %GR0, 40(%GR7)") << endl;	
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("INPUT %GR0") << endl;
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("INPUT %GR1") << endl;
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("ADD %GR2 %GR0 %GR1") << endl;
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("OUTPUT %GR2") << endl;	
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("EQ %GR2 %GR0 %GR1") << endl;
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("OUTPUT %GR2") << endl;	
	cout << setfill('0') << setw(8) << std::hex << Inst2Int("RET") << endl;	
	return 0;
}

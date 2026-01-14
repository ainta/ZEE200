#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <algorithm>
#include <cstring>
#include <sstream>
#include <iomanip>
#include <vector>
#include <map>
#include <fstream>
#include <cstdint>

using namespace std;

vector<string> as_program;
vector<uint64_t> hex_program;
vector<uint8_t> data_program;
map<string, uint32_t> label2pos;
map<string, uint32_t> global_var;

unsigned long long convid = 0;

void MemExtract(std::string mem, std::string & base, std::string & offset)
{
	int len = mem.length();
	offset = "";
	base = "";
	int i;
	for (i = 0; i < len; i++)
	{
		if (mem[i] == '(') break;
		offset += mem[i];
	}
	for (i++; i < len; i++)
	{
		if (mem[i] == ')') break;
		base += mem[i];
	}
}

void Gen_SHL(string dst, string src0, string src1)
{
	cout << "\tPOW\t%SFT, " << src1 << endl;
	cout << "\tMUL\t" << dst << ", %SFT, " << src0 << endl;
}

void Gen_SHLI(string dst, string src0, string imm)
{
	cout << "\tPOWI\t%SFT, " << imm << endl;
	cout << "\tMUL\t" << dst << ", %SFT, " << src0 << endl;
}

void Gen_SRL(string dst, string src0, string src1)
{

	cout << "\tBNEQZ\t" << src1 << ", " << ".CONV" << to_string(convid) << endl;

	cout << "\tCOPYR\t" << dst << ", " << src0 << endl;
	cout << "\tJUMP\t" << ".CONV" << to_string(convid+1) << endl;

	cout << ".CONV" << to_string(convid) << " NOP" << endl;
	
	cout << "\tCOPYR\t%TMP0, " << src0 << endl;
	cout << "\tCOPYR\t%TMP1, " << src1 << endl;
	cout << "\tVMCALL\t6" << endl;

	cout << "\tINPUT\t%POV0" << endl;

	// cout << "\tPROOFSTART" << endl;
	
	//proving
	cout << "\tPOW\t%TMP1, " << src1 << endl;
	cout << "\tSUB\t%SFT, %GR0, %TMP1" << endl;

	cout << "\tAND\t%POV1, %SFT, " << src0 << endl;
	cout << "\tMUL\t%SFT, %TMP1, %POV0" << endl;
	cout << "\tSUB\t%SFT, %SFT, %POV1" << endl;
	cout << "\tBNEQZ\t%SFT, Cheat" << endl;

	cout << "\tCOPYI\t%TMP1, 32" << endl;
	cout << "\tSUB\t%TMP1, %TMP1, " << src1 << endl;
	cout << "\tPOW\t%TMP1, %TMP1" << endl;
	cout << "\tSUB\t%TMP1, %GR0, %TMP1" << endl;
	cout << "\tXORI\t%TMP1, %TMP1, -1" << endl;

	// cout << "\tCOPYR\t" << dst << ", %POV0" << endl;
	cout << "\tAND\t" << dst << ", %POV0, %TMP1" << endl;	

	cout << ".CONV" << to_string(convid+1) << " NOP" << endl;

	convid += 2;

	// cout << "\tPROOFEND" << endl;
	
	/*
	cout << "\tPOW\t%TMP1, " << src1 << endl;

	cout << "\tMSB\t%SFT, %TMP1" << endl;
	cout << "\tBNEQZ\t%SFT, " << ".CONV" << to_string(convid) << endl;
	
	cout << "\tCOPYR\t%TMP0, " << src0 << endl;
	cout << "\tVMCALL\t2" << endl;
	cout << "\tINPUT\t%POV0" << endl;
	cout << "\tINPUT\t%POV1" << endl;

    // ****************************************
	// proving begin
	
	// sub-prove for %TMP0 = %POV0 * %TMP1 + %POV1
	cout << "\tCOPYR\t%SFT, %POV0" << endl;
	cout << "\tMUL\t%SFT, %SFT, %TMP1" << endl;
	cout << "\tADD\t%SFT, %SFT, %POV1" << endl;
	cout << "\tSUB\t%SFT, %SFT, %TMP0" << endl;
	cout << "\tBNEQZ\t%SFT, Cheat" << endl;
		
	// sub-prove for 0 <= %POV1 < %TMP1, notice: MSB(%TMP1) == 0
	cout << "\tMSB\t%SFT, %POV1" << endl;
	cout << "\tBNEQZ\t%SFT, Cheat" << endl;	
	cout << "\tSUB\t%TMP1, %TMP1, %POV1" << endl;
	cout << "\tMSB\t%SFT, %TMP1" << endl;
	cout << "\tBNEQZ\t%SFT, Cheat" << endl;
	
	// proving end
    // ****************************************
	
	cout << "\tCOPYR\t" << dst << ", %POV0" << endl;
	cout << "\tJUMP\t" << ".CONV" << to_string(convid+1) << endl;

	cout << ".CONV" << to_string(convid) << " NOP" << endl;
	cout << "\tMSB\t" << dst << ", " << src0 <<endl;	

	cout << ".CONV" << to_string(convid+1) << " NOP" << endl;

	convid += 2;

	// cout << "\tUDIV\t" << dst << ", " << src0 << ", %SFT" << endl;
	
	*/	
}

void Gen_SRLI(string dst, string src0, string imm)
{
	if (imm == "31")
	{
		cout << "\tMSB\t" << dst << ", " << src0 <<endl;
		return;
	}

	cout << "\tCOPYR\t%TMP0, " << src0 << endl;
	cout << "\tCOPYI\t%TMP1, " << imm << endl;
	cout << "\tVMCALL\t6" << endl;
	
	cout << "\tINPUT\t%POV0" << endl;

	// cout << "\tPROOFSTART" << endl;
	
	//proving
	cout << "\tPOWI\t%TMP1, " << imm << endl;
	cout << "\tSUB\t%SFT, %GR0, %TMP1" << endl;

	cout << "\tAND\t%POV1, %SFT, " << src0 << endl;
	cout << "\tMUL\t%SFT, %TMP1, %POV0" << endl;
	cout << "\tSUB\t%SFT, %SFT, %POV1" << endl;
	cout << "\tBNEQZ\t%SFT, Cheat" << endl;

	cout <<"\tCOPYI\t%TMP1, 32" << endl;
	cout <<"\tSUBI\t%TMP1, %TMP1, " << imm << endl;
	cout <<"\tPOW\t%TMP1, %TMP1" << endl;
	cout <<"\tSUB\t%TMP1, %GR0, %TMP1" << endl;
	cout <<"\tXORI\t%TMP1, %TMP1, -1" << endl;

	// cout << "\tCOPYR\t" << dst << ", %POV0" << endl;
	cout << "\tAND\t" << dst << ", %POV0, %TMP1" << endl;

	// cout << "\tPROOFEND" << endl;

	/*
	cout << "\tPOWI\t%TMP1, " << imm << endl;
	cout << "\tCOPYR\t%TMP0, " << src0 << endl;
	cout << "\tVMCALL\t2" << endl;
	cout << "\tINPUT\t%BASE" << endl;
	cout << "\tINPUT\t%OFF" << endl;

    // ****************************************
	// proving begin

	// sub-prove for %TMP0 = %BASE * %TMP1 + %OFF
	cout << "\tCOPYR\t%SFT, %BASE" << endl;
	cout << "\tMUL\t%SFT, %SFT, %TMP1" << endl;
	cout << "\tADD\t%SFT, %SFT, %OFF" << endl;
	cout << "\tSUB\t%SFT, %SFT, %TMP0" << endl;
	cout << "\tBNEQZ\t%SFT, Cheat" << endl;

	// sub-prove for 0 <= %OFF < %TMP1, notice: MSB(%TMP1) == 0
	cout << "\tMSB\t%SFT, %OFF" << endl;
	cout << "\tBNEQZ\t%SFT, Cheat" << endl;	
	cout << "\tSUB\t%TMP1, %TMP1, %OFF" << endl;
	cout << "\tMSB\t%SFT, %TMP1" << endl;
	cout << "\tBNEQZ\t%SFT, Cheat" << endl;	

	// proving end
    // ****************************************
	
	cout << "\tCOPYR\t" << dst << ", %BASE" << endl;   

	// cout << "\tUDIV\t" << dst << ", " << src0 << ", %SFT" << endl;

	*/
}

void OpenAs(ifstream &fin)
{
	string inst;
	string inst_tmp;
	while (getline(fin, inst))
	{
		if (!inst.length()) continue;
		// replace(inst.begin(), inst.end(), '\t', ' ');

		inst_tmp = inst;

		bool ascii_mode = 0;
		
		for (int i = 0; i < inst.length(); i++)
		{
			if (inst[i] == '"') ascii_mode = !ascii_mode;
			if (ascii_mode) continue;
			if (inst[i] == '\t') inst[i] = ' ';
			if (inst[i] == ',') inst[i] = ' ';
			if (inst[i] == '\n') {
				inst.erase(i, 1);
				i--;
			}
		}
		
		// replace(inst.begin(), inst.end(), ',', ' ');
		// inst.erase(remove(inst.begin(), inst.end(), '\n'), inst.end());
		
		for (int i = 0; i < inst.length(); i++)
			if (inst[i] != ' ')
			{
				inst.erase(0, i);
				break;
			}
		for (int i = inst.length(); i > 0; i--)
			if (inst[i-1] != ' ')
			{
				inst.erase(i);
				break;
			}
		ascii_mode = 0;
		string init_res = "";
		for(int i = 0; inst[i] != '\0'; i++)
		{
			if (inst[i] == '"')
			// {
				ascii_mode = !ascii_mode;
			// 	init_res.append(1, inst[i]);
			// 	continue;
			// }
			if (ascii_mode)
			{
				init_res.append(1, inst[i]);
				continue;
			}
			if (inst[i] != ' ')
				init_res.append(1, inst[i]);
			else if(inst[i+1] != ' ')
				init_res.append(1, inst[i]);
		}

		if (init_res == " ") continue;
		
		// as_program.push_back(init_res);

		vector<std::string> inst_arr;
		stringstream input(init_res);
		string temp;
		while(getline(input, temp, ' '))
			inst_arr.push_back(temp);

		if (inst_arr[0] == "LOADB")	{
			std::string base, offset;
			MemExtract(inst_arr[2], base, offset);
			cout << "\tADDI\t%BASE, " << base << ", " << offset << endl;
			cout << "\tANDI\t%OFF, %BASE, 3" << endl;
			cout << "\tSUB\t%BASE, %BASE, %OFF" << endl;
			cout << "\tMULI\t%OFF, %OFF, 8" << endl;
			cout << "\tLOAD\t" << inst_arr[1] << ", 0(%BASE)" << endl;
			// cout << "\tSRL\t" << inst_arr[1] << ", " << inst_arr[1] << ", %OFF" << endl;
			Gen_SRL(inst_arr[1], inst_arr[1], "%OFF");
			cout << "\tANDI\t" << inst_arr[1] << ", " << inst_arr[1] << ", 255" << endl;
			cout << "\tANDI\t%OFF, " << inst_arr[1] << ", 128" << endl;
			// cout << "\tSHLI\t%OFF, %OFF, 1" << endl;
			Gen_SHLI("%OFF", "%OFF", "1");
			// cout << "\tCOPYI\t%MASK, 0" << endl;
			cout << "\tSUB\t%MASK, %GR0, %OFF" << endl;
			cout << "\tXOR\t" << inst_arr[1] << ", " << inst_arr[1] << ", %MASK" << endl;
		} else if (inst_arr[0] == "ULOADB")	{
			std::string base, offset;
			MemExtract(inst_arr[2], base, offset);
			cout << "\tADDI\t%BASE, " << base << ", " << offset << endl;
			cout << "\tANDI\t%OFF, %BASE, 3" << endl;
			cout << "\tSUB\t%BASE, %BASE, %OFF" << endl;
			cout << "\tMULI\t%OFF, %OFF, 8" << endl;
			cout << "\tLOAD\t" << inst_arr[1] << ", 0(%BASE)" << endl;
			// cout << "\tSRL\t" << inst_arr[1] << ", " << inst_arr[1] << ", %OFF" << endl;
			Gen_SRL(inst_arr[1], inst_arr[1], "%OFF");
			cout << "\tANDI\t" << inst_arr[1] << ", " << inst_arr[1] << ", 255" << endl;
		} else if (inst_arr[0] == "LOADH") {
			std::string base, offset;
			MemExtract(inst_arr[2], base, offset);
			cout << "\tADDI\t%BASE, " << base << ", " << offset << endl;
			cout << "\tANDI\t%OFF, %BASE, 3" << endl;
			cout << "\tSUB\t%BASE, %BASE, %OFF" << endl;
			cout << "\tMULI\t%OFF, %OFF, 8" << endl;
			cout << "\tLOAD\t" << inst_arr[1] << ", 0(%BASE)" << endl;
			// cout << "\tSRL\t" << inst_arr[1] << ", " << inst_arr[1] << ", %OFF" << endl;
			Gen_SRL(inst_arr[1], inst_arr[1], "%OFF");
			cout << "\tANDI\t" << inst_arr[1] << ", " << inst_arr[1] << ", 65535" << endl;
			cout << "\tANDI\t%OFF, " << inst_arr[1] << ", 32768" << endl;
			// cout << "\tSHLI\t%OFF, %OFF, 1" << endl;
			Gen_SHLI("%OFF", "%OFF", "1");
			// cout << "\tCOPYI\t%MASK, 0" << endl;
			cout << "\tSUB\t%MASK, %GR0, %OFF" << endl;
			cout << "\tXOR\t" << inst_arr[1] << ", " << inst_arr[1] << ", %MASK" << endl;			
		} else if (inst_arr[0] == "ULOADH") {
			std::string base, offset;
			MemExtract(inst_arr[2], base, offset);
			cout << "\tADDI\t%BASE, " << base << ", " << offset << endl;
			cout << "\tANDI\t%OFF, %BASE, 3" << endl;
			cout << "\tSUB\t%BASE, %BASE, %OFF" << endl;
			cout << "\tMULI\t%OFF, %OFF, 8" << endl;
			cout << "\tLOAD\t" << inst_arr[1] << ", 0(%BASE)" << endl;
			// cout << "\tSRL\t" << inst_arr[1] << ", " << inst_arr[1] << ", %OFF" << endl;
			Gen_SRL(inst_arr[1], inst_arr[1], "%OFF");
			cout << "\tANDI\t" << inst_arr[1] << ", " << inst_arr[1] << ", 65535" << endl;			
		} else if (inst_arr[0] == "STOREB") {
			std::string base, offset;
			MemExtract(inst_arr[2], base, offset);
			cout << "\tADDI\t%BASE, " << base << ", " << offset << endl;
			cout << "\tANDI\t%OFF, %BASE, 3" << endl;
			cout << "\tSUB\t%BASE, %BASE, %OFF" << endl;
			cout << "\tMULI\t%OFF, %OFF, 8" << endl;
			cout << "\tLOAD\t%TMP0, 0(%BASE)" << endl;

			cout << "\tCOPYI\t%MASK, 1" << endl;
			// cout << "\tSHL\t%MASK, %MASK, %OFF" << endl;
			Gen_SHL("%MASK", "%MASK", "%OFF");
			cout << "\tSUBI\t%MASK, %MASK, 1" << endl;
			cout << "\tAND\t%MASK, %TMP0, %MASK" << endl;

			// cout << "\tSRL\t%TMP0, %TMP0, %OFF" << endl;
			Gen_SRL("%TMP0", "%TMP0", "%OFF");
			cout << "\tANDI\t%TMP1, %TMP0, 255" << endl;
			cout << "\tSUB\t%TMP0, %TMP0, %TMP1" << endl;
			// cout << "\tSHL\t%TMP0, %TMP0, %OFF" << endl;
			Gen_SHL("%TMP0", "%TMP0", "%OFF");
			cout << "\tADD\t%TMP0, %TMP0, %MASK" << endl;
			
			cout << "\tANDI\t%MASK, " << inst_arr[1] << ", 255" << endl;
			// cout << "\tSHL\t%MASK, %MASK, %OFF" << endl;
			Gen_SHL("%MASK", "%MASK", "%OFF");
			cout << "\tADD\t%TMP0, %TMP0, %MASK" << endl;

			cout << "\tSTORE\t%TMP0, 0(%BASE)" << endl;			
		} else if (inst_arr[0] == "STOREH") {
			std::string base, offset;
			MemExtract(inst_arr[2], base, offset);
			cout << "\tADDI\t%BASE, " << base << ", " << offset << endl;
			cout << "\tANDI\t%OFF, %BASE, 3" << endl;
			cout << "\tSUB\t%BASE, %BASE, %OFF" << endl;
			cout << "\tMULI\t%OFF, %OFF, 8" << endl;
			cout << "\tLOAD\t%TMP0, 0(%BASE)" << endl;

			cout << "\tCOPYI\t%MASK, 1" << endl;
			// cout << "\tSHL\t%MASK, %MASK, %OFF" << endl;
			Gen_SHL("%MASK", "%MASK", "%OFF");
			cout << "\tSUBI\t%MASK, %MASK, 1" << endl;
			cout << "\tAND\t%MASK, %TMP0, %MASK" << endl;

			// cout << "\tSRL\t%TMP0, %TMP0, %OFF" << endl;
			Gen_SRL("%TMP0", "%TMP0", "%OFF");
			cout << "\tANDI\t%TMP1, %TMP0, 65535" << endl;
			cout << "\tSUB\t%TMP0, %TMP0, %TMP1" << endl;
			// cout << "\tSHL\t%TMP0, %TMP0, %OFF" << endl;
			Gen_SHL("%TMP0", "%TMP0", "%OFF");
			cout << "\tADD\t%TMP0, %TMP0, %MASK" << endl;
			
			cout << "\tANDI\t%MASK, " << inst_arr[1] << ", 65535" << endl;
			// cout << "\tSHL\t%MASK, %MASK, %OFF" << endl;
			Gen_SHL("%MASK", "%MASK", "%OFF");
			cout << "\tADD\t%TMP0, %TMP0, %MASK" << endl;

			cout << "\tSTORE\t%TMP0, 0(%BASE)" << endl;			
		} else if (inst_arr[0] == "SRAI") {
			// cout << "\tSRLI\t" << inst_arr[1] << ", " << inst_arr[2] << ", " << inst_arr[3] << endl;
			Gen_SRLI(inst_arr[1], inst_arr[2], inst_arr[3]);
			cout << "\tCOPYI\t%OFF, 31" << endl;
			cout << "\tSUBI\t%OFF, %OFF, " << inst_arr[3] << endl;
			cout << "\tCOPYI\t%MASK, 1" << endl;
			// cout << "\tSHL\t%MASK, %MASK, %OFF" << endl;
			Gen_SHL("%MASK", "%MASK", "%OFF");
			cout << "\tAND\t%MASK, %MASK, " << inst_arr[1] << endl;
			// cout << "\tCOPYI\t%OFF, 0" << endl;
			cout << "\tSUB\t%OFF, %GR0, %MASK" << endl;
			cout << "\tSUB\t" << inst_arr[1] << ", " << inst_arr[1] << ", %MASK" << endl;
			cout << "\tADD\t" << inst_arr[1] << ", " << inst_arr[1] << ", %OFF" << endl;
		} else if (inst_arr[0] == "SRA") {
			cout << "\tCOPYR\t%BASE, " << inst_arr[3] << endl;
			// cout << "\tSRL\t" << inst_arr[1] << ", " << inst_arr[2] << ", %BASE" << endl;
			Gen_SRL(inst_arr[1], inst_arr[2], "%BASE");
			cout << "\tCOPYI\t%OFF, 31" << endl;
			cout << "\tSUB\t%OFF, %OFF, %BASE" << endl;
			cout << "\tCOPYI\t%MASK, 1" << endl;
			// cout << "\tSHL\t%MASK, %MASK, %OFF" << endl;
			Gen_SHL("%MASK", "%MASK", "%OFF");
			cout << "\tAND\t%MASK, %MASK, " << inst_arr[1] << endl;
			// cout << "\tCOPYI\t%OFF, 0" << endl;
			cout << "\tSUB\t%OFF, %GR0, %MASK" << endl;
			cout << "\tSUB\t" << inst_arr[1] << ", " << inst_arr[1] << ", %MASK" << endl;
			cout << "\tADD\t" << inst_arr[1] << ", " << inst_arr[1] << ", %OFF" << endl;
		} else if (inst_arr[0] == "UDIV") {
			cout << "\tCOPYR\t%TMP0, " << inst_arr[2] << endl;
			cout << "\tCOPYR\t%TMP1, " << inst_arr[3] << endl;
			cout << "\tVMCALL\t2" << endl;
			// TMP0/TMP1 = POV0 ... POV1
			// POV0 = POV0 * 2^16 + SFT
			// TMP1 = BASE * 2^16 + OFF
			// POV1 = (SFT * OFF) >> 16 at first
			cout << "\tINPUT\t%POV0" << endl; 
			cout << "\tINPUT\t%SFT" << endl;
			cout << "\tINPUT\t%BASE" << endl;
			cout << "\tINPUT\t%OFF" << endl;
			cout << "\tINPUT\t%POV1" << endl;

			// proving not overflow first

			// cout << "\tPROOFSTART" << endl;

			// make sure POV0, SFT, BASE, OFF, POV1 < 2^16
			cout << "\tANDI\t%MASK, %POV0, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;
			cout << "\tANDI\t%MASK, %SFT, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;
			cout << "\tANDI\t%MASK, %BASE, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;
			cout << "\tANDI\t%MASK, %OFF, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;
			cout << "\tANDI\t%MASK, %POV1, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;

			// make sure TMP1 = BASE * 2^16 + OFF
			cout << "\tMULI\t%MASK, %BASE, 65536" << endl;
			cout << "\tADD\t%MASK, %MASK, %OFF" << endl;
			cout << "\tSUB\t%MASK, %MASK, %TMP1" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;

			// make sure BASE * POV0 == 0
			cout << "\tMUL\t%MASK, %BASE, %POV0" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;

			// make sure POV1 = SFT * OFF >> 16
			cout << "\tMUL\t%MASK, %SFT, %OFF" << endl;
			cout << "\tANDI\t%MASK, %MASK, -65536" << endl;
			cout << "\tMULI\t%POV2, %POV1, 65536" << endl;
			cout << "\tSUB\t%MASK, %MASK, %POV2" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;			
						
			// make sure POV0 * OFF + SFT * BASE + (SFT*OFF >> 16) < 2^16
			cout << "\tMUL\t%MASK, %POV0, %OFF" << endl;
			cout << "\tADD\t%MASK, %MASK, %POV1" << endl;
			cout << "\tANDI\t%MASK, %MASK, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;
			cout << "\tMUL\t%MASK, %SFT, %BASE" << endl;
			cout << "\tADD\t%MASK, %MASK, %POV1" << endl;
			cout << "\tANDI\t%MASK, %MASK, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;

			// get POV0 and POV1 for future usage
			cout << "\tMULI\t%POV0, %POV0, 65536" << endl;
			cout << "\tADD\t%POV0, %POV0, %SFT" << endl;
			cout << "\tINPUT\t%POV1" << endl;
			
			// here, we know TMP1 * POV0 not overflow
			// make sure TMP1 * POV0 + POV1 not overflow
			cout << "\tMUL\t%MASK, %TMP1, %POV0" << endl;
			cout << "\tMSB\t%SFT, %MASK" << endl;
			cout << "\tMSB\t%BASE, %POV1" << endl;
			cout << "\tANDI\t%MASK, %MASK, 2147483647" << endl;
			cout << "\tANDI\t%OFF, %POV1, 2147483647" << endl;
			cout << "\tADD\t%MASK, %MASK, %OFF" << endl;
			cout << "\tMSB\t%MASK, %MASK" << endl;
			cout << "\tADD\t%MASK, %MASK, %SFT" << endl;
			cout << "\tADD\t%MASK, %MASK, %BASE" << endl;
			cout << "\tANDI\t%MASK, %MASK, 2" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;

			// ****************************************
			// proving begin
	
			// sub-prove for %TMP0 = %POV0 * %TMP1 + %POV1
			cout << "\tCOPYR\t%SFT, %POV0" << endl;
			cout << "\tMUL\t%SFT, %SFT, %TMP1" << endl;
			cout << "\tADD\t%SFT, %SFT, %POV1" << endl;
			cout << "\tSUB\t%SFT, %SFT, %TMP0" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;

			// sub-prove for 0 <= %POV1 < %TMP1, to calculate ULTE %SFT, %TMP1, %POV1
			// %SFT == 1, Cheat
			cout << "\tMSB\t%BASE, %POV1" << endl;
			cout << "\tMSB\t%OFF, %TMP1" << endl;
			cout << "\tXOR\t%MASK, %BASE, %OFF" << endl;
			cout << "\tAND\t%BASE, %MASK, %OFF" << endl;
			cout << "\tSUB\t%OFF, " << "%POV1" << ", " << "%TMP1" << endl;
			cout << "\tMSB\t%OFF, %OFF" << endl;
			cout << "\tXORI\t%MASK, %MASK, 1" << endl;
			cout << "\tAND\t%OFF, %MASK, %OFF" << endl;
			cout << "\tOR\t" << "%SFT" << ", %BASE, %OFF" << endl;
			cout << "\tXORI\t" << "%SFT" << ", " << "%SFT" << ", 1" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;
						
			// proving end
			// ****************************************

			// cout << "\tPROOFEND" << endl;
			
			cout << "\tCOPYR\t" << inst_arr[1] << ", %POV0" << endl;
		} else if (inst_arr[0] == "UDIVI") {
			cout << "\tCOPYR\t%TMP0, " << inst_arr[2] << endl;
			cout << "\tCOPYI\t%TMP1, " << inst_arr[3] << endl;
			cout << "\tVMCALL\t2" << endl;

			cout << "\tINPUT\t%POV0" << endl; 
			cout << "\tINPUT\t%SFT" << endl;
			cout << "\tINPUT\t%BASE" << endl;
			cout << "\tINPUT\t%OFF" << endl;
			cout << "\tINPUT\t%POV1" << endl;

			// proving not overflow first

			// cout << "\tPROOFSTART" << endl;

			// make sure POV0, SFT, BASE, OFF, POV1 < 2^16
			cout << "\tANDI\t%MASK, %POV0, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;
			cout << "\tANDI\t%MASK, %SFT, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;
			cout << "\tANDI\t%MASK, %BASE, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;
			cout << "\tANDI\t%MASK, %OFF, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;
			cout << "\tANDI\t%MASK, %POV1, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;

			// make sure TMP1 = BASE * 2^16 + OFF
			cout << "\tMULI\t%MASK, %BASE, 65536" << endl;
			cout << "\tADD\t%MASK, %MASK, %OFF" << endl;
			cout << "\tSUB\t%MASK, %MASK, %TMP1" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;

			// make sure BASE * POV0 == 0
			cout << "\tMUL\t%MASK, %BASE, %POV0" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;

			// make sure POV1 = SFT * OFF >> 16
			cout << "\tMUL\t%MASK, %SFT, %OFF" << endl;
			cout << "\tANDI\t%MASK, %MASK, -65536" << endl;
			cout << "\tMULI\t%POV2, %POV1, 65536" << endl;
			cout << "\tSUB\t%MASK, %MASK, %POV2" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;			
						
			// make sure POV0 * OFF + SFT * BASE + (SFT*OFF >> 16) < 2^16
			cout << "\tMUL\t%MASK, %POV0, %OFF" << endl;
			cout << "\tADD\t%MASK, %MASK, %POV1" << endl;
			cout << "\tANDI\t%MASK, %MASK, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;
			cout << "\tMUL\t%MASK, %SFT, %BASE" << endl;
			cout << "\tADD\t%MASK, %MASK, %POV1" << endl;
			cout << "\tANDI\t%MASK, %MASK, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;

			// get POV0 and POV1 for future usage
			cout << "\tMULI\t%POV0, %POV0, 65536" << endl;
			cout << "\tADD\t%POV0, %POV0, %SFT" << endl;
			cout << "\tINPUT\t%POV1" << endl;
			
			// here, we know TMP1 * POV0 not overflow
			// make sure TMP1 * POV0 + POV1 not overflow
			cout << "\tMUL\t%MASK, %TMP1, %POV0" << endl;
			cout << "\tMSB\t%SFT, %MASK" << endl;
			cout << "\tMSB\t%BASE, %POV1" << endl;
			cout << "\tANDI\t%MASK, %MASK, 2147483647" << endl;
			cout << "\tANDI\t%OFF, %POV1, 2147483647" << endl;
			cout << "\tADD\t%MASK, %MASK, %OFF" << endl;
			cout << "\tMSB\t%MASK, %MASK" << endl;
			cout << "\tADD\t%MASK, %MASK, %SFT" << endl;
			cout << "\tADD\t%MASK, %MASK, %BASE" << endl;
			cout << "\tANDI\t%MASK, %MASK, 2" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;			
			
			// ****************************************
			// proving begin
	
			// sub-prove for %TMP0 = %POV0 * %TMP1 + %POV1
			cout << "\tCOPYR\t%SFT, %POV0" << endl;
			cout << "\tMUL\t%SFT, %SFT, %TMP1" << endl;
			cout << "\tADD\t%SFT, %SFT, %POV1" << endl;
			cout << "\tSUB\t%SFT, %SFT, %TMP0" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;

			// sub-prove for 0 <= %POV1 < %TMP1, to calculate ULTE %SFT, %TMP1, %POV1
			// %SFT == 1, Cheat
			cout << "\tMSB\t%BASE, %POV1" << endl;
			cout << "\tMSB\t%OFF, %TMP1" << endl;
			cout << "\tXOR\t%MASK, %BASE, %OFF" << endl;
			cout << "\tAND\t%BASE, %MASK, %OFF" << endl;
			cout << "\tSUB\t%OFF, " << "%POV1" << ", " << "%TMP1" << endl;
			cout << "\tMSB\t%OFF, %OFF" << endl;
			cout << "\tXORI\t%MASK, %MASK, 1" << endl;
			cout << "\tAND\t%OFF, %MASK, %OFF" << endl;
			cout << "\tOR\t" << "%SFT" << ", %BASE, %OFF" << endl;
			cout << "\tXORI\t" << "%SFT" << ", " << "%SFT" << ", 1" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;
						
			// proving end
			// ****************************************

			// cout << "\tPROOFEND" << endl;
			
			cout << "\tCOPYR\t" << inst_arr[1] << ", %POV0" << endl;			
		} else if (inst_arr[0] == "UREM") {
			cout << "\tCOPYR\t%TMP0, " << inst_arr[2] << endl;
			cout << "\tCOPYR\t%TMP1, " << inst_arr[3] << endl;
			cout << "\tVMCALL\t2" << endl;

			cout << "\tINPUT\t%POV0" << endl; 
			cout << "\tINPUT\t%SFT" << endl;
			cout << "\tINPUT\t%BASE" << endl;
			cout << "\tINPUT\t%OFF" << endl;
			cout << "\tINPUT\t%POV1" << endl;

			// proving not overflow first

			// cout << "\tPROOFSTART" << endl;

			// make sure POV0, SFT, BASE, OFF, POV1 < 2^16
			cout << "\tANDI\t%MASK, %POV0, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;
			cout << "\tANDI\t%MASK, %SFT, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;
			cout << "\tANDI\t%MASK, %BASE, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;
			cout << "\tANDI\t%MASK, %OFF, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;
			cout << "\tANDI\t%MASK, %POV1, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;

			// make sure TMP1 = BASE * 2^16 + OFF
			cout << "\tMULI\t%MASK, %BASE, 65536" << endl;
			cout << "\tADD\t%MASK, %MASK, %OFF" << endl;
			cout << "\tSUB\t%MASK, %MASK, %TMP1" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;

			// make sure BASE * POV0 == 0
			cout << "\tMUL\t%MASK, %BASE, %POV0" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;

			// make sure POV1 = SFT * OFF >> 16
			cout << "\tMUL\t%MASK, %SFT, %OFF" << endl;
			cout << "\tANDI\t%MASK, %MASK, -65536" << endl;
			cout << "\tMULI\t%POV2, %POV1, 65536" << endl;
			cout << "\tSUB\t%MASK, %MASK, %POV2" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;			
						
			// make sure POV0 * OFF + SFT * BASE + (SFT*OFF >> 16) < 2^16
			cout << "\tMUL\t%MASK, %POV0, %OFF" << endl;
			cout << "\tADD\t%MASK, %MASK, %POV1" << endl;
			cout << "\tANDI\t%MASK, %MASK, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;
			cout << "\tMUL\t%MASK, %SFT, %BASE" << endl;
			cout << "\tADD\t%MASK, %MASK, %POV1" << endl;
			cout << "\tANDI\t%MASK, %MASK, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;

			// get POV0 and POV1 for future usage
			cout << "\tMULI\t%POV0, %POV0, 65536" << endl;
			cout << "\tADD\t%POV0, %POV0, %SFT" << endl;
			cout << "\tINPUT\t%POV1" << endl;
			
			// here, we know TMP1 * POV0 not overflow
			// make sure TMP1 * POV0 + POV1 not overflow
			cout << "\tMUL\t%MASK, %TMP1, %POV0" << endl;
			cout << "\tMSB\t%SFT, %MASK" << endl;
			cout << "\tMSB\t%BASE, %POV1" << endl;
			cout << "\tANDI\t%MASK, %MASK, 2147483647" << endl;
			cout << "\tANDI\t%OFF, %POV1, 2147483647" << endl;
			cout << "\tADD\t%MASK, %MASK, %OFF" << endl;
			cout << "\tMSB\t%MASK, %MASK" << endl;
			cout << "\tADD\t%MASK, %MASK, %SFT" << endl;
			cout << "\tADD\t%MASK, %MASK, %BASE" << endl;
			cout << "\tANDI\t%MASK, %MASK, 2" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;			
			
			// ****************************************
			// proving begin
	
			// sub-prove for %TMP0 = %POV0 * %TMP1 + %POV1
			cout << "\tCOPYR\t%SFT, %POV0" << endl;
			cout << "\tMUL\t%SFT, %SFT, %TMP1" << endl;
			cout << "\tADD\t%SFT, %SFT, %POV1" << endl;
			cout << "\tSUB\t%SFT, %SFT, %TMP0" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;

			// sub-prove for 0 <= %POV1 < %TMP1, to calculate ULTE %SFT, %TMP1, %POV1
			// %SFT == 1, Cheat
			cout << "\tMSB\t%BASE, %POV1" << endl;
			cout << "\tMSB\t%OFF, %TMP1" << endl;
			cout << "\tXOR\t%MASK, %BASE, %OFF" << endl;
			cout << "\tAND\t%BASE, %MASK, %OFF" << endl;
			cout << "\tSUB\t%OFF, " << "%POV1" << ", " << "%TMP1" << endl;
			cout << "\tMSB\t%OFF, %OFF" << endl;
			cout << "\tXORI\t%MASK, %MASK, 1" << endl;
			cout << "\tAND\t%OFF, %MASK, %OFF" << endl;
			cout << "\tOR\t" << "%SFT" << ", %BASE, %OFF" << endl;
			cout << "\tXORI\t" << "%SFT" << ", " << "%SFT" << ", 1" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;
						
			// proving end
			// ****************************************

			// cout << "\tPROOFEND" << endl;
			
			cout << "\tCOPYR\t" << inst_arr[1] << ", %POV1" << endl;
		} else if (inst_arr[0] == "UREMI") {
			cout << "\tCOPYR\t%TMP0, " << inst_arr[2] << endl;
			cout << "\tCOPYI\t%TMP1, " << inst_arr[3] << endl;
			cout << "\tVMCALL\t2" << endl;

			cout << "\tINPUT\t%POV0" << endl; 
			cout << "\tINPUT\t%SFT" << endl;
			cout << "\tINPUT\t%BASE" << endl;
			cout << "\tINPUT\t%OFF" << endl;
			cout << "\tINPUT\t%POV1" << endl;

			// proving not overflow first

			// cout << "\tPROOFSTART" << endl;

			// make sure POV0, SFT, BASE, OFF, POV1 < 2^16
			cout << "\tANDI\t%MASK, %POV0, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;
			cout << "\tANDI\t%MASK, %SFT, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;
			cout << "\tANDI\t%MASK, %BASE, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;
			cout << "\tANDI\t%MASK, %OFF, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;
			cout << "\tANDI\t%MASK, %POV1, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;

			// make sure TMP1 = BASE * 2^16 + OFF
			cout << "\tMULI\t%MASK, %BASE, 65536" << endl;
			cout << "\tADD\t%MASK, %MASK, %OFF" << endl;
			cout << "\tSUB\t%MASK, %MASK, %TMP1" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;

			// make sure BASE * POV0 == 0
			cout << "\tMUL\t%MASK, %BASE, %POV0" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;

			// make sure POV1 = SFT * OFF >> 16
			cout << "\tMUL\t%MASK, %SFT, %OFF" << endl;
			cout << "\tANDI\t%MASK, %MASK, -65536" << endl;
			cout << "\tMULI\t%POV2, %POV1, 65536" << endl;
			cout << "\tSUB\t%MASK, %MASK, %POV2" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;			
						
			// make sure POV0 * OFF + SFT * BASE + (SFT*OFF >> 16) < 2^16
			cout << "\tMUL\t%MASK, %POV0, %OFF" << endl;
			cout << "\tADD\t%MASK, %MASK, %POV1" << endl;
			cout << "\tANDI\t%MASK, %MASK, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;
			cout << "\tMUL\t%MASK, %SFT, %BASE" << endl;
			cout << "\tADD\t%MASK, %MASK, %POV1" << endl;
			cout << "\tANDI\t%MASK, %MASK, -65536" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;

			// get POV0 and POV1 for future usage
			cout << "\tMULI\t%POV0, %POV0, 65536" << endl;
			cout << "\tADD\t%POV0, %POV0, %SFT" << endl;
			cout << "\tINPUT\t%POV1" << endl;
			
			// here, we know TMP1 * POV0 not overflow
			// make sure TMP1 * POV0 + POV1 not overflow
			cout << "\tMUL\t%MASK, %TMP1, %POV0" << endl;
			cout << "\tMSB\t%SFT, %MASK" << endl;
			cout << "\tMSB\t%BASE, %POV1" << endl;
			cout << "\tANDI\t%MASK, %MASK, 2147483647" << endl;
			cout << "\tANDI\t%OFF, %POV1, 2147483647" << endl;
			cout << "\tADD\t%MASK, %MASK, %OFF" << endl;
			cout << "\tMSB\t%MASK, %MASK" << endl;
			cout << "\tADD\t%MASK, %MASK, %SFT" << endl;
			cout << "\tADD\t%MASK, %MASK, %BASE" << endl;
			cout << "\tANDI\t%MASK, %MASK, 2" << endl;
			cout << "\tBNEQZ\t%MASK, Cheat" << endl;			
			
			// ****************************************
			// proving begin
	
			// sub-prove for %TMP0 = %POV0 * %TMP1 + %POV1
			cout << "\tCOPYR\t%SFT, %POV0" << endl;
			cout << "\tMUL\t%SFT, %SFT, %TMP1" << endl;
			cout << "\tADD\t%SFT, %SFT, %POV1" << endl;
			cout << "\tSUB\t%SFT, %SFT, %TMP0" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;

			// sub-prove for 0 <= %POV1 < %TMP1, to calculate ULTE %SFT, %TMP1, %POV1
			// %SFT == 1, Cheat
			cout << "\tMSB\t%BASE, %POV1" << endl;
			cout << "\tMSB\t%OFF, %TMP1" << endl;
			cout << "\tXOR\t%MASK, %BASE, %OFF" << endl;
			cout << "\tAND\t%BASE, %MASK, %OFF" << endl;
			cout << "\tSUB\t%OFF, " << "%POV1" << ", " << "%TMP1" << endl;
			cout << "\tMSB\t%OFF, %OFF" << endl;
			cout << "\tXORI\t%MASK, %MASK, 1" << endl;
			cout << "\tAND\t%OFF, %MASK, %OFF" << endl;
			cout << "\tOR\t" << "%SFT" << ", %BASE, %OFF" << endl;
			cout << "\tXORI\t" << "%SFT" << ", " << "%SFT" << ", 1" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;
						
			// proving end
			// ****************************************

			// cout << "\tPROOFEND" << endl;
			
			cout << "\tCOPYR\t" << inst_arr[1] << ", %POV1" << endl;			
		} else if (inst_arr[0] == "SDIV") {
			std::cerr << "WRONG SDIV!" << std::endl;
			exit(-1);
			cout << "\tCOPYR\t%TMP0, " << inst_arr[2] << endl;
			cout << "\tCOPYR\t%TMP1, " << inst_arr[3] << endl;
			cout << "\tVMCALL\t3" << endl;
			cout << "\tINPUT\t%POV0" << endl;
			cout << "\tINPUT\t%POV1" << endl;

			// ****************************************
			// proving begin

			// cout << "\tPROOFSTART" << endl;
	
			// sub-prove for %TMP0 = %POV0 * %TMP1 + %POV1
			cout << "\tCOPYR\t%SFT, %POV0" << endl;
			cout << "\tMUL\t%SFT, %SFT, %TMP1" << endl;
			cout << "\tADD\t%SFT, %SFT, %POV1" << endl;
			cout << "\tSUB\t%SFT, %SFT, %TMP0" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;

			// if %POV1 == 0, obviously, correct, branch to this proof end
			cout << "\tEQZ\t%SFT, %POV1" << endl;
			cout << "\tBNEQZ\t%SFT, " << ".CONV" << to_string(convid+1) << endl;

			// check if MSB(%POV1) == MSB(%TMP0) according to C99 standard
			cout << "\tMSB\t%SFT, %TMP0" << endl;
			cout << "\tMSB\t%MASK, %POV1" << endl;
			cout << "\tSUB\t%SFT, %SFT, %MASK" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;

			// sub-prove for -|%TMP1| < %POV1 < |%TMP1|
			cout << "\tMSB\t%MASK, %TMP1" << endl;
			cout << "\tBNEQZ\t%MASK, " << ".CONV" << to_string(convid) << endl;

			// %TMP1 > 0
			// sub-sub-prove %POV1 < %TMP1, set %MASK = %TMP1, calculate %SFT = %MASK <= %POV1
			// LTE %SFT, %MASK, %POV1
			cout << "\tCOPYR\t%MASK, %TMP1" << endl;
			cout << "\tSUB\t%BASE, " << "%POV1" << ", " << "%MASK" << endl;
			cout << "\tMSB\t" << "%SFT" << ", %BASE" << endl;
			cout << "\tXORI\t" << "%SFT" << ", " << "%SFT" << ", 1" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;			
			// sub-sub-prove %POV1 > -%TMP1, set %MASK = -%TMP1, calculate %SFT = %POV1 <= %MASK
			// LTE %SFT, %POV1, %MASK
			// cout << "\tCOPYI\t%MASK, 0" << endl;
			cout << "\tSUB\t%MASK, %GR0, %TMP1" << endl;
			cout << "\tSUB\t%BASE, " << "%MASK" << ", " << "%POV1" << endl;
			cout << "\tMSB\t" << "%SFT" << ", %BASE" << endl;
			cout << "\tXORI\t" << "%SFT" << ", " << "%SFT" << ", 1" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;
			// goto proving end
			cout << "\tJUMP\t" << ".CONV" << to_string(convid+1) << endl;			
			
			// %TMP1 < 0
			cout << ".CONV" << to_string(convid) << " NOP" << endl;

			// sub-sub-prove %POV1 > %TMP1, set %MASK = %TMP1, calculate %SFT = %POV1 <= %MASK
			// LTE %SFT, %POV1, %MASK
			cout << "\tCOPYR\t%MASK, %TMP1" << endl;
			cout << "\tSUB\t%BASE, " << "%MASK" << ", " << "%POV1" << endl;
			cout << "\tMSB\t" << "%SFT" << ", %BASE" << endl;
			cout << "\tXORI\t" << "%SFT" << ", " << "%SFT" << ", 1" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;			
			// sub-sub-prove %POV1 < -%TMP1, set %MASK = -%TMP1, calculate %SFT = %MASK <= %POV1
			// LTE %SFT, %MASK, %POV1
			// cout << "\tCOPYI\t%MASK, 0" << endl;
			cout << "\tSUB\t%MASK, %GR0, %TMP1" << endl;
			cout << "\tSUB\t%BASE, " << "%POV1" << ", " << "%MASK" << endl;
			cout << "\tMSB\t" << "%SFT" << ", %BASE" << endl;
			cout << "\tXORI\t" << "%SFT" << ", " << "%SFT" << ", 1" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;
			
			cout << ".CONV" << to_string(convid+1) << " NOP" << endl;

			convid += 2;
			// proving end
			// ****************************************

			// cout << "\tPROOFEND" << endl;
			
			cout << "\tCOPYR\t" << inst_arr[1] << ", %POV0" << endl;
		} else if (inst_arr[0] == "SDIVI") {
			std::cerr << "WRONG SDIV!" << std::endl;
			exit(-1);
			cout << "\tCOPYR\t%TMP0, " << inst_arr[2] << endl;
			cout << "\tCOPYI\t%TMP1, " << inst_arr[3] << endl;
			cout << "\tVMCALL\t3" << endl;
			cout << "\tINPUT\t%POV0" << endl;
			cout << "\tINPUT\t%POV1" << endl;

			// ****************************************
			// proving begin

			// cout << "\tPROOFSTART" << endl;
	
			// sub-prove for %TMP0 = %POV0 * %TMP1 + %POV1
			cout << "\tCOPYR\t%SFT, %POV0" << endl;
			cout << "\tMUL\t%SFT, %SFT, %TMP1" << endl;
			cout << "\tADD\t%SFT, %SFT, %POV1" << endl;
			cout << "\tSUB\t%SFT, %SFT, %TMP0" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;

			// if %POV1 == 0, obviously, correct, branch to this proof end
			cout << "\tEQZ\t%SFT, %POV1" << endl;
			cout << "\tBNEQZ\t%SFT, " << ".CONV" << to_string(convid+1) << endl;

			// check if MSB(%POV1) == MSB(%TMP0) according to C99 standard
			cout << "\tMSB\t%SFT, %TMP0" << endl;
			cout << "\tMSB\t%MASK, %POV1" << endl;
			cout << "\tSUB\t%SFT, %SFT, %MASK" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;

			// sub-prove for -|%TMP1| < %POV1 < |%TMP1|
			cout << "\tMSB\t%MASK, %TMP1" << endl;
			cout << "\tBNEQZ\t%MASK, " << ".CONV" << to_string(convid) << endl;

			// %TMP1 > 0
			// sub-sub-prove %POV1 < %TMP1, set %MASK = %TMP1, calculate %SFT = %MASK <= %POV1
			// LTE %SFT, %MASK, %POV1
			cout << "\tCOPYR\t%MASK, %TMP1" << endl;
			cout << "\tSUB\t%BASE, " << "%POV1" << ", " << "%MASK" << endl;
			cout << "\tMSB\t" << "%SFT" << ", %BASE" << endl;
			cout << "\tXORI\t" << "%SFT" << ", " << "%SFT" << ", 1" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;			
			// sub-sub-prove %POV1 > -%TMP1, set %MASK = -%TMP1, calculate %SFT = %POV1 <= %MASK
			// LTE %SFT, %POV1, %MASK
			// cout << "\tCOPYI\t%MASK, 0" << endl;
			cout << "\tSUB\t%MASK, %GR0, %TMP1" << endl;
			cout << "\tSUB\t%BASE, " << "%MASK" << ", " << "%POV1" << endl;
			cout << "\tMSB\t" << "%SFT" << ", %BASE" << endl;
			cout << "\tXORI\t" << "%SFT" << ", " << "%SFT" << ", 1" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;
			// goto proving end
			cout << "\tJUMP\t" << ".CONV" << to_string(convid+1) << endl;			
			
			// %TMP1 < 0
			cout << ".CONV" << to_string(convid) << " NOP" << endl;

			// sub-sub-prove %POV1 > %TMP1, set %MASK = %TMP1, calculate %SFT = %POV1 <= %MASK
			// LTE %SFT, %POV1, %MASK
			cout << "\tCOPYR\t%MASK, %TMP1" << endl;
			cout << "\tSUB\t%BASE, " << "%MASK" << ", " << "%POV1" << endl;
			cout << "\tMSB\t" << "%SFT" << ", %BASE" << endl;
			cout << "\tXORI\t" << "%SFT" << ", " << "%SFT" << ", 1" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;			
			// sub-sub-prove %POV1 < -%TMP1, set %MASK = -%TMP1, calculate %SFT = %MASK <= %POV1
			// LTE %SFT, %MASK, %POV1
			// cout << "\tCOPYI\t%MASK, 0" << endl;
			cout << "\tSUB\t%MASK, %GR0, %TMP1" << endl;
			cout << "\tSUB\t%BASE, " << "%POV1" << ", " << "%MASK" << endl;
			cout << "\tMSB\t" << "%SFT" << ", %BASE" << endl;
			cout << "\tXORI\t" << "%SFT" << ", " << "%SFT" << ", 1" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;
			
			cout << ".CONV" << to_string(convid+1) << " NOP" << endl;
			convid += 2;
			// proving end
			// ****************************************

			// cout << "\tPROOFEND" << endl;
			
			cout << "\tCOPYR\t" << inst_arr[1] << ", %POV0" << endl;			
		} else if (inst_arr[0] == "SREM") {
			std::cerr << "WRONG SREM!" << std::endl;
			exit(-1);
			cout << "\tCOPYR\t%TMP0, " << inst_arr[2] << endl;
			cout << "\tCOPYR\t%TMP1, " << inst_arr[3] << endl;
			cout << "\tVMCALL\t3" << endl;
			cout << "\tINPUT\t%POV0" << endl;
			cout << "\tINPUT\t%POV1" << endl;

			// ****************************************
			// proving begin

			// cout << "\tPROOFSTART" << endl;
	
			// sub-prove for %TMP0 = %POV0 * %TMP1 + %POV1
			cout << "\tCOPYR\t%SFT, %POV0" << endl;
			cout << "\tMUL\t%SFT, %SFT, %TMP1" << endl;
			cout << "\tADD\t%SFT, %SFT, %POV1" << endl;
			cout << "\tSUB\t%SFT, %SFT, %TMP0" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;

			// if %POV1 == 0, obviously, correct, branch to this proof end
			cout << "\tEQZ\t%SFT, %POV1" << endl;
			cout << "\tBNEQZ\t%SFT, " << ".CONV" << to_string(convid+1) << endl;

			// check if MSB(%POV1) == MSB(%TMP0) according to C99 standard
			cout << "\tMSB\t%SFT, %TMP0" << endl;
			cout << "\tMSB\t%MASK, %POV1" << endl;
			cout << "\tSUB\t%SFT, %SFT, %MASK" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;

			// sub-prove for -|%TMP1| < %POV1 < |%TMP1|
			cout << "\tMSB\t%MASK, %TMP1" << endl;
			cout << "\tBNEQZ\t%MASK, " << ".CONV" << to_string(convid) << endl;

			// %TMP1 > 0
			// sub-sub-prove %POV1 < %TMP1, set %MASK = %TMP1, calculate %SFT = %MASK <= %POV1
			// LTE %SFT, %MASK, %POV1
			cout << "\tCOPYR\t%MASK, %TMP1" << endl;
			cout << "\tSUB\t%BASE, " << "%POV1" << ", " << "%MASK" << endl;
			cout << "\tMSB\t" << "%SFT" << ", %BASE" << endl;
			cout << "\tXORI\t" << "%SFT" << ", " << "%SFT" << ", 1" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;			
			// sub-sub-prove %POV1 > -%TMP1, set %MASK = -%TMP1, calculate %SFT = %POV1 <= %MASK
			// LTE %SFT, %POV1, %MASK
			// cout << "\tCOPYI\t%MASK, 0" << endl;
			cout << "\tSUB\t%MASK, %GR0, %TMP1" << endl;
			cout << "\tSUB\t%BASE, " << "%MASK" << ", " << "%POV1" << endl;
			cout << "\tMSB\t" << "%SFT" << ", %BASE" << endl;
			cout << "\tXORI\t" << "%SFT" << ", " << "%SFT" << ", 1" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;
			// goto proving end
			cout << "\tJUMP\t" << ".CONV" << to_string(convid+1) << endl;			
			
			// %TMP1 < 0
			cout << ".CONV" << to_string(convid) << " NOP" << endl;

			// sub-sub-prove %POV1 > %TMP1, set %MASK = %TMP1, calculate %SFT = %POV1 <= %MASK
			// LTE %SFT, %POV1, %MASK
			cout << "\tCOPYR\t%MASK, %TMP1" << endl;
			cout << "\tSUB\t%BASE, " << "%MASK" << ", " << "%POV1" << endl;
			cout << "\tMSB\t" << "%SFT" << ", %BASE" << endl;
			cout << "\tXORI\t" << "%SFT" << ", " << "%SFT" << ", 1" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;			
			// sub-sub-prove %POV1 < -%TMP1, set %MASK = -%TMP1, calculate %SFT = %MASK <= %POV1
			// LTE %SFT, %MASK, %POV1
			// cout << "\tCOPYI\t%MASK, 0" << endl;
			cout << "\tSUB\t%MASK, %GR0, %TMP1" << endl;
			cout << "\tSUB\t%BASE, " << "%POV1" << ", " << "%MASK" << endl;
			cout << "\tMSB\t" << "%SFT" << ", %BASE" << endl;
			cout << "\tXORI\t" << "%SFT" << ", " << "%SFT" << ", 1" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;
			
			cout << ".CONV" << to_string(convid+1) << " NOP" << endl;
			convid += 2;
			// proving end
			// ****************************************

			// cout << "\tPROOFEND" << endl;
			
			cout << "\tCOPYR\t" << inst_arr[1] << ", %POV1" << endl;
		} else if (inst_arr[0] == "SREMI") {
			std::cerr << "WRONG SREM!" << std::endl;
			exit(-1);
			cout << "\tCOPYR\t%TMP0, " << inst_arr[2] << endl;
			cout << "\tCOPYI\t%TMP1, " << inst_arr[3] << endl;
			cout << "\tVMCALL\t3" << endl;
			cout << "\tINPUT\t%POV0" << endl;
			cout << "\tINPUT\t%POV1" << endl;

			// ****************************************
			// proving begin

			// cout << "\tPROOFSTART" << endl;
	
			// sub-prove for %TMP0 = %POV0 * %TMP1 + %POV1
			cout << "\tCOPYR\t%SFT, %POV0" << endl;
			cout << "\tMUL\t%SFT, %SFT, %TMP1" << endl;
			cout << "\tADD\t%SFT, %SFT, %POV1" << endl;
			cout << "\tSUB\t%SFT, %SFT, %TMP0" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;

			// if %POV1 == 0, obviously, correct, branch to this proof end
			cout << "\tEQZ\t%SFT, %POV1" << endl;
			cout << "\tBNEQZ\t%SFT, " << ".CONV" << to_string(convid+1) << endl;

			// check if MSB(%POV1) == MSB(%TMP0) according to C99 standard
			cout << "\tMSB\t%SFT, %TMP0" << endl;
			cout << "\tMSB\t%MASK, %POV1" << endl;
			cout << "\tSUB\t%SFT, %SFT, %MASK" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;

			// sub-prove for -|%TMP1| < %POV1 < |%TMP1|
			cout << "\tMSB\t%MASK, %TMP1" << endl;
			cout << "\tBNEQZ\t%MASK, " << ".CONV" << to_string(convid) << endl;

			// %TMP1 > 0
			// sub-sub-prove %POV1 < %TMP1, set %MASK = %TMP1, calculate %SFT = %MASK <= %POV1
			// LTE %SFT, %MASK, %POV1
			cout << "\tCOPYR\t%MASK, %TMP1" << endl;
			cout << "\tSUB\t%BASE, " << "%POV1" << ", " << "%MASK" << endl;
			cout << "\tMSB\t" << "%SFT" << ", %BASE" << endl;
			cout << "\tXORI\t" << "%SFT" << ", " << "%SFT" << ", 1" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;			
			// sub-sub-prove %POV1 > -%TMP1, set %MASK = -%TMP1, calculate %SFT = %POV1 <= %MASK
			// LTE %SFT, %POV1, %MASK
			// cout << "\tCOPYI\t%MASK, 0" << endl;
			cout << "\tSUB\t%MASK, %GR0, %TMP1" << endl;
			cout << "\tSUB\t%BASE, " << "%MASK" << ", " << "%POV1" << endl;
			cout << "\tMSB\t" << "%SFT" << ", %BASE" << endl;
			cout << "\tXORI\t" << "%SFT" << ", " << "%SFT" << ", 1" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;
			// goto proving end
			cout << "\tJUMP\t" << ".CONV" << to_string(convid+1) << endl;			
			
			// %TMP1 < 0
			cout << ".CONV" << to_string(convid) << " NOP" << endl;

			// sub-sub-prove %POV1 > %TMP1, set %MASK = %TMP1, calculate %SFT = %POV1 <= %MASK
			// LTE %SFT, %POV1, %MASK
			cout << "\tCOPYR\t%MASK, %TMP1" << endl;
			cout << "\tSUB\t%BASE, " << "%MASK" << ", " << "%POV1" << endl;
			cout << "\tMSB\t" << "%SFT" << ", %BASE" << endl;
			cout << "\tXORI\t" << "%SFT" << ", " << "%SFT" << ", 1" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;			
			// sub-sub-prove %POV1 < -%TMP1, set %MASK = -%TMP1, calculate %SFT = %MASK <= %POV1
			// LTE %SFT, %MASK, %POV1
			// cout << "\tCOPYI\t%MASK, 0" << endl;
			cout << "\tSUB\t%MASK, %GR0, %TMP1" << endl;
			cout << "\tSUB\t%BASE, " << "%POV1" << ", " << "%MASK" << endl;
			cout << "\tMSB\t" << "%SFT" << ", %BASE" << endl;
			cout << "\tXORI\t" << "%SFT" << ", " << "%SFT" << ", 1" << endl;
			cout << "\tBNEQZ\t%SFT, Cheat" << endl;
			
			cout << ".CONV" << to_string(convid+1) << " NOP" << endl;
			convid += 2;
			// proving end
			// ****************************************

			// cout << "\tPROOFEND" << endl;
			
			cout << "\tCOPYR\t" << inst_arr[1] << ", %POV1" << endl;			
		} else if (inst_arr[0] == "EQ") {
			cout << "\tSUB\t%TMP0, " << inst_arr[2] << ", " << inst_arr[3] << endl;
			cout << "\tEQZ\t" << inst_arr[1] << ", %TMP0" << endl;
		} else if (inst_arr[0] == "NEQ") {
			cout << "\tSUB\t%TMP0, " << inst_arr[2] << ", " << inst_arr[3] << endl;
			cout << "\tEQZ\t" << inst_arr[1] << ", %TMP0" << endl;
			cout << "\tXORI\t" << inst_arr[1] << ", " << inst_arr[1] << ", 1" << endl;
		} else if (inst_arr[0] == "LT") {
			cout << "\tMSB\t%TMP0, " << inst_arr[2] << endl;
			cout << "\tMSB\t%TMP1, " << inst_arr[3] << endl;
			cout << "\tXOR\t%MASK, %TMP0, %TMP1" << endl;
			cout << "\tSUB\t%TMP1, " << inst_arr[2] << ", " << inst_arr[3] << endl;
			cout << "\tMSB\t%TMP1, %TMP1" << endl;
			cout << "\tXORI\t%OFF, %MASK, 1" << endl;
			cout << "\tMUL\t%MASK, %MASK, %TMP0" << endl;
			cout << "\tMUL\t%OFF, %OFF, %TMP1" << endl;
			cout << "\tADD\t" << inst_arr[1] << ", %MASK, %OFF" << endl;
		} else if (inst_arr[0] == "LTE") {
			cout << "\tMSB\t%TMP0, " << inst_arr[3] << endl;
			cout << "\tMSB\t%TMP1, " << inst_arr[2] << endl;
			cout << "\tXOR\t%MASK, %TMP0, %TMP1" << endl;
			cout << "\tSUB\t%TMP1, " << inst_arr[3] << ", " << inst_arr[2] << endl;
			cout << "\tMSB\t%TMP1, %TMP1" << endl;
			cout << "\tXORI\t%OFF, %MASK, 1" << endl;
			cout << "\tMUL\t%MASK, %MASK, %TMP0" << endl;
			cout << "\tMUL\t%OFF, %OFF, %TMP1" << endl;
			cout << "\tADD\t" << inst_arr[1] << ", %MASK, %OFF" << endl;
			cout << "\tXORI\t" << inst_arr[1] << ", " << inst_arr[1] << ", 1" << endl;
		} else if (inst_arr[0] == "ULT") {
			cout << "\tMSB\t%TMP0, " << inst_arr[2] << endl;
			cout << "\tMSB\t%TMP1, " << inst_arr[3] << endl;
			cout << "\tXOR\t%MASK, %TMP0, %TMP1" << endl;
			cout << "\tAND\t%TMP0, %MASK, %TMP1" << endl;
			cout << "\tSUB\t%TMP1, " << inst_arr[2] << ", " << inst_arr[3] << endl;
			cout << "\tMSB\t%TMP1, %TMP1" << endl;
			cout << "\tXORI\t%MASK, %MASK, 1" << endl;
			cout << "\tAND\t%TMP1, %MASK, %TMP1" << endl;
			cout << "\tOR\t" << inst_arr[1] << ", %TMP0, %TMP1" << endl;
		} else if (inst_arr[0] == "ULTE") {
			cout << "\tMSB\t%TMP0, " << inst_arr[3] << endl;
			cout << "\tMSB\t%TMP1, " << inst_arr[2] << endl;
			cout << "\tXOR\t%MASK, %TMP0, %TMP1" << endl;
			cout << "\tAND\t%TMP0, %MASK, %TMP1" << endl;
			cout << "\tSUB\t%TMP1, " << inst_arr[3] << ", " << inst_arr[2] << endl;
			cout << "\tMSB\t%TMP1, %TMP1" << endl;
			cout << "\tXORI\t%MASK, %MASK, 1" << endl;
			cout << "\tAND\t%TMP1, %MASK, %TMP1" << endl;
			cout << "\tOR\t" << inst_arr[1] << ", %TMP0, %TMP1" << endl;
			cout << "\tXORI\t" << inst_arr[1] << ", " << inst_arr[1] << ", 1" << endl;
		} else if (inst_arr[0] == "RET") {
			cout << "\tJUMPR\t%RA" << endl;
		} else if (inst_arr[0] == "CALL") {
			cout << "\tPC\t%RA, 2" << endl;
			cout << "\tJUMP\t" << inst_arr[1]<< endl;
		} else if (inst_arr[0] == "CALLR") {
			cout << "\tPC\t%RA, 2" << endl;
			cout << "\tJUMPR\t" << inst_arr[1]<< endl;
		} else if (inst_arr[0] == "SHL") {
			Gen_SHL(inst_arr[1], inst_arr[2], inst_arr[3]);
		} else if (inst_arr[0] == "SHLI") {
			Gen_SHLI(inst_arr[1], inst_arr[2], inst_arr[3]);
		} else if (inst_arr[0] == "SRL") {
			Gen_SRL(inst_arr[1], inst_arr[2], inst_arr[3]);
		} else if (inst_arr[0] == "SRLI") {
			Gen_SRLI(inst_arr[1], inst_arr[2], inst_arr[3]);
		// } else if (inst_arr[0] == "LOAD") {
		// 	std::string base, offset;
		// 	MemExtract(inst_arr[2], base, offset);
		// 	// if (offset[0] == '-')
		// 	// {
		// 	cout << "\tADDI\t%TMP0, " << base << ", " << offset << endl;
		// 	cout << "\tLOAD\t" << inst_arr[1] << ", " << "0(%TMP0)" <<endl;
		// 	// }
		// 	// else
		// 	// 	cout << inst_tmp << endl;			   
		// } else if (inst_arr[0] == "STORE") {
		// 	std::string base, offset;
		// 	MemExtract(inst_arr[2], base, offset);
		// 	// if (offset[0] == '-')
		// 	// {
		// 	cout << "\tADDI\t%TMP0, " << base << ", " << offset << endl;
		// 	cout << "\tSTORE\t" << inst_arr[1] << ", " << "0(%TMP0)" <<endl;
		// 	// }
		// 	// else
		// 	// 	cout << inst_tmp << endl;			   			
		} else {
			cout << inst_tmp << endl;
		}
	}
}

void Pass()
{
	bool text_or_data = 0;
	int offset = 0;
	int global_var_offset = 4; // avoid starting from 0(null?)
	int as_length = as_program.size();
	for (int i = 0; i < as_length; i++)
	{
		string inst = as_program[i];
		vector<std::string> inst_arr;
		stringstream input(inst);
		string temp;
		while(getline(input, temp, ' '))
			inst_arr.push_back(temp);

		if (inst_arr[0] == "LOADB")
		{
			cout << as_program[i] << endl;
		}
		else
			cout << as_program[i] << endl;
	}
}

int main(int argc, char ** argv)
{
	if (argc < 2)
	{
		std::cerr << "Usage: " << argv[0] << " <as_program>\n";
		std::exit(1);		
	}

	as_program.clear();
	hex_program.clear();
	data_program.clear();
	label2pos.clear();
	global_var.clear();

	data_program.push_back(0);
	data_program.push_back(0);
	data_program.push_back(0);
	data_program.push_back(0);
  
	string fullname = string(argv[1]);
	size_t lastindex = fullname.find_last_of("."); 
	string filename = fullname.substr(0, lastindex);

	ifstream fin(argv[1]);
	OpenAs(fin);
	fin.close();
	// Pass();
	return 0;
}

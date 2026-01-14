#include "as2hex.h"
#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <algorithm>
#include <cstring>
#include <sstream>
#include <iomanip>
#include <vector>
#include <map>

using namespace std;

vector<string> as_program;
vector<uint32_t> hex_program;
map<string, uint32_t> label2pos;

void OpenAs()
{
	/* hex header*/
	as_program.push_back("CALL main");
	as_program.push_back("RET");
	
	string inst;
	while (getline(cin, inst))
	{

		replace(inst.begin(), inst.end(), '\t', ' ');
		replace(inst.begin(), inst.end(), ',', ' ');
		inst.erase(remove(inst.begin(), inst.end(), '\n'), inst.end());
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
		string init_res = "";
		for(int i = 0; inst[i] != '\0'; i++)
		{
			if(inst[i] != ' ' )
				init_res.append(1, inst[i]);
			else
				if(inst[i+1] != ' ')
					init_res.append(1, inst[i]);
		}

		if (init_res == " ") continue;
		
		as_program.push_back(init_res);
	}
}

void Pass(int phase)
{
	int offset = 0;
	int as_length = as_program.size();
	for (int i = 0; i < as_length; i++)
	{
		string inst = as_program[i];
		vector<std::string> inst_arr;
		stringstream input(inst);
		string temp;
		while(getline(input, temp, ' '))
			inst_arr.push_back(temp);

		if (phase == 1) {			
			
			if (inst_arr.size() > 1 && inst_arr[1] == "NOP") // write to label2pos table
			{
				label2pos[inst_arr[0]] = offset;
				continue;
			}

			if (inst[0] == '.' || inst[0] == ';') continue;

			offset++;
			
		} else if (phase == 2) {
			
			if (inst_arr.size() > 1 && inst_arr[1] == "NOP") continue;
			if (inst[0] == '.' || inst[0] == ';') continue;
			
			if (inst_arr[0] == "BNEQZ")
				hex_program.push_back(Inst2Int(inst, label2pos[inst_arr[2]]));
			else if (inst_arr[0] == "CALL" || inst_arr[0] == "JUMP")
				hex_program.push_back(Inst2Int(inst, label2pos[inst_arr[1]]));
			else
				hex_program.push_back(Inst2Int(inst));
			
		}	   
	}
}

void OutputHex()
{
	int hex_length = hex_program.size();
	for (int i = 0; i < hex_length; i++)
		cout << setfill('0') << setw(8) << hex << hex_program[i] << endl;
}

int main()
{
	OpenAs();
	Pass(1);
	Pass(2);
	OutputHex();
	return 0;
}

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
#include <fstream>
#include <cstdint>

using namespace std;

vector<string> as_program;
vector<uint64_t> hex_program;
vector<uint8_t> data_program;
map<string, uint32_t> label2pos;
map<string, uint32_t> global_var;

void OpenAs(ifstream &fin)
{
	/* hex header*/
	as_program.push_back("Cheat NOP");
	as_program.push_back("HALT");
	as_program.push_back("Proof NOP");
	as_program.push_back("QED");
	as_program.push_back("JUMP start");
	// as_program.push_back("RET");
	
	string inst;
	while (getline(fin, inst))
	{
		if (!inst.length()) continue;
		// replace(inst.begin(), inst.end(), '\t', ' ');

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
		
		as_program.push_back(init_res);
	}
}

void Pass(int phase)
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

		// std::cout << "DEBUG " << phase << ' ' << inst << std::endl;

		if (phase == 1) {			
			
			if (inst_arr.size() > 1 && inst_arr[1] == "NOP") // write to label2pos table
			{
				if (text_or_data)
				{
					global_var[inst_arr[0]] = global_var_offset;
				 	std::cout << "[GLOBAL_VAR INFO] " << inst_arr[0] << ' ' << global_var_offset << std::endl;
				}
				else
				{
					label2pos[inst_arr[0]] = offset;
				 	std::cout << "[LABEL2POS INFO] " << inst_arr[0] << ' ' << offset << std::endl;
				}
				continue;
			}

			if (inst_arr[0] == ".text")
			{
				text_or_data = 0;
				continue;
			}

			if (inst_arr[0][0] == '.' && inst_arr[0].find("data") != std::string::npos)
			{
				text_or_data = 1;
				continue;
			}

			if (inst_arr[0] == ".p2align")
			{
				int align = 1 << stoi(inst_arr[1]);
				if (align == 8) align = 4;
				while (global_var_offset % align)
					global_var_offset++;
				continue;
			}

			if (text_or_data && inst_arr[0] == ".size")
			{
				global_var_offset += stoi(inst_arr[2]);
				continue;
			}

			if (text_or_data && inst_arr[0] == ".weak")
			{
				global_var[inst_arr[1]] = global_var_offset;
				global_var_offset += 4;
				continue;
			}
			
			if (inst_arr[0] == ".comm")
			{
				// TODO: how to align
				// TODO: how to save space
				int align = stoi(inst_arr[3]);
				if (align == 8) align = 4;

				while (global_var_offset % align)
					global_var_offset++;

				/*
				if (inst_arr[3] == "4" || inst_arr[3] == "8")
					if (global_var_offset % 4)
						global_var_offset = (global_var_offset / 4) * 4 + 4;
				*/

				global_var[inst_arr[1]] = global_var_offset;
				// std::cout << "DEBUG " << inst_arr[1] << ' ' << global_var_offset << std::endl;

				int off = stoi(inst_arr[2]);

				global_var_offset += off;
			}

			if (inst_arr[0] == ".set")
			{
				std::cerr << "set " << inst_arr[1] << ' ' << inst_arr[2] << std::endl;
				label2pos[inst_arr[1]] = label2pos[inst_arr[2]];
			}

			if (inst[0] == '.' || inst[0] == ';') continue;

			offset++;
			
		} else if (phase == 2) {
			
			if (inst_arr.size() > 1 && inst_arr[1] == "NOP") continue;

			if (inst_arr[0] == ".text")
			{
				text_or_data = 0;
				continue;
			}

			if (inst_arr[0][0] == '.' && inst_arr[0].find("data") != std::string::npos)
			{
				text_or_data = 1;
				continue;
			}

			if (inst_arr[0] == ".p2align")
			{
				int align = 1 << stoi(inst_arr[1]);
				if (align == 8) align = 4;
				while (global_var_offset % align)
				{
					data_program.push_back(0);
					global_var_offset++;
				}
				continue;
			}

			if (inst_arr[0] == ".zero")
			{
				int cnt = stoi(inst_arr[1]);
				while (cnt--) data_program.push_back(0);
				continue;
			}

			if (inst_arr[0] == ".byte")
			{
				unsigned long long num = stoull(inst_arr[1]);
				data_program.push_back(num & 0xFF);
				continue;
			}

			if (inst_arr[0] == ".short")
			{
				unsigned long long num = stoull(inst_arr[1]);
				data_program.push_back(num & 0xFF);
				data_program.push_back((num >> 8) & 0xFF);
				continue;
			}
				
			if (inst_arr[0] == ".long")
			{
				string base = "";
				string offset = "";
				int p;
				for (p = 0; p < inst_arr[1].length(); p++)
				{
					if (inst_arr[1][p] == '+') break;
					base += inst_arr[1][p];
				}
				for (p++; p < inst_arr[1].length(); p++)
					offset += inst_arr[1][p];
				if (offset == "") offset = "0";

				// std::cout << "DEBUG " << base << ' ' << offset << std::endl;

				uint32_t addr = 0;
				if (global_var.find(base) != global_var.end()) addr = global_var[base];
				else if (label2pos.find(base) != label2pos.end()) addr = label2pos[base];
				else addr = stoull(base);
				addr += stoull(offset);

				data_program.push_back(addr & 0xFF);
				data_program.push_back((addr >> 8) & 0xFF);
				data_program.push_back((addr >> 16) & 0xFF);
				data_program.push_back((addr >> 24) & 0xFF); 
				continue;

				// if (inst_arr[1][0] == '.')
				// {
				// 	uint32_t addr = global_var[inst_arr[1]];
				// 	data_program.push_back(addr & 0xFF);
				// 	data_program.push_back((addr >> 8) & 0xFF);
				// 	data_program.push_back((addr >> 16) & 0xFF);
				// 	data_program.push_back((addr >> 24) & 0xFF); 
				// 	continue;
				// }
				// unsigned long long num = stoull(inst_arr[1]);
				// data_program.push_back(num & 0xFF);
				// data_program.push_back((num >> 8) & 0xFF);
				// data_program.push_back((num >> 16) & 0xFF);
				// data_program.push_back((num >> 24) & 0xFF);
				// continue;
			}
				
			if (inst_arr[0] == ".quad")
			{
				unsigned long long num = stoull(inst_arr[1]);
				data_program.push_back(num & 0xFF);
				data_program.push_back((num >> 8) & 0xFF);
				data_program.push_back((num >> 16) & 0xFF);
				data_program.push_back((num >> 24) & 0xFF);
				data_program.push_back((num >> 32) & 0xFF);
				data_program.push_back((num >> 40) & 0xFF);
				data_program.push_back((num >> 48) & 0xFF);
				data_program.push_back((num >> 56) & 0xFF);
				continue;
			}

			if (inst_arr[0] == ".asciz")
			{
				std::string str = inst_arr[1];
				for (int c = 2; c < inst_arr.size(); c++)
					str += " " + inst_arr[c];
				str.erase(str.end() - 1);
				str.erase(0, 1);
				std::cout << ".asciz: " << inst_arr.size() << " " << str << " " << str.length() << std::endl;
				for (int c = 0; c < str.length(); c++)
				{
					if (str[c] == '\\')
					{
						if (str[c+1] == '\\') {
							data_program.push_back('\\');							
							c++;
						} else if (str[c+1] == 'n') {
							data_program.push_back('\n');							
							c++;
						} else if (str[c+1] == 'r') {
							data_program.push_back('\r');							
							c++;
						} else if (str[c+1] == 't') {
							data_program.push_back('\t');							
							c++;
						} else if (str[c+1] >= '0' && str[c+1] <= '9') {
							if (c+2 < str.length() && str[c+2] >= '0' && str[c+2] <= '9' && c+3 < str.length() && str[c+3] >= '0' && str[c+3] <= '9') {
								int tmp = (str[c+3]-'0') + 8*(str[c+2]-'0') + 64*(str[c+1]-'0');
								data_program.push_back(tmp);
								c += 3;
							}
						}
						// else if (str[c+1] == '0') {
						// 	if (c+2 < str.length() && str[c+2] >= '0' && str[c+2] <= '9' && c+3 < str.length() && str[c+3] >= '0' && str[c+3] <= '9') {
						// 		if (str[c+3] == '0') data_program.push_back('\0');
						// 		else if (str[c+3] == '1') data_program.push_back('\1');
						// 		c += 3;
						// 	} else {
						// 		data_program.push_back('\0');							
						// 		c++;
						// 	}
						// }
						continue;
					}
					// std::cout << c << ' ' << inst_arr[1][c];
					data_program.push_back(str[c]);
				}
				// std::cout << std::endl;
				data_program.push_back('\0');
				continue;
			}

			if (inst_arr[0] == ".ascii")
			{
				std::cout << inst << std::endl;
				std::string str = inst_arr[1];
				for (int c = 2; c < inst_arr.size(); c++)
					str += " " + inst_arr[c];
				str.erase(str.end() - 1);
				str.erase(0, 1);
				std::cout << ".ascii: " << inst_arr.size() << " " << str << " " << str.length() << std::endl;
				for (int c = 0; c < str.length(); c++)
				{
					if (str[c] == '\\')
					{
						if (str[c+1] == '\\') {
							data_program.push_back('\\');							
							c++;
						} else if (str[c+1] == 'n') {
							data_program.push_back('\n');							
							c++;
						} else if (str[c+1] == 'r') {
							data_program.push_back('\r');							
							c++;
						} else if (str[c+1] == 't') {
							data_program.push_back('\t');							
							c++;
						} else if (str[c+1] >= '0' && str[c+1] <= '9') {
							if (c+2 < str.length() && str[c+2] >= '0' && str[c+2] <= '9' && c+3 < str.length() && str[c+3] >= '0' && str[c+3] <= '9') {
								int tmp = (str[c+3]-'0') + 8*(str[c+2]-'0') + 64*(str[c+1]-'0');
								data_program.push_back(tmp);
								c += 3;
							}
						}
						continue;
					}
					// std::cout << c << ' ' << inst_arr[1][c];
					data_program.push_back(str[c]);
				}
				// std::cout << std::endl;
				// data_program.push_back('\0');
				continue;
			}
			
			if (text_or_data && inst_arr[0] == ".size")
			{
				global_var_offset += stoi(inst_arr[2]);
				continue;
			}

			if (text_or_data && inst_arr[0] == ".weak")
			{
				data_program.push_back(0);
				data_program.push_back(0);
				data_program.push_back(0);
				data_program.push_back(0);
				global_var_offset += 4;
				continue;
			}
			
			if (inst_arr[0] == ".comm")
			{
				// TODO: how to align
				// TODO: how to save space
				int align = stoi(inst_arr[3]);
				if (align == 8) align = 4;

				while (global_var_offset % align)
				{
					data_program.push_back(0);
					global_var_offset++;
				}

				/*
				if (inst_arr[3] == "4" || inst_arr[3] == "8")
					if (global_var_offset % 4)
						global_var_offset = (global_var_offset / 4) * 4 + 4;
				*/

				int off = stoi(inst_arr[2]);

				global_var_offset += off;

				while (off--) data_program.push_back(0);
			}
			
			if (inst[0] == '.' || inst[0] == ';') continue;
			
			if (inst_arr[0] == "BNEQZ")
				hex_program.push_back(Inst2Int(inst, label2pos[inst_arr[2]]));
			else if (inst_arr[0] == "CALL" || inst_arr[0] == "JUMP")
			{
				if (label2pos.find(inst_arr[1]) == label2pos.end())
				{
					std::cerr << "missing " << inst_arr[1] << std::endl;
				}
				hex_program.push_back(Inst2Int(inst, label2pos[inst_arr[1]]));
			}
			else if (inst_arr[0] == "COPYG") {
				string base = "";
				string offset = "";
				int p;
				bool minor = 0;
				for (p = 0; p < inst_arr[2].length(); p++)
				{
					if (inst_arr[2][p] == '+') break;
					if (inst_arr[2][p] == '-')
					{
						minor = 1;
						break;
					}
					base += inst_arr[2][p];
				}
				for (p++; p < inst_arr[2].length(); p++)
					offset += inst_arr[2][p];
				if (offset == "") offset = "0";

				uint32_t ubase = 0;

				if (global_var.find(base) != global_var.end())
					ubase = global_var[base];
				else if (label2pos.find(base) != label2pos.end())
					ubase = label2pos[base];
				else
				{
					std::cout << base << " is not in global_var/label2pos table" << std::endl;
					// exit(-1);					
				}

				// if (global_var.find(base) == global_var.end())
				// {
				// 	std::cout << base << " is not in global_var table" << std::endl;
				// 	exit(-1);
				// }
				// else
				// {
				// 	std::cout << base << ' ' << offset << std::endl;
				// 	std::cout << global_var[base] << std::endl;
				// }
				if (!minor)
					hex_program.push_back(Inst2Int(inst, ubase+stoi(offset)));
				else
					hex_program.push_back(Inst2Int(inst, ubase-stoi(offset)));					
			}
			else
				hex_program.push_back(Inst2Int(inst));
			
		}	   
	}
}

void OutputHex(const string & filename)
{
	ofstream fout;

	fout.open(filename + ".text.hex");
	int hex_length = hex_program.size();
	for (int i = 0; i < hex_length; i++)
		fout << setfill('0') << setw(16) << hex << hex_program[i] << endl;
	fout.close();

	fout.open(filename + ".data.hex");
	int data_length = data_program.size();
	for (int i = 0; i < data_length; i++)
	{
		if (i && i%4 == 0) fout << endl;
		fout << setfill('0') << setw(2) << hex << static_cast<int>(data_program[i]);
	}
	while (data_length % 4)
	{
		fout << setfill('0') << setw(2) << hex << 0;
		data_length++;
	}
	fout.close();
	
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
	Pass(1);
	Pass(2);
	OutputHex(filename);
	return 0;
}

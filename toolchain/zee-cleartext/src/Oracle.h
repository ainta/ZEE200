#ifndef ORACLE_H__
#define ORACLE_H__

#include <vector>
#include <stack>
#include <cstdint>

struct Machine {
	std::uint32_t pc;
	std::vector<std::uint32_t>* registry;
	std::vector<std::uint32_t>* memory;
	std::vector<std::uint64_t>* program;
	std::stack<std::uint32_t>* input;	
};

void oracle(Machine&, std::uint32_t);

#endif

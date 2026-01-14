#ifndef CPU_H__
#define CPU_H__


#include <Rom.h>
#include <Ram.h>

#include <stack>
#include <deque>


using Program = std::vector<std::uint64_t>;


// authenticated cpu
template <Role role>
struct ACpu {
  Zp pc;
  Rom<role> program;
  Ram<role, 1, LogCache> registry;
  Ram<role, 1, LogCache> memory;
  std::deque<std::uint32_t>* input;
};


// predictive cpu
struct PCpu {
  std::uint32_t pc;
  PRom<std::uint64_t> program;
  PRam<LogCache> registry;
  PRam<LogCache> memory;

  // as the cleartext execution reads from input, it writes to tape
  std::stack<std::uint32_t> input;
  std::deque<std::uint32_t> tape;
};


template <Role role>
void exec(
    Program,
    const std::vector<std::uint32_t>& data,
    std::size_t powMem);


#include <Cpu.hpp>

#endif

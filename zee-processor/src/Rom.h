#ifndef ROM_H__
#define ROM_H__


#include <Share.h>
#include <vector>
#include <deque>
#include "Cycle.h"


using namespace GT;


template <Role role>
struct Rom {
  Rom() { }
  Rom(
    const std::vector<std::array<Zp, 2>>&,
    CycleQueue<std::uint32_t>* accessOrder);

  // Read the next element from the ROM. The read element's index should match
  // the passed in index (this fact is checked as part of the proof).
  std::array<Zp, 3> front() { return ordered[current]; }
  std::array<Zp, 3> read();
  std::size_t size() const { return ordered.size(); }

  std::size_t pow;

  // The cleartext content of the ROM
  std::vector<std::array<Zp, 3>> ixcontent;

  // Which index is next to be accessed?
  std::size_t current;

  // The current (duplicated and permuted) order.
  std::vector<std::array<Zp, 3>> ordered;

  // The accesses as they are to occur in the future.
  CycleQueue<std::uint32_t>* accessOrder;

  void arrangeContents();
};


// predictive rom
template <typename T>
struct PRom {
  PRom() { }
  PRom(const std::vector<T>& content, std::size_t foresight)
    : content(content), accessOrder(foresight) { }

  T read(std::uint32_t ix) {
    accessOrder.push_back(ix);
    return content[ix];
  }

  std::size_t size() const { return content.size(); }

  std::vector<T> content;
  CycleQueue<std::uint32_t> accessOrder;
};

#include <Rom.hpp>


#endif

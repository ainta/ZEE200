#ifndef RAM_H__
#define RAM_H__


#include <Share.h>
#include <vector>
#include <deque>
#include <unordered_set>
#include "Cycle.h"


inline constexpr bool divides(int x, int y) {
  if (x == 0) { return true; }
  return (y % x) == 0;
}


struct LogCache {
  static constexpr std::size_t numer = 1;
  static constexpr std::size_t denom = 1;

  static constexpr std::size_t midnight(int pow) {
    std::size_t constant = (numer * pow) / denom;
    std::size_t constant2 = 1;
    while (constant > constant2) {
      constant2 <<= 1;
    }

    const std::size_t midnight_normal = 1 << pow;
    const std::size_t midnight_delayed = constant2*(1 << pow);

    // never let the delayed version be shorter than normal
    return std::max(midnight_normal, midnight_delayed);
  }

  static constexpr bool rule(std::size_t timestep, int pow) {
    // special case, lowest caches should always hit
    if (pow < 3) { return divides(1<<pow, timestep); }
    return divides(midnight(pow), timestep);
  }
};

/* struct LogCache { */
/*   static constexpr std::size_t midnight(int pow) { */
/*     return 1 << pow; */
/*   } */

/*   static constexpr bool rule(std::size_t timestep, int pow) { */
/*     return (timestep % (1 << pow)) == 0; */
/*   } */
/* }; */

struct NoCache {
  static constexpr bool rule(std::size_t timestep, int pow) {
    return (timestep % (1 << pow)) == 0;
  }
};


template <Role role, size_t n, typename Rule>
struct Ram {
public:
  Ram() { }
  Ram(
      std::size_t power,
      const std::vector<std::array<std::uint32_t, n>>& init,
      CycleQueue<std::uint32_t>* accessOrder);

  Ram(
      std::size_t power,
      const std::vector<std::uint32_t>& init,
      CycleQueue<std::uint32_t>* accessOrder);

  auto& access() {
    repartition();
    auto& f = front();
    if constexpr (role == Role::Input) {
      accessOrder->pop_front();
    }
    return f;
  }

  std::array<Zp, n+1>& front() { return ixcontent[0]; }

  // will access `future` steps forward in time miss index ix?
  Known<role == Role::Input, bool> willMiss(std::size_t future, std::size_t ix) const;

  // What power of 2 is the RAM size?
  std::size_t power;

  // How many accesses have occurred (mod 2^power)?
  std::size_t timestep;

  // The current (duplicated and permuted) order.
  std::vector<std::array<Zp, n+1>> ixcontent;

  // The accesses as they are to occur in the future.
  CycleQueue<std::uint32_t>* accessOrder;

  // What position in the RAM is each RAM index in?
  Known<role == Role::Input, std::vector<std::size_t>> indexMapping;

  void repartition();
  void repartition(std::size_t, std::size_t);
};


template <typename Rule>
struct CachePredictor {
  public:
    CachePredictor() : pow(0), timestep(0) { }
    CachePredictor(std::size_t pow) : pow(pow), timestep(0) { residents.resize(pow); }
    bool access(std::uint32_t ix);

    std::size_t pow;
    std::size_t timestep;
    std::vector<std::unordered_set<std::uint32_t>> residents;
};


// predictive ram
template <typename Rule>
struct PRam {
  PRam() { }
  PRam(std::size_t pow, std::size_t foresight)
    : predictor(pow), accessOrder(foresight) {
    content.resize(1 << pow);
  }

  PRam(
      const std::vector<std::uint32_t>& init,
      std::size_t pow,
      std::size_t foresight)
    : predictor(pow), accessOrder(foresight) {
    content.resize(1 << pow);
    for (auto& e : content) { e = 0; }
    for (std::size_t i = 0; i < init.size(); ++i) {
      content[i] = init[i];
    }
  }

  std::uint32_t& access(bool access, std::uint32_t ix, bool& hit) {
    std::uint32_t readIx = access * ix;
    accessOrder.push_back(readIx);
    // predict hit
    hit = predictor.access(readIx);
    return content[readIx];
  }


  CachePredictor<Rule> predictor;
  std::vector<std::uint32_t> content;
  CycleQueue<std::uint32_t> accessOrder;
};


#include <Ram.hpp>


#endif

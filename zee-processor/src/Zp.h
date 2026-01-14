#ifndef ZP_H__
#define ZP_H__

#include <cstring>
#include <cassert>
#include <cstdint>

#include <ostream>
#include <array>
#include <vector>
#include "PRG.h"

// integers mod largest 64 bit prime


namespace GT {


struct Zp {
  Zp() : content(0) { }
  explicit Zp(std::uint64_t content) : content(content) { };

  // use random_device to draw [0, p)
  static Zp random();
  // use random_device to draw [lo, hi)
  static Zp random(Zp lo);


  template <typename It>
  static void random(const std::bitset<128>& seed, It begin, It end) {
    // WHP, the source will simply contain candidate prime field elements.
    // Therefore, try to extract these for small values of n first, and only
    // generate PRG values if this is impossible.
    const auto n = std::distance(begin, end);
    if (n <= 3) {
      std::size_t i = 0;
      for (auto it = begin; it != end; ++it) {
        std::uint64_t buff = 0;
        memcpy((void*)&buff, ((const char*)&seed) + 5*i, 5);
        if (buff >= Zp::prime) {
          // if we go out of bounds, use PRF to construct a fresh seed and try
          // again
          random(PRG { seed }(), begin, end);
          break;
        }
        *it = Zp { buff };
        ++i;
      }
    } else {
      // if there are more than 3 required primes, split into groups of 3
      PRG prg(seed);
      std::size_t nsubs = (n+2)/3;
      for (std::size_t i = 0; i < nsubs-1; ++i) {
        random(prg(), begin + 3*i, begin + 3*(i+1));
      }
      random(prg(), begin + 3*(nsubs-1), end);
    }
  }

  // largest 40 bit prime:
  static constexpr std::uint64_t prime = ((std::uint64_t)1 << 40) - 87;

  std::uint64_t content;
};


template <size_t n>
std::array<Zp, n> randomArray(const std::bitset<128>& seed) {
  std::array<Zp, n> out;
  Zp::random(seed, out.begin(), out.end());
  return out;
}



Zp operator-(Zp, Zp);
Zp operator+(Zp, Zp);
inline Zp& operator+=(Zp& x, Zp y) { x = x + y; return x; }
inline Zp& operator-=(Zp& x, Zp y) { x = x - y; return x; }
Zp select(bool, Zp);

bool operator==(Zp, Zp);
bool operator!=(Zp, Zp);
bool operator<=(Zp, Zp);
bool operator>=(Zp, Zp);
bool operator<(Zp, Zp);
bool operator>(Zp, Zp);


// multiplication where s must be of a maximum size
inline Zp unsafeMul(std::uint64_t s, Zp x) {
  assert(s < (1<<20));
  return Zp { (x.content * s) % Zp::prime };
}

Zp operator*(std::uint64_t, Zp);
Zp operator<<(Zp, std::uint64_t);
inline Zp operator>>(Zp x, std::uint64_t s) {
  return Zp { x.content >> s };
}

inline Zp fastShift(Zp x, std::uint64_t s) {
  return Zp { (x.content << s) % Zp::prime };
}


std::ostream& operator<<(std::ostream&, Zp);


}

#endif

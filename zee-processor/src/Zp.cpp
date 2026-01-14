#include "Zp.h"
#include <random>


namespace GT {


PRG prg;


Zp Zp::random(Zp lo) {
  const auto randomU64 = [&] {
    std::uint64_t i;
    prg.randomize(&i, sizeof(i));
    return i;
  };

  std::uint64_t content;
  do {
    content = (randomU64() % ((std::uint64_t)1 << 40)) + lo.content;
  } while (content >= prime);
  return Zp { content };
}


bool operator==(Zp x, Zp y) { return x.content == y.content; }
bool operator!=(Zp x, Zp y) { return x.content != y.content; }
bool operator>=(Zp x, Zp y) { return x.content >= y.content; }
bool operator<=(Zp x, Zp y) { return x.content <= y.content; }
bool operator>(Zp x, Zp y) { return x.content > y.content; }
bool operator<(Zp x, Zp y) { return x.content < y.content; }


/**
 * Subtraction is done in this funny way to ensure that the
 * representation does not overflow and thus we lose correctness.
 * That is, every intermediate value in the following computation is in the range [0..p)
 */
Zp operator-(Zp x, Zp y) {
  return Zp {
    (x.content - y.content) + ((x.content < y.content) ? Zp::prime : 0)
  };
}


/**
 * Like subtraction, we do funny math to ensure all intermediate values are in
 * the range [0..p).
 */
Zp operator+(Zp x, Zp y) {
  return Zp { (x.content + y.content) - ((x.content + y.content >= Zp::prime) ? Zp::prime : 0) };
}


Zp select(bool b, Zp x) { return b ? x : Zp { 0 }; }


Zp operator*(std::uint64_t x, Zp y) {
  const __int128 xx = x;
  const __int128 yy = y.content;
  const __int128 prod = xx * yy;
  const std::uint64_t prodp = prod % Zp::prime;
  return Zp { prodp };
}


// shifting avoids costly mod operation
Zp operator<<(Zp x, std::uint64_t s) {
  assert (s < 40);
  if (s > 20) {
    return (x << 20) << (s - 20);
  } else {
    x.content = (x.content << s) % Zp::prime;
    return x;
  }
}


std::ostream& operator<<(std::ostream& os, Zp z) {
  os << z.content;
  return os;
}


}

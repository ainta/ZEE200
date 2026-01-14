#include <Share.h>
#include <Channel.h>

#include <sstream>
#include <iostream>


namespace GT {


template <typename It>
Zp inject(It begin, It end, std::size_t shift) {
  Zp out { 0 };
  for (auto it = begin; it != end; ++it) {
    out += (*it << shift);
    ++shift;
  }
  return out;
}


inline Zp inject(const std::array<Zp, 32>& bits) {
  Zp out { 0 };
  for (std::uint64_t i = 0; i < 32; ++i) {
    out = out + (bits[i] << i );
  }
  return out;
}


template <Role role>
Zp input(const Known<role == Role::Input, Zp>& x) {
  return ole<32, role>(Protocol::delta, x);
}


template <Role role>
Zp input(bool x) {
  return ot<role, 1>({ Protocol::delta }, x)[0];
}


template <Role role>
Zp constant(std::uint64_t i) {
  if constexpr (role == Role::Verifier) {
    return Zp { i * Protocol::delta };
  } else if constexpr (role == Role::Check) {
    return Zp { i * Protocol::delta };
  } else if constexpr (role == Role::Prover) {
    return Zp { 0 };
  } else if constexpr (role == Role::Input) {
    return Zp { i };
  } else {
    assert(false);
  }
}


template <Role role>
Zp select(const Zp& x, const Zp& y) {
  const auto ciphers = ot<role, 2>({ Protocol::delta, y }, x.content);
  const auto px = sendSelect<role>(x.content);

  prove0<role>(x - ciphers[0]);

  if constexpr (role == Role::Verifier) {
    return ciphers[1];
  } else if constexpr (role == Role::Check) {
    return ciphers[1];
  } else if constexpr (role == Role::Prover) {
    return select(px, y) + ciphers[1];
  } else if constexpr (role == Role::Input) {
    return select(x.content, y);
  } else {
    assert(false);
  }
}


template <Role role, std::size_t n>
std::array<Zp, n> select(bool x, const std::array<Zp, n>& ys) {
  auto choices = ot<role, n>(ys, x);
  const auto px = sendSelect<role>(x);

  if constexpr (role == Role::Verifier) {
    return choices;
  } else if constexpr (role == Role::Check) {
    return choices;
  } else if constexpr (role == Role::Prover) {
    for (std::size_t i = 0; i < n; ++i) {
      choices[i] = select(px, ys[i]) + choices[i];
    }
    return choices;
  } else if constexpr (role == Role::Input) {
    for (std::size_t i = 0; i < n; ++i) {
      choices[i] = select(x, ys[i]);
    }
    return choices;
  }
}


template <Role role, std::size_t n>
std::array<Zp, n+1> inputSelect(bool x, const std::array<Zp, n>& ys) {
  std::array<Zp, n+1> muls;
  muls[0] = Protocol::delta;
  for (std::size_t i = 0; i < n; ++i) {
    muls[i+1] = ys[i];
  }
  auto choices = ot<role, n+1>(muls, x);
  const auto px = sendSelect<role>(x);

  if constexpr (role == Role::Verifier) {
    return choices;
  } else if constexpr (role == Role::Check) {
    return choices;
  } else if constexpr (role == Role::Prover) {
    for (std::size_t i = 0; i < n; ++i) {
      choices[i+1] = select(px, ys[i]) + choices[i+1];
    }
    return choices;
  } else if constexpr (role == Role::Input) {
    for (std::size_t i = 0; i < n; ++i) {
      choices[i+1] = select(x, ys[i]);
    }
    return choices;
  }
}


template <Role role>
Zp mux(const Zp& b, const Zp& x, const Zp& y) {
  return select<role>(b, x - y) + y;
}


template <Role role, std::size_t n>
std::pair<Zp, std::array<Zp, n>> inputMux(bool b, const std::array<Zp, n>& xs, const std::array<Zp, n>& ys) {
  std::array<Zp, n> diffs;
  for (std::size_t i = 0; i < n; ++i) {
    diffs[i] = xs[i] - ys[i];
  }
  const auto bdiffs = inputSelect<role, n>(b, diffs);
  std::array<Zp, n> outs;
  for (std::size_t i = 0; i < n; ++i) {
    outs[i] = bdiffs[i+1] + ys[i];
  }
  return { bdiffs[0], outs };
}


template <Role role>
Zp select(bool x, const Zp& y) {
  const auto cipher = ot<role, 1>({ y }, x)[0];
  const auto px = sendSelect<role>(x);

  if constexpr (role == Role::Verifier) {
    return cipher;
  } else if constexpr (role == Role::Check) {
    return cipher;
  } else if constexpr (role == Role::Prover) {
    return select(px, y) + cipher;
  } else if constexpr (role == Role::Input) {
    return select(x, y);
  }
}

template <Role role>
void bswap(const Known<role == Role::Input, bool>& b, Zp& x, Zp& y) {
  const auto diff = select(b, y - x);
  x += diff;
  y -= diff;
}


template <Role role>
void bswap(const Zp& b, Zp& y, Zp& x) {
  const auto diff = select<role>(b, y - x);
  x += diff;
  y -= diff;
}


template <Role role, size_t n>
void bswap(
    bool b,
    std::array<Zp, n>& xs,
    std::array<Zp, n>& ys) {
  std::array<Zp, n> diffs;
  for (std::size_t i = 0; i < n; ++i) {
    diffs[i] = ys[i] - xs[i];
  }
  const auto diffp = select<role>(b, diffs);
  for (std::size_t i = 0; i < n; ++i) {
    xs[i] += diffp[i];
    ys[i] -= diffp[i];
  }
}


template <size_t n, Role role>
std::array<Zp, n> project(const Zp& x) {
  std::array<Zp, n> p;
  Zp sum = constant<role>(0);
  for (std::size_t i = 0; i < n; ++i) {
    bool bi = false;
    if constexpr (role == Role::Input) {
      bi = ((x.content & (1 << i)) > 0);
    }
    p[i] = input<role>(bi);
    sum += (p[i] << i);
  }
  return p;
}


template <Role role>
std::array<Zp, 32> project32(const Zp& x) {
  return project<32, role>(x);
}


template <Role role>
std::array<Zp, 8> project8(const Zp& x) {
  return project<8, role>(x);
}

template <Role role>
inline Zp NEG(const Zp& b) {
  return constant<role>(1) - b;
}


template <Role role>
Zp AND(const Zp& b, const Zp& c) {
  return select<role>(b, c);
}


template <Role role>
Zp XOR(const Zp& b, const Zp& c) {
  const auto prod = AND<role>(b, c);
  return b + c - (prod + prod);
}


template <Role role>
Zp OR(const Zp& b, const Zp& c) {
  return NEG<role>(AND<role>(NEG<role>(b), NEG<role>(c)));
}


}

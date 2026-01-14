#ifndef SHARE_H__
#define SHARE_H__

#include <Role.h>
#include <Zp.h>
#include <Channel.h>
#include <fstream>


namespace GT {


Zp inject(const std::array<Zp, 32>& bits);

template <Role role>
Zp input(const Known<role == Role::Input, Zp>&);

template <Role role>
Zp input(bool);

template <Role role>
Zp constant(std::uint64_t);

template <Role role>
Zp select(const Zp&, const Zp&);

template <Role role>
Zp mux(const Zp&, const Zp&, const Zp&);

template <Role role>
void bswap(const Zp&, Zp&, Zp&);

template <Role role>
Zp mod32(const Zp&);

template <Role role>
std::array<Zp, 32> project32(const Zp&);

template <Role role>
std::array<Zp, 8> project8(const Zp&);

// faster selection when prover input need not be authenticated directly
template <Role role>
Zp select(const Known<role == Role::Input, bool>&, const Zp&);

template <Role role> Zp NEG(const Zp&);
template <Role role> Zp AND(const Zp&, const Zp&);
template <Role role> Zp XOR(const Zp&, const Zp&);
template <Role role> Zp OR(const Zp&, const Zp&);


template <Role role, std::size_t logn, std::size_t m>
std::pair<Zp, std::array<Zp, m>> lookup(
    std::uint32_t i,
    const std::array<std::array<Zp, m>, 1 << logn>& table) {

  if constexpr (logn == 0) {
    return { constant<role>(0), table[0] };
  } else {
    constexpr std::uint64_t half = 1 << (logn - 1);

    std::array<Zp, half*m> l, r;
    for (std::size_t i = 0; i < half; ++i) {
      for (std::size_t j = 0; j < m; ++j) {
        l[i*m + j] = table[i][j];
        r[i*m + j] = table[i + half][j];
      }
    }

    const std::uint32_t bit = i & half;
    const auto [ix1, halftable] = inputMux<role, half*m>(bit > 0, r, l);
    std::array<std::array<Zp, m>, half> halfArranged;
    for (std::size_t i = 0; i < half; ++i) {
      for (std::size_t j = 0; j < m; ++j) {
        halfArranged[i][j] = halftable[i*m + j];
      }
    }

    const auto [ixrest, res] = lookup<role, logn-1, m>(i - bit, halfArranged);

    return { (ix1 << ((std::uint64_t)logn-1)) + ixrest, res };
  }
}


}

#endif

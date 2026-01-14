#include "MExtension.h"
#include "BaseOT.h"
#include "../PRG.h"
#include <emmintrin.h>
#include <wmmintrin.h>
#include <emp-tool/utils/tccrh.h>

using namespace GT;


__attribute__((target("sse2,pclmul")))
std::pair<std::bitset<128>, std::bitset<128>>
mul128(const std::bitset<128>& a, const std::bitset<128>& b) {
  __m128i& a_ = *(__m128i*)&a;
  __m128i& b_ = *(__m128i*)&b;

  std::bitset<128> ab[4];
  __m128i* ab_ = (__m128i*)ab;

  ab_[0] = _mm_clmulepi64_si128(a_, b_, 0x00);
  ab_[1] = _mm_clmulepi64_si128(a_, b_, 0x01);
  ab_[2] = _mm_clmulepi64_si128(a_, b_, 0x10);
  ab_[3] = _mm_clmulepi64_si128(a_, b_, 0x11);

  const auto inner = _mm_xor_si128(ab_[1], ab_[2]);

  ab_[0] = _mm_xor_si128(ab_[0], _mm_slli_si128(inner, 8));
  ab_[3] = _mm_xor_si128(ab_[3], _mm_srli_si128(inner, 8));

  return { ab[0], ab[3] };
}


template <std::size_t n>
std::bitset<128*n> randomBits(PRG& prg) {
  std::bitset<128*n> out;
  std::bitset<128>* arr = (std::bitset<128>*)&out;
  for (std::size_t i = 0; i < n; ++i) { arr[i] = prg(); }
  return out;
}

template <std::size_t n>
std::bitset<128*n> randomBits() {
  PRG prg;
  return randomBits<n>(prg);
}


template <std::size_t n>
void sendBits(std::iostream& channel, const std::bitset<128*n>& to_send) {
  channel.write(reinterpret_cast<const char*>(&to_send), n*16);
}


template <std::size_t n>
std::bitset<128*n> recvBits(std::iostream& channel) {
  std::bitset<128*n> out;
  channel.read(reinterpret_cast<char*>(&out), n*16);
  return out;
}


template <std::size_t n>
std::bitset<n> operator*(bool b, const std::bitset<n>& x) {
  return b ? x : 0;
}


namespace OT {

static constexpr std::size_t ssp = 40;
static constexpr std::size_t block_size = 128*128;
static constexpr std::size_t bsize = 2048;

void transpose(const std::bitset<block_size>* in, std::bitset<128>* ou) {
  constexpr std::size_t nrows = 128;
  constexpr std::size_t ncols = block_size;

  const uint8_t* inp = (const uint8_t*)in;
  uint8_t* out = (uint8_t*)ou;

  const auto input = [&](auto x, auto y) { return inp[(x*ncols + y)/8]; };
  const auto output = [&](auto x, auto y) { return (uint16_t*)&out[(y*nrows + x)/8]; };

  union { __m128i slice; uint8_t bytes[16]; } buf;

  const auto shift = [&] {
    buf.slice = _mm_slli_epi64(buf.slice, 1);
  };

  for (std::size_t rr = 0; rr <= nrows - 16; rr += 16) {
    for (std::size_t cc = 0; cc < ncols; cc += 8) {
      for (std::size_t i = 0; i < 16; ++i) {
        buf.bytes[i] = input(rr + i, cc);
      }
      for (int i = 8; --i >= 0; shift()) {
        *output(rr, cc+i) = _mm_movemask_epi8(buf.slice);
      }
    }
  }
}

constexpr std::size_t padded_length(std::size_t n) {
  return ((n + ssp + block_size - 1) / block_size) * block_size;
}

std::vector<std::pair<std::bitset<128>, std::bitset<128>>> send(std::iostream& io, std::size_t num) {
  const auto n = padded_length(num);
  std::vector<std::bitset<128>> qT(n);

  const auto [base_choices, k] = BaseOT::recv(io);
  std::vector<PRG> prgs;
  for(std::size_t i = 0; i < 128; ++i) {
    prgs.push_back(PRG { k[i] });
  }

  std::vector<std::bitset<block_size>> q(128);
  for (std::size_t j = 0; j < n/block_size; ++j) {
    for(std::size_t i = 0; i < 128; ++i) {
      q[i] = randomBits<block_size/128>(prgs[i]) ^ (base_choices[i] * recvBits<block_size/128>(io));
    }
    transpose(q.data(), qT.data()+j*block_size);
  }

  const auto correlation_seed = recvBits<1>(io);
  PRG correlation(correlation_seed);

  std::bitset<128> q0;
  std::bitset<128> q1;
  for(std::size_t i = 0; i < n; ++i) {
    const auto chi = randomBits<1>(correlation);
    const auto [tmp0, tmp1] = mul128(chi, qT[i]);
    q0 ^= tmp0;
    q1 ^= tmp1;
  }
  const auto x = recvBits<1>(io);
  const auto t0 = recvBits<1>(io);
  const auto t1 = recvBits<1>(io);
  const auto [tmp0, tmp1] = mul128(x, base_choices);

  if ((q0 ^ tmp0) != t0 || (q1 ^ tmp1) != t1) {
    std::cerr << "OT Extension check failed\n";
    std::exit(1);
  }

  emp::TCCRH tccrh;
  std::vector<std::pair<std::bitset<128>, std::bitset<128>>> data(n);
  std::vector<std::bitset<128>> pad(2*bsize);
  for(std::size_t i = 0; i < n; i+=bsize) {
    for(std::size_t j = i; j < i+bsize and j < n; ++j) {
      pad[2*(j-i)] = qT[j];
      pad[2*(j-i)+1] = qT[j] ^ base_choices;
    }
    tccrh.H<2*bsize>((emp::block*)pad.data(), (emp::block*)pad.data(), 2*i);
    for(std::size_t j = i; j < i+bsize and j < n; ++j) {
      data[j] = { pad[2*(j-i)], pad[2*(j-i)+1] };
    }
  }
  return data;
}


std::vector<std::bitset<128>> recv(std::iostream& io, const std::vector<bool>& sel) {
  const auto n = padded_length(sel.size());
  std::vector<std::bitset<block_size>> b(n/block_size);

  // index the i th selection bit
  const auto bit = [&](std::size_t i) -> std::bitset<block_size>::reference {
    return b[i/block_size][i%block_size];
  };

  for (std::size_t i = 0; i < sel.size(); ++i) { bit(i) = sel[i]; }

  const auto [k0, k1] = BaseOT::send(io);
  std::vector<PRG> prgs0;
  std::vector<PRG> prgs1;
  for(std::size_t i = 0; i < 128; ++i) {
    prgs0.push_back(PRG { k0[i] });
    prgs1.push_back(PRG { k1[i] });
  }

  std::vector<std::bitset<128>> tT(n);
  std::vector<std::bitset<block_size>> t(128);
  for (std::size_t j = 0; j < n/block_size; ++j) {
    for(std::size_t i = 0; i < 128; ++i) {
      t[i] = randomBits<block_size/128>(prgs0[i]);
      sendBits<block_size/128>(io, randomBits<block_size/128>(prgs1[i]) ^ t[i] ^ b[j]);
    }
    transpose(t.data(), tT.data()+j*block_size);
  }

  std::bitset<128> correlation_seed = randomBits<1>();
  sendBits<1>(io, correlation_seed);
  PRG correlation(correlation_seed);

  std::bitset<128> x = 0;
  std::bitset<128> t0, t1;
  for(std::size_t i = 0; i < n; ++i) {
    const auto chi = randomBits<1>(correlation);
    const auto [tmp1, tmp2] = mul128(chi, tT[i]);
    t0 ^= tmp1;
    t1 ^= tmp2;
    if (bit(i)) { x ^= chi; }
  }
  sendBits<1>(io, x);
  sendBits<1>(io, t0);
  sendBits<1>(io, t1);

  emp::TCCRH tccrh;
  for (std::size_t i = 0; i < n; ++i) {
    emp::block tmp = tccrh.H(*(const emp::block*)&tT[i], 2*i + bit(i));
    tT[i] = *(const std::bitset<128>*)&tmp;
  }
  return tT;
}

}

#include <emp-tool/emp-tool.h>
#include <emp-ot/emp-ot.h>
#include <iostream>

#include <OT/Ferret.h>
#include <Channel.h>


using Zp = GT::Zp;
using namespace std;
using namespace emp;

namespace GT {

namespace FOT {

SeedSetup sendSeeds(
    emp::NetIO& primary,
    emp::NetIO& secondary,
    emp::NetIO& tertiary,
    std::size_t n) {
  constexpr int threads = 2;

  emp::NetIO* ios[3];
  ios[0] = &primary;
  ios[1] = &secondary;
  ios[2] = &tertiary;
  FerretCOT<NetIO> ot { ALICE, threads, ios, true };
  // Call byte_memory_need_inplace() to get the buffer size needed
  const auto mem_size = ot.byte_memory_need_inplace(n);

  std::cout << "DEBUG " << n << ' ' << mem_size << std::endl;

  SeedSetup out;
  out.zeros.resize(mem_size);

  ot.rcot_inplace((emp::block*)out.zeros.data(), mem_size);

  memcpy(&out.correlation, &ot.Delta, 16);

  std::vector<std::bitset<128>> match((n + 127)/128);
  primary.recv_data((char*)match.data(), match.size() * 16);
  primary.flush();
  for (std::size_t i = 0; i < n; ++i) {
    if (match[i/128][i%128]) {
      out.zeros[i] ^= out.correlation;
    }
  }

  return out;
}


std::vector<std::bitset<128>> recvSeeds(
    emp::NetIO& primary,
    emp::NetIO& secondary,
    emp::NetIO& tertiary,
    std::vector<bool> selection) {
  constexpr int threads = 2;
  const auto n = selection.size();

  emp::NetIO* ios[3];
  ios[0] = &primary;
  ios[1] = &secondary;
  ios[2] = &tertiary;
  FerretCOT<NetIO> ot { BOB, threads, ios, true };
  // Call byte_memory_need_inplace() to get the buffer size needed
  const auto mem_size = ot.byte_memory_need_inplace(n);
  std::cout << "DEBUG n = " << n << std::endl;
  std::cout << "DEBUG mem_size = " << mem_size << std::endl;

  std::vector<std::bitset<128>> out(mem_size);

  ot.rcot_inplace((emp::block*)out.data(), mem_size);
  out.resize(n);

  // send seed correction
  std::vector<std::bitset<128>> match((n + 127)/128);
  for (std::size_t i = 0; i < n; ++i) {
    match[i/128][i%128] = selection[i] != out[i][0];
  }
  primary.send_data((const char*)match.data(), match.size() * 16);
  primary.flush();

  return out;
}


std::vector<Zp> send(
    emp::NetIO& channel,
    const SeedSetup& seeds,
    const std::vector<std::size_t>& distr,
    const std::vector<Zp>& deltas) {
  const auto n = distr.size();
  const auto total = deltas.size();

  std::vector<Zp> zeros(total);
  std::vector<char> correlation(total*5);

  std::size_t distance = 0;
  for (std::size_t i = 0; i < n; ++i) {
    const auto s0 = seeds.zeros[i];
    const auto s1 = s0 ^ seeds.correlation;

    std::vector<Zp> ones(distr[i]);

    Zp::random(s0, zeros.begin() + distance, zeros.begin() + distance + distr[i]);
    Zp::random(s1, ones.begin(), ones.end());

    // collect the Zp correlation into a byte buffer
    for (std::size_t j = 0; j < distr[i]; ++j) {
      const auto corr = zeros[distance + j] - ones[j] + deltas[distance + j];
      memcpy(correlation.data() + 5*(distance + j), &corr.content, 5);
    }
    distance += distr[i];
  }
  channel.send_data(correlation.data(), correlation.size());
  return zeros;
}


std::vector<Zp> recv(
    emp::NetIO& channel,
    const std::vector<std::bitset<128>>& seeds,
    const std::vector<std::size_t>& distr,
    std::size_t total,
    const std::vector<bool>& choices) {
  const auto n = distr.size();

  std::vector<Zp> out(total);

  std::vector<char> correlation(total*5);
  channel.recv_data(correlation.data(), correlation.size());

  std::size_t distance = 0;
  for (std::size_t i = 0; i < n; ++i) {
    Zp::random(seeds[i], out.begin() + distance, out.begin() + distance + distr[i]);

    // extract the Zp correlation from the byte buffer
    for (std::size_t j = 0; j < distr[i]; ++j) {
      if (choices[i]) {
        Zp corr;
        memcpy(&corr.content, correlation.data() + 5*(distance + j), 5);
        out[distance + j] += corr;
      }
    }
    distance += distr[i];
  }

  return out;
}

}

}

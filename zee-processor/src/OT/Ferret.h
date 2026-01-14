#include <emp-tool/emp-tool.h>
#include "../Zp.h"


namespace GT {
namespace FOT {


struct SeedSetup {
  std::bitset<128> correlation;
  std::vector<std::bitset<128>> zeros;
};


SeedSetup sendSeeds(
    emp::NetIO& primary,
    emp::NetIO& secondary,
    emp::NetIO& tertiary,
    std::size_t n);


std::vector<std::bitset<128>> recvSeeds(
    emp::NetIO& primary,
    emp::NetIO& secondary,
    emp::NetIO& tertiary,
    std::vector<bool> selection);


std::vector<Zp> send(
    emp::NetIO&,
    const SeedSetup& seeds,
    const std::vector<std::size_t>& distr,
    const std::vector<Zp>& deltas);


std::vector<Zp> recv(
    emp::NetIO&,
    const std::vector<std::bitset<128>>& seeds,
    const std::vector<std::size_t>& distr,
    std::size_t total,
    const std::vector<bool>& choices);


}
}

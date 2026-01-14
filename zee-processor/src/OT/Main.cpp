#include "Ferret.h"


namespace GT {


const std::size_t n = 50000000;


void test_ferret(
    emp::NetIO& primary,
    emp::NetIO& secondary,
    emp::NetIO& tertiary,
    int party) {
  auto start = emp::clock_start();

  if (party == emp::ALICE) {
    const auto seeds = FOT::sendSeeds(primary, secondary, tertiary, n);

  } else {
    std::vector<bool> choices(n);
    for (std::size_t i = 0; i < n; ++i) { choices[i] = false; }
    choices[3] = true;

    const auto seeds = FOT::recvSeeds(primary, secondary, tertiary, choices);
    /* for (const auto& s: seeds) { */
    /*   std::cout << s << '\n'; */
    /* } */
  }

  long long t = emp::time_from(start);
  std::cout << t/1e6 << '\n';
  std::cout << double(n)/t*1e6 << '\n';
}

}


int main(int argc, char** argv) {
  int port, party;
  emp::parse_party_and_port(argv, &party, &port);
  emp::NetIO primary { party == emp::ALICE ? nullptr : "127.0.0.1", port };
  emp::NetIO secondary { party == emp::ALICE ? nullptr : "127.0.0.1", port+1 };
  emp::NetIO tertiary { party == emp::ALICE ? nullptr : "127.0.0.1", port+2 };

  GT::test_ferret(primary, secondary, tertiary, party);
}

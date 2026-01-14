#include <Share.h>
#include <openssl/sha.h> // SHA 256
#include <MExtension.h>


template <Role role, std::size_t n>
std::array<Zp, n>
ot(const std::array<Zp, n>& ys, bool x) {
  if constexpr (role == Role::Verifier) {
    const auto randomSeed = Protocol::randomOts.zeros[Protocol::randomVIndex];
    const auto lSeed = Protocol::vPrg();
    const auto rSeed = lSeed ^ Protocol::randomOts.correlation;
    Protocol::vOtZerosBuffer.push_back(randomSeed ^ lSeed);

    ++Protocol::randomVIndex;

    const auto ls = randomArray<n>(lSeed);
    const auto rs = randomArray<n>(rSeed);

    std::array<Zp, n> out;
    for (std::size_t i = 0; i < n; ++i) {
      const auto diff = ls[i] + ys[i] - rs[i];
      memcpy(Protocol::vDiffBuffer.data() + Protocol::vDiffIx*5, (const char*)&diff.content, 5);
      ++Protocol::vDiffIx;
      out[i] = Zp { 0 } - ls[i];
    }
    return out;
  } else if constexpr (role == Role::Prover) {
    const auto randomDiff = Protocol::pOtZerosBuffer[Protocol::randomPIndex];
    const auto m = Protocol::randomReceipts[Protocol::randomPIndex] ^ randomDiff;
    const auto b = Protocol::choices[Protocol::randomPIndex];
    ++Protocol::randomPIndex;

    const auto bases = randomArray<n>(m);

    std::array<Zp, n> out;
    for (std::size_t i = 0; i < n; ++i) {
      Zp diff;
      memcpy((char*)&diff.content, Protocol::pDiffBuffer.data() + Protocol::pDiffIx*5, 5);

      // hash the received message
      SHA256_Update(&(Protocol::prover_receive_hash),
          (const char*)(&diff.content), sizeof(std::uint64_t));
      
      ++Protocol::pDiffIx;
      if (b) {
        out[i] = bases[i] + diff;
      } else {
        out[i] = bases[i];
      }
    }
    return out;
  } else if constexpr (role == Role::Input) {
    Protocol::choices.push_back(x);
    Protocol::pNumDiff += n;
    std::array<Zp, n> out;
    for (std::size_t i = 0; i < n; ++i) {
      out[i] = Zp { x };
    }
    return out;
  } else if constexpr (role == Role::Check) {
    const auto lSeed = Protocol::checkPrg();
    const auto rSeed = lSeed ^ Protocol::check_delta;

    const auto ls = randomArray<n>(lSeed);
    const auto rs = randomArray<n>(rSeed);

    std::array<Zp, n> out;
    for (std::size_t i = 0; i < n; ++i) {
      const auto diff = ls[i] + ys[i] - rs[i];
      SHA256_Update(&(Protocol::prover_check_hash),
          (const char*)(&diff.content), sizeof(std::uint64_t));

      // TODO check each message
      out[i] = Zp { 0 } - ls[i];
    }
    return out;
  }
}


template <size_t k, Role role, size_t n>
std::array<std::array<Zp, k>, n>
oleProject(
    const std::array<Zp, n>& ys,
    const Known<role == Role::Input, Zp>& x) {
  if constexpr (role == Role::Input) {
    assert(x->content < ((std::uint64_t)1 << k));
  }

  std::array<std::array<Zp, k>, n> ss;

  std::uint64_t bits;
  if constexpr (role == Role::Input) { bits = x->content; }
  std::uint64_t mask = 1;

  for (std::size_t i = 0; i < k; ++i) {
    bool bi = false;
    if constexpr (role == Role::Input) { bi = (bits & mask) > 0; }

    const auto ssi = ot<role, n>(ys, bi);
    for (std::size_t j = 0; j < n; ++j) {
      ss[j][i] = ssi[j];
    }
    mask <<= 1;
  }
  return ss;
}


template <size_t n>
Zp inject(const std::array<Zp, n>& bits) {
  Zp s { 0 };
  for (std::size_t i = 0; i < n; ++i) {
    s = s + (bits[i] << i);
  }
  return s;
}


template <size_t n, Role role>
std::pair<Zp, Zp>
ole(
    const Zp& y0,
    const Zp& y1,
    const Known<role == Role::Input, Zp>& x) {
  const auto [p0, p1] = oleProject<n, role, 2>({ y0, y1 }, x);
  return { inject<n>(p0), inject<n>(p1) };
}


template <size_t n, Role role>
Zp ole(
    const Zp& y,
    const Known<role == Role::Input, Zp>& x) {
  const auto [p] = oleProject<n, role, 1>({ y }, x);
  return inject<n>(p);
}

template <Role role>
void prove0(const Zp& s) {

  if constexpr (role == Role::Input) {
    if (s.content != 0) {
      std::cerr << "ERROR! Nonzero proof!: " << s << '\n';
    }
  }
  if constexpr (role == Role::Verifier) {
    const auto toHash = (Zp { 0 } - s).content;
    Protocol::verifierLog << toHash << '\n';
    SHA256_Update(&(Protocol::verifierHash),
        (const char*)(&toHash), sizeof(std::uint64_t));
  }
  if constexpr (role == Role::Check) {
    const auto toHash = (Zp { 0 } - s).content;
    Protocol::checkLog << toHash << '\n';
    SHA256_Update(&(Protocol::checkHash),
        (const char*)(&toHash), sizeof(std::uint64_t));
  }
  if constexpr (role == Role::Prover) {
    Protocol::proverLog << s.content << '\n';
    SHA256_Update(&(Protocol::proverHash),
        (const char*)(&(s.content)), sizeof(std::uint64_t));
  }
}


template <Role role>
Known<role == Role::Prover, bool>
sendSelect(const Known<role == Role::Input, bool>& x) {
  if constexpr (role == Role::Input) {
    Protocol::selects.push_back(x);
  }
  bool out;
  if constexpr (role == Role::Prover) {
    out = Protocol::selects[Protocol::numSelects];
    ++Protocol::numSelects;
  }
  return out;
}


template <Role role>
void dispatchRandomOts() {
  const auto vcount =
    send<role, Role::Verifier, Role::Input, std::size_t>(Protocol::choices.size());
  const auto vdiff =
    send<role, Role::Verifier, Role::Input, std::size_t>(Protocol::pNumDiff);
  if constexpr (role == Role::Verifier) {
		  std::cout << vcount << ' ' << vdiff << std::endl;
    Protocol::vNumDiff = *vdiff;
    Protocol::vDiffBuffer.resize(Protocol::vNumDiff * 5);
    Protocol::randomOts = FOT::sendSeeds(*primary(), *secondary(), *tertiary(), vcount);
    Protocol::num_ot = *vcount;
  } else if constexpr (role == Role::Input) {
    Protocol::randomReceipts = FOT::recvSeeds(*primary(), *secondary(), *tertiary(), Protocol::choices);
  } else if constexpr (role == Role::Check) {
    // no action needed
  }
}


template <Role role>
void setupHash() {
  if constexpr (role == Role::Verifier) {
    SHA256_Init(&(Protocol::verifierHash));
  } else if constexpr (role == Role::Prover) {
    SHA256_Init(&(Protocol::proverHash));
    SHA256_Init(&(Protocol::prover_receive_hash));
  } else if constexpr (role == Role::Check) {
    SHA256_Init(&(Protocol::checkHash));
    SHA256_Init(&(Protocol::prover_check_hash));
  }
}

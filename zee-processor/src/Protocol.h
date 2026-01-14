#ifndef PROTOCOL_H__
#define PROTOCOL_H__

#include <Share.h>
#include <OT/Ferret.h>
#include <openssl/sha.h> // SHA 256


using namespace GT;


using Message = std::bitset<128>;
using Messages = std::vector<Message>;
using Choices = std::vector<bool>;

struct Protocol {
  static Zp delta;

  // OT related
  static Choices choices;
  static size_t num_ot;
  static FOT::SeedSetup randomOts;
  static Messages randomReceipts;
  static std::size_t randomVIndex;
  static std::size_t randomPIndex;
  static std::vector<char> vDiffBuffer;
  static std::size_t vDiffIx;
  static std::size_t vNumDiff;
  static std::vector<char> pDiffBuffer;
  static std::size_t pDiffIx;
  static std::size_t pNumDiff;

  // The zero label for each OT
  static std::vector<std::bitset<128>> pOtZerosBuffer;
  static std::vector<std::bitset<128>> vOtZerosBuffer;

  static std::size_t numSelects;
  static std::vector<bool> selects;

  static std::size_t nCycles;


  static std::bitset<128> check_delta;

  // randomness
  static std::bitset<128> vSeed;
  static PRG vPrg;
  static PRG checkPrg;


  static SHA256_CTX verifierHash;
  static SHA256_CTX proverHash;
  static SHA256_CTX checkHash;

  static SHA256_CTX prover_receive_hash;
  static SHA256_CTX prover_check_hash;

  static std::ofstream verifierLog;
  static std::ofstream proverLog;
  static std::ofstream checkLog;
};

template <Role role>
void setupHash();

template <Role role>
void dispatchRandomOts();

template <Role role>
void prove0(const Zp&);

#include <Protocol.hpp>
#include <Share.hpp>

#endif

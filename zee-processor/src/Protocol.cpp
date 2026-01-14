#include <Protocol.h>

#include <openssl/sha.h> // SHA 256

#include <sstream>
#include <iostream>


size_t Protocol::num_ot = 0;


Zp Protocol::delta;


Choices Protocol::choices;
FOT::SeedSetup Protocol::randomOts;
Messages Protocol::randomReceipts;
std::size_t Protocol::randomVIndex = 0;
std::size_t Protocol::randomPIndex = 0;
std::vector<char> Protocol::vDiffBuffer;
std::size_t Protocol::vDiffIx = 0;
std::size_t Protocol::vNumDiff = 0;
std::vector<char> Protocol::pDiffBuffer;
std::size_t Protocol::pDiffIx = 0;
std::size_t Protocol::pNumDiff = 0;

  // The zero label for each OT
std::vector<std::bitset<128>> Protocol::pOtZerosBuffer;
std::vector<std::bitset<128>> Protocol::vOtZerosBuffer;

std::size_t Protocol::numSelects = 0;
std::vector<bool> Protocol::selects = { };

std::size_t Protocol::nCycles = 0;

std::bitset<128> Protocol::check_delta = 0;

std::bitset<128> Protocol::vSeed;
PRG Protocol::vPrg;
PRG Protocol::checkPrg;

/**
 * The Prover's objective is to provide a list of 0 values to the verifier.
 * For efficiency, we use a hash function to compress all of these values together
 * into a single 256 bit value.
 */
SHA256_CTX Protocol::verifierHash;
SHA256_CTX Protocol::proverHash;
SHA256_CTX Protocol::checkHash;

SHA256_CTX Protocol::prover_receive_hash;
SHA256_CTX Protocol::prover_check_hash;


std::ofstream Protocol::verifierLog("verifier.txt");
std::ofstream Protocol::proverLog("prover.txt");
std::ofstream Protocol::checkLog("check.txt");

#include <boost/asio.hpp>
#include <iostream>
#include <fstream>
#include <sstream>
#include <chrono>

#include <Cpu.h>
#include <Channel.h>
#include <Hash.h>

boost::asio::io_service ioservice;

std::iostream* server(boost::asio::ip::tcp::acceptor* acceptor) {
  using namespace boost::asio;
  auto channel = new ip::tcp::iostream();
  acceptor->accept(*(channel->rdbuf()));
  return channel;
}


std::iostream* client(int port) {
  return new boost::asio::ip::tcp::iostream("127.0.0.1", std::to_string(port));
}


template <typename F>
auto timed(const F& f) {
  auto start = std::chrono::high_resolution_clock::now();
  f();
  auto finish = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double> elapsed = finish - start;
  return elapsed.count();
}


template <typename Int>
std::vector<Int> readLines(std::fstream& f, std::size_t nlines) {
  Int v;
  std::vector<Int> out;
  for (std::size_t i = 0; i < nlines; ++i) {
    f >> v;
    f.ignore(std::numeric_limits<std::streamsize>::max(), '\n'); // skip to next line
    out.push_back(v);
  }
  return out;
}


int main(int argc, char** argv) {
  if (argc < 5) {
    std::cerr << "Usage: " << argv[0] << " P/V <port> <mem-size> <program-filename>\n";
    std::exit(1);
  }
  bool prover;
  if (strcmp(argv[1], "P") == 0) { prover = true; }
  else if (strcmp(argv[1], "V") == 0) { prover = false; }
  else {
    std::cerr << "Please select P or V\n";
    std::exit(1);
  }
  const int clientPort = atoi(argv[2]);
  const int serverPort = atoi(argv[2]);
  const std::size_t memSize = atoi(argv[3]);

  std::fstream f(argv[4], std::fstream::in);
  if (!f) {
    std::cerr << "Could not open file '" << argv[4] << "'. Aborting.\n";
    std::exit(1);
  }

  std::size_t datalen, textlen;
  f >> datalen;
  f >> textlen;
  f >> std::hex;

  auto data = readLines<std::uint32_t>(f, datalen);
  for (auto& d: data) {
    // swap the order of bytes
    std::uint8_t bytes[4];
    std::memcpy(bytes, &d, 4);
    std::swap(bytes[0], bytes[3]);
    std::swap(bytes[1], bytes[2]);
    std::memcpy(&d, bytes, 4);
  }

  const auto program = readLines<std::uint64_t>(f, textlen);

  f.close();

  if (prover) {
    std::cout << "I am the prover\n";
    auto endpoint = new boost::asio::ip::tcp::endpoint(boost::asio::ip::tcp::v4(), serverPort);
    auto acceptor = new boost::asio::ip::tcp::acceptor(ioservice, *endpoint);
    theChannel() = server(acceptor);
    primary() = new emp::NetIO { "127.0.0.1", 12345 };
    secondary() = new emp::NetIO { "127.0.0.1", 12346 };
    tertiary() = new emp::NetIO { "127.0.0.1", 12347 };
    exec<Role::Input>(program, data, memSize);
    auto time = timed([&] {

      exec<Role::Prover>(program, data, memSize);

      // commit to the witness
      std::bitset<256> pdigest;

      std::bitset<128> commitment_opening = PRG()();
      SHA256_Update(&(Protocol::proverHash),
          (const char*)(&commitment_opening), 16);

      SHA256_Final((unsigned char*)&pdigest, &Protocol::proverHash);

      sendMessage(32, (const char*)&pdigest);
      theChannel()->flush();

      std::bitset<256> received_digest;
      SHA256_Final((unsigned char*)&received_digest, &Protocol::prover_receive_hash);


      Protocol::randomOts = {};
      Protocol::randomReceipts = {};
      Protocol::pDiffBuffer = {};
      Protocol::vDiffBuffer = {};
      Protocol::pOtZerosBuffer = {};
      Protocol::vOtZerosBuffer = {};
      Protocol::choices = {};
      Protocol::selects = {};

      // BEGIN CHECK STEP

      std::bitset<128> check_seed;
      recvMessage(16, (char*)&check_seed);
      recvMessage(16, (char*)&Protocol::check_delta);
      recvMessage(sizeof(Zp), (char*)&Protocol::delta);
      Protocol::checkPrg = check_seed;

      exec<Role::Check>(program, data, memSize);

      std::bitset<256> cdigest;
      SHA256_Update(&(Protocol::checkHash), (const char*)(&commitment_opening), 16);
      SHA256_Final((unsigned char*)&cdigest, &Protocol::checkHash);

      std::bitset<256> checked_digest;
      SHA256_Final((unsigned char*)&checked_digest, &Protocol::prover_check_hash);

      if (cdigest == pdigest && received_digest == checked_digest) {
        // send the witness
        sendMessage(16, (const char*)&commitment_opening);
        theChannel()->flush();
      } else {
        std::cerr << "The verifier attempted to cheat!\n";
        sendMessage(32, (const char*)&pdigest);
		theChannel()->flush();
        // std::exit(1);
      }
    });
    std::cout << time << '\n';
  } else {
    std::cout << "I am the verifier\n";
    theChannel() = client(clientPort);
    primary() = new emp::NetIO { nullptr, 12345 };
    secondary() = new emp::NetIO { nullptr, 12346 };
    tertiary() = new emp::NetIO { nullptr, 12347 };

    Protocol::vSeed = PRG()();
    Protocol::vPrg = Protocol::vSeed;

    auto time = timed([&] {
      exec<Role::Verifier>(program, data, memSize);

      // receive the commitment
      std::bitset<256> commitment;
      recvMessage(32, (char*)&commitment);


      const auto correlation = Protocol::randomOts.correlation;
      Protocol::randomOts = {};
      Protocol::randomReceipts = {};
      Protocol::pDiffBuffer = {};
      Protocol::vDiffBuffer = {};
      Protocol::pOtZerosBuffer = {};
      Protocol::vOtZerosBuffer = {};
      Protocol::choices = {};
      Protocol::selects = {};

      // BEGIN CHECK STEP


      // send all randomness
      sendMessage(16, (const char*)&Protocol::vSeed);
      sendMessage(16, (const char*)&correlation);
      sendMessage(sizeof(Zp), (const char*)&Protocol::delta);
	  theChannel()->flush();

      // Receive the witness from the prover
      std::bitset<128> commitment_opening;
      recvMessage(16, (char*)&commitment_opening);

      std::bitset<256> vdigest;
      SHA256_Update(&(Protocol::verifierHash),
          (const char*)(&commitment_opening), 16);

      // Check the commitment and check the witness matches the expected
      // value.
      SHA256_Final((unsigned char*)&vdigest, &Protocol::verifierHash);
      if (commitment == vdigest) {
        std::cerr << "I am convinced!\n";
      } else {
        std::cerr << "I am not convinced!\n";
        // std::exit(1);
      }

    });
    std::cout << time << '\n';
  };
}

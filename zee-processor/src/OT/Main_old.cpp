/* #include <MExtension.h> */
/* #include <boost/asio.hpp> */
/* #include <emp-tool/emp-tool.h> */
#include <emp-ot/ferret/ferret_cot.h>


/* using Message = std::bitset<128>; */
/* using Messages = std::vector<Message>; */
/* using Choices = std::vector<bool>; */


/* boost::asio::io_service ioservice; */

/* std::iostream* server(boost::asio::ip::tcp::acceptor* acceptor) { */
/*   using namespace boost::asio; */
/*   auto channel = new ip::tcp::iostream(); */
/*   acceptor->accept(*(channel->rdbuf())); */
/*   return channel; */
/* } */


/* std::iostream* client(int port) { */
/*   return new boost::asio::ip::tcp::iostream("127.0.0.1", std::to_string(port)); */
/* } */




int main() {

  /* FerretCOT(int party, T * ios[threads+1], bool malicious = false, bool run_setup = true, std::string pre_file=""); */
  std::thread sender { [&] {
    emp::NetIO* ios[2];
    ios[0] = new emp::NetIO("127.0.0.1", 33333);
    ios[1] = new emp::NetIO("127.0.0.1", 33334);

    ios[0]->sync();
    FerretCOT<NetIO, 1>* ot = new FerretCOT<NetIO, 1>(emp::ALICE, ios, true);

    /* emp::PRG prg; */
    /* emp::block delta; */
    /* emp::block one = emp::makeBlock(0xFFFFFFFFFFFFFFFFLL,0xFFFFFFFFFFFFFFFELL); */
    /* prg.random_block(&delta); */
    /* delta = delta & one; */
    /* delta = delta ^ 0x1; */
    /* ot->setup(delta); */


    emp::block* messages = new emp::block[1];
    messages[0] = emp::makeBlock(0, 1);

    ot->rcot(messages, 1);
  } };
  std::thread receiver { [&] {
    emp::NetIO* ios[2];
    ios[0] = new emp::NetIO(nullptr, 33333);
    ios[1] = new emp::NetIO(nullptr, 33334);

    FerretCOT<NetIO, 1>* ot = new FerretCOT<NetIO, 1>(emp::BOB, ios, true);

    /* ot->setup(); */

    ios[0]->sync();
    emp::block* messages = new emp::block[1];
    bool choices[1];
    choices[0] = false;
    ot->rcot(messages, 1);

    std::cout << messages[0] << '\n';
  } };

  sender.join();
  receiver.join();

  /* const int port = 33333; */

  /* auto endpoint = new boost::asio::ip::tcp::endpoint(boost::asio::ip::tcp::v4(), port); */
  /* auto acceptor = new boost::asio::ip::tcp::acceptor(ioservice, *endpoint); */

  /* std::bitset<128> b0, b1; */

  /* { */
  /*   std::thread sender { [&] { */
  /*     auto* s = server(acceptor); */
  /*     const auto ms = OT::send(*s, 2); */
  /*     b0 = ms[0].first; */
  /*   } }; */

  /*   std::thread receiver { [&] { */
  /*     auto* c = client(port); */

  /*     auto ms = OT::recv(*c, { 0, 0 }); */
  /*     b1 = ms[0]; */
  /*   } }; */

  /*   sender.join(); */
  /*   receiver.join(); */
  /*   std::cout << (b0 ^ b1) << '\n'; */
  /* } */
  /* { */
  /*   std::thread sender { [&] { */
  /*     auto* s = server(acceptor); */
  /*     const auto ms = OT::send(*s, 2); */
  /*     b0 = ms[0].second; */
  /*   } }; */

  /*   std::thread receiver { [&] { */
  /*     auto* c = client(port); */

  /*     auto ms = OT::recv(*c, { 1, 0 }); */
  /*     b1 = ms[0]; */
  /*   } }; */

  /*   sender.join(); */
  /*   receiver.join(); */

  /*   std::cout << (b0 ^ b1) << '\n'; */
  /* } */
  /* { */
  /*   std::thread sender { [&] { */
  /*     auto* s = server(acceptor); */
  /*     const auto ms = OT::send(*s, 2); */
  /*     b0 = ms[1].first; */
  /*   } }; */

  /*   std::thread receiver { [&] { */
  /*     auto* c = client(port); */

  /*     auto ms = OT::recv(*c, { 0, 0 }); */
  /*     b1 = ms[1]; */
  /*   } }; */

  /*   sender.join(); */
  /*   receiver.join(); */

  /*   std::cout << (b0 ^ b1) << '\n'; */
  /* } */
}

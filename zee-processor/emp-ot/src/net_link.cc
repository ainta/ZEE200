#include "net_link.h"
#include <emp-tool/emp-tool.h>


namespace GT {


struct EmpIO {
  EmpIO(const char* address, int port) {
    netio = new emp::NetIO(address, port, true);
  }

  EmpIO(const EmpIO&) = delete;
  EmpIO(EmpIO&&) = delete;
  EmpIO& operator=(EmpIO&&) = delete;
  EmpIO& operator=(const EmpIO&) = delete;

  ~EmpIO() {
    delete netio;
  }
  emp::NetIO* netio;
};


NetLink::NetLink() { }
NetLink::NetLink(const char* address, int port) {
  io = std::make_unique<EmpIO>(address, port);
}


void NetLink::send(std::span<const std::byte> s) {
  io->netio->send_data(s.data(), s.size());
}


void NetLink::recv(std::span<std::byte> s) {
  io->netio->recv_data(s.data(), s.size());
}


void NetLink::flush() {
  io->netio->flush();
}


NetLink::~NetLink() = default;


}

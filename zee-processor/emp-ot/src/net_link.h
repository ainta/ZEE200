#ifndef NET_LINK_H__
#define NET_LINK_H__

#include "link.h"
#include <memory>


namespace GT {


struct EmpIO;


struct NetLink : public Link {
public:
  NetLink();
  NetLink(const char* address, int port);

  void send(std::span<const std::byte> s);
  void recv(std::span<std::byte>);

  ~NetLink();

  void flush();

private:
  std::unique_ptr<EmpIO> io;
};


}


#endif

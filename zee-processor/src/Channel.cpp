#include <Channel.h>
#include <fstream>

std::iostream* theChannel_;

std::iostream*& theChannel() { return theChannel_; }

emp::NetIO* primary_;
emp::NetIO* secondary_;
emp::NetIO* tertiary_;


emp::NetIO*& primary() { return primary_; }
emp::NetIO*& secondary() { return secondary_; }
emp::NetIO*& tertiary() { return tertiary_; }

// std::ofstream sout("./send.log");
// std::ofstream rout("./recv.log");


void sendMessage(uint64_t n, const char* s) {
  (*theChannel()).write(s, n);
  // for (int i = 0; i < n; i++) sout << int(s[i]) << std::endl;  
}


void recvMessage(uint64_t n, char* s) {
  (*theChannel()).read(s, n);
  // for (int i = 0; i < n; i++) rout << int(s[i]) << std::endl;  
}

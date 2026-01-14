#ifndef CHANNEL_H__
#define CHANNEL_H__


#include <Role.h>
#include <array>
#include <iostream>
#include <emp-tool/io/net_io_channel.h>


std::iostream*& theChannel();
emp::NetIO*& primary();
emp::NetIO*& secondary();
emp::NetIO*& tertiary();


void sendMessage(uint64_t, const char*);
void recvMessage(uint64_t, char*);


template <Role role, Role receiver, Role sender, typename T>
Known<role == receiver, T>
send(const Known<role == sender, T>& payload) {
  if constexpr (role == sender) {
    sendMessage(sizeof(T), (const char*)(&(*payload)));
  }
  if constexpr (role == receiver) {
    T out;
    recvMessage(sizeof(T), (char*)(&out));
    return out;
  } else {
    return {};
  }
}


template <Role role, Role receiver, Role sender, typename T>
T share(const Known<role == sender, T>& payload) {
  const auto received = send<receiver>(payload);
  if constexpr (role == sender) {
    return *payload;
  } else {
    return *received;
  }
}


#endif

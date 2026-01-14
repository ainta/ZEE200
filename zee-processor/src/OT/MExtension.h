#ifndef OT_M_EXTENSION_H__
#define OT_M_EXTENSION_H__


#include <vector>
#include <bitset>


namespace OT {

std::vector<std::pair<std::bitset<128>, std::bitset<128>>> send(std::iostream&, std::size_t);
std::vector<std::bitset<128>> recv(std::iostream&, const std::vector<bool>&);

}

#endif

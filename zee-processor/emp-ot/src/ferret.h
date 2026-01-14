#ifndef GT_FERRET_COT_H__
#define GT_FERRET_COT_H__

#include "role.h"
#include "link.h"
#include <vector>
#include <bitset>

namespace GT {

template <OTModel model>
std::vector<std::bitset<128>> ferret_recv(Link& link, std::size_t n);

template <OTModel model>
std::vector<std::bitset<128>> ferret_send(Link& link, std::size_t n, std::bitset<128>& delta);

}

#endif

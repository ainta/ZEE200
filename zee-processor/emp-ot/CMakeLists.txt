cmake_minimum_required (VERSION 3.10)
project (Harp)
set(NAME "Harp")

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()


add_definitions(-Wfatal-errors)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_FLAGS "-pthread -Wall -march=native -O3 -maes -mrdseed")

if (APPLE)
  set(OPENSSL_ROOT_DIR "/usr/local/opt/openssl")
endif()
find_package(OpenSSL REQUIRED)
find_package(emp-tool REQUIRED)


set(sources
  src/ferret.cc
  src/net_link.cc
  src/base.cc
  src/point.cc)


add_library(Harp ${sources})
target_include_directories(Harp PUBLIC src ${EMP-TOOL_INCLUDE_DIR} ${OPENSSL_INCLUDE_DIR})
target_link_libraries(Harp ${EMP-TOOL_LIBRARY} ${OPENSSL_LIBRARIES})

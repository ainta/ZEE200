cmake_minimum_required (VERSION 3.10)
project (ZKMachine)
set(NAME "ZKMachine")

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()


add_definitions(-Wfatal-errors)
add_definitions(-DBOOST_ERROR_CODE_HEADER_ONLY)

set(CMAKE_CXX_FLAGS "-pthread -Wall -march=native -O3 -maes -mrdseed -std=c++2a")

set(CMAKE_CXX_FLAGS_DEBUG "-g -std=c++2a")
set(CMAKE_CXX_FLAGS_RELEASE "-O3 -DNDEBUG -std=c++2a")

find_package(OpenSSL REQUIRED)
find_package(emp-tool REQUIRED)
find_package(emp-ot REQUIRED)


set(sources
  src/Zp.cpp
  src/Protocol.cpp
  src/Channel.cpp
  src/Permute.cpp
  src/PRF.cpp
  src/Oracle.cpp
  src/Main.cpp
  src/hash.cpp

  src/OT/Ferret.cpp
  src/OT/BaseOT.cpp
  src/OT/Hash.cpp
  src/OT/MExtension.cpp
  src/OT/Point.cpp)


add_executable(ZKMachine ${sources})
target_include_directories(
  ZKMachine
  PUBLIC
  src
  src/OT
  ${EMP-TOOL_INCLUDE_DIR}
  ${OPENSSL_INCLUDE_DIR})
target_link_libraries(
  ZKMachine
  ${EMP-TOOL_LIBRARY}
  ${OPENSSL_LIBRARIES})

add_executable(Assembler src/Assembler.cpp)

add_executable(
  OT
  src/OT/Main.cpp
  src/OT/Ferret.cpp
  src/PRF.cpp
  src/Zp.cpp
  src/Channel.cpp
  )
target_link_libraries(
  OT
  ${EMP-TOOL_LIBRARY}
  ${OPENSSL_LIBRARIES})
target_include_directories(
  OT
  PUBLIC
  src
  src/OT
  ${EMP-TOOL_INCLUDE_DIR}
  ${OPENSSL_INCLUDE_DIR})

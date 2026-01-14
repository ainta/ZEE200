cmake_minimum_required (VERSION 3.10)
project (ClearMachine)
set(NAME "ClearMachine")

add_definitions(-Wfatal-errors)

set (CMAKE_CXX_STANDARD 17)
set(sources src/Main.cpp src/Oracle.cpp)

add_executable(${NAME} ${sources})

option(DEBUG_IMM "Debug IMM Mode" OFF)
option(STATS "Debug IMM Mode" OFF)

if(DEBUG_IMM)
    message("DEBUG_IMM ON")
    add_definitions(-DDEBUG_IMM)
endif()

if(STATS)
    message("STATS ON")
    add_definitions(-DSTATS)
endif()

add_executable(zkassembler src/zkassembler.cpp src/as2hex.cpp)
target_include_directories(${NAME} PUBLIC src)

add_executable(hex2char src/hex2char.cpp)
target_include_directories(${NAME} PUBLIC src)

add_executable(char2hex src/char2hex.cpp)
target_include_directories(${NAME} PUBLIC src)

add_executable(isaconverter src/isaconverter.cpp)
target_include_directories(${NAME} PUBLIC src)

add_executable(gendata src/gen_data.cpp)
target_include_directories(${NAME} PUBLIC src)

cmake_minimum_required (VERSION 3.10)
project (ClearMachine)
set(NAME "ClearMachine")

add_definitions(-Wfatal-errors)

set (CMAKE_CXX_STANDARD 20)
set(sources src/Main.cpp)

add_executable(${NAME} ${sources})
target_include_directories(${NAME} PUBLIC src)

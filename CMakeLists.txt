cmake_minimum_required(VERSION 3.10)
project (emp-zk)
set(NAME "emp-zk")

find_path(CMAKE_FOLDER NAMES cmake/emp-tool-config.cmake)
include(${CMAKE_FOLDER}/cmake/emp-base.cmake)

find_package(emp-ot REQUIRED)
include_directories(${EMP-OT_INCLUDE_DIRS})
set(sources
  emp-zk/emp-zk-bool/emp-zk-bool.cpp
  emp-zk/emp-zk-arith/emp-zk-arith.cpp
)
add_library(${NAME} SHARED ${sources})
target_compile_features(${NAME} PUBLIC cxx_std_17)
set_target_properties(${NAME} PROPERTIES
  CXX_STANDARD 17
  CXX_STANDARD_REQUIRED ON
  CXX_EXTENSIONS OFF
)

install(DIRECTORY emp-zk DESTINATION include/)
install(FILES cmake/emp-zk-config.cmake DESTINATION cmake/)
install(TARGETS ${NAME} DESTINATION lib)

# Main ZEE200 zkVM driver (not just a unit test).
add_executable(test_zkvm_generic_asm_test
  zkvm/generic_asm_test.cpp
)
target_compile_features(test_zkvm_generic_asm_test PRIVATE cxx_std_17)
set_target_properties(test_zkvm_generic_asm_test PROPERTIES
  CXX_STANDARD 17
  CXX_STANDARD_REQUIRED ON
  CXX_EXTENSIONS OFF
)
target_link_libraries(test_zkvm_generic_asm_test
  ${EMP-OT_LIBRARIES}
  emp-zk
)

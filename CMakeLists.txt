cmake_minimum_required (VERSION 3.0)
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

install(DIRECTORY emp-zk DESTINATION include/)
install(FILES cmake/emp-zk-config.cmake DESTINATION cmake/)
install(TARGETS ${NAME} DESTINATION lib)

ENABLE_TESTING()

# Main ZEE200 zkVM driver (not just a unit test).
add_executable(test_zkvm_generic_asm_test
  zkvm/generic_asm_test.cpp
)
target_link_libraries(test_zkvm_generic_asm_test
  ${EMP-OT_LIBRARIES}
  emp-zk
)
add_test(
  NAME zkvm_generic_asm_test
  COMMAND "./run" "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/test_zkvm_generic_asm_test"
  WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}/"
)

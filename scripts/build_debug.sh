#!/bin/bash
set -e

# Build Debug binary: bin/test_zkvm_generic_asm_test with asserts enabled.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="${ROOT_DIR}/build"

echo "Root dir : ${ROOT_DIR}"
echo "Build dir: ${BUILD_DIR}"

mkdir -p "${BUILD_DIR}"

echo "Configuring CMake with Debug build type (asserts on)..."
cmake -B "${BUILD_DIR}" -S "${ROOT_DIR}" -DCMAKE_BUILD_TYPE=Debug

echo "Building test_zkvm_generic_asm_test in Debug mode..."
cmake --build "${BUILD_DIR}" --target test_zkvm_generic_asm_test -- -j"$(nproc 2>/dev/null || echo 8)"

echo "Debug binary: ${BUILD_DIR}/bin/test_zkvm_generic_asm_test"


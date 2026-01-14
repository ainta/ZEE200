#!/bin/bash
set -e

# Build optimized (Release) binary: bin/test_zkvm_generic_asm_test

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="${ROOT_DIR}/build"

echo "Root dir : ${ROOT_DIR}"
echo "Build dir: ${BUILD_DIR}"

mkdir -p "${BUILD_DIR}"

echo "Configuring CMake with Release build type (optimized, asserts off)..."
cmake -B "${BUILD_DIR}" -S "${ROOT_DIR}" -DCMAKE_BUILD_TYPE=Release

echo "Building test_zkvm_generic_asm_test in Release mode..."
cmake --build "${BUILD_DIR}" --target test_zkvm_generic_asm_test -- -j"$(nproc 2>/dev/null || echo 8)"

echo "Release binary: ${BUILD_DIR}/bin/test_zkvm_generic_asm_test"


#!/usr/bin/env bash
set -euo pipefail

# EMP changed its default branches after the paper experiments.  Pin the
# dependencies to the commits that were current when the artifact was created.
EMP_TOOL_COMMIT="802b5d4fb7cc7fcaadd411cd6aa5e72ed4dd57fd"
EMP_OT_COMMIT="a603ca0c77fcda37b9d088bd692111f67a4bef96"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SETUP_DIR="${ROOT_DIR}/setup"

if command -v nproc >/dev/null 2>&1; then
  JOBS="$(nproc)"
elif command -v sysctl >/dev/null 2>&1; then
  JOBS="$(sysctl -n hw.ncpu)"
else
  JOBS=8
fi

install_system_deps() {
  if [[ "$(uname)" == "Darwin" ]]; then
    command -v brew >/dev/null 2>&1 || {
      echo "Homebrew is required on macOS." >&2
      exit 1
    }
    brew list openssl >/dev/null 2>&1 || brew install openssl
    brew list pkg-config >/dev/null 2>&1 || brew install pkg-config
    brew list cmake >/dev/null 2>&1 || brew install cmake
    brew list boost >/dev/null 2>&1 || brew install boost
  elif command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update || echo "Warning: apt-get update failed; continuing with existing package lists." >&2
    sudo apt-get install -y \
      build-essential \
      clang \
      cmake \
      emacs \
      git \
      iftop \
      iperf \
      libboost-all-dev \
      libssl-dev
  elif command -v yum >/dev/null 2>&1; then
    sudo yum install -y python3 gcc gcc-c++ make git cmake openssl-devel boost-devel
  else
    echo "Unsupported package manager. Install CMake, a C++ compiler, Git, OpenSSL, and Boost manually." >&2
  fi
}

cmake_extra_args=()
if [[ "$(uname)" == "Darwin" ]] && command -v brew >/dev/null 2>&1; then
  if openssl_prefix="$(brew --prefix openssl 2>/dev/null)"; then
    cmake_extra_args+=("-DOPENSSL_ROOT_DIR=${openssl_prefix}")
  fi
fi

install_emp_repo() {
  local repo="$1"
  local commit="$2"
  local url="https://github.com/emp-toolkit/${repo}.git"
  local dir="${SETUP_DIR}/${repo}"

  if [[ -d "${dir}/.git" ]]; then
    git -C "${dir}" fetch origin "${commit}"
  else
    git clone "${url}" "${dir}"
  fi

  git -C "${dir}" checkout --detach "${commit}"
  cmake -S "${dir}" -B "${dir}/build" \
    -DCMAKE_BUILD_TYPE=Release \
    "${cmake_extra_args[@]}"
  cmake --build "${dir}/build" --target "${repo}" -j"${JOBS}"
  sudo cmake --install "${dir}/build"
}

install_system_deps

mkdir -p "${SETUP_DIR}"
install_emp_repo emp-tool "${EMP_TOOL_COMMIT}"
install_emp_repo emp-ot "${EMP_OT_COMMIT}"

#!/usr/bin/env bash

ARCH=$(uname -m)
ARCH=${ARCH:-amd64}
echo "Architecture is: $ARCH"

GO_VERSION=${GO_VERSION:-1.19}
echo "Golang version is: ${GO_VERSION}"

function setup_go {
  # Return if golang is already installed.
  if [ -d "/usr/local/go" ]; then
    echo "Golang is already installed"
    return
  fi

  if [[ $ARCH == x86_64* ]]; then
    wget -qO- "https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz" | tar -C /usr/local -xz
  elif  [[ $ARCH == arm* ]] || [[ $ARCH = aarch64 ]]; then
    wget -qO- "https://go.dev/dl/go${GO_VERSION}.linux-arm64.tar.gz" | tar -C /usr/local -xz
  fi

  # Add to go bin to PATH.
  echo 'export PATH=$PATH:/usr/local/go/bin' >> "$HOME"/.profile
}

setup_go

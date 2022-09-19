#!/bin/bash

# Install Rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --quiet --default-toolchain stable --no-modify-path -y

# Install packages from Cargo
~/.cargo/bin/cargo install \
  lsd \
  ripgrep \
  &

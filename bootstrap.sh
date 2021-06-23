#!/usr/bin/sh

# Spin-specific bootstrapping
if [ $SPIN ]; then

  sudo apt-get install -y \
    build-essential \
    htop \
    vim
    
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --quiet --profile default --no-modify-path -y

  cargo install \
    lsd \
    ripgrep \
    starship \
    zoxide

fi

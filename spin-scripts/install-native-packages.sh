#!/bin/bash

# Install Ubuntu packages
sudo apt-get install -y \
  build-essential \
  htop \
  vim

# Install binaries
curl -sS https://starship.rs/install.sh | sh -s -- --yes=1
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

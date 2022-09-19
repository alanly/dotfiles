#!/bin/bash

# Install Ubuntu packages
sudo apt-get install -y \
  build-essential \
  htop \
  vim

# Install Starship prompt
curl -sS https://starship.rs/install.sh | sh -s -- --yes=1

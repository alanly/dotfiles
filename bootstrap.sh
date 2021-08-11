#!/bin/bash

# Spin-specific bootstrapping
if [ $SPIN ]; then

  # Install dependencies
  bash ~/dotfiles/spin-scripts/install-native-packages.sh
  bash ~/dotfiles/spin-scripts/install-rust-packages.sh
  
  # Symlink configs
  bash ~/dotfiles/spin-scripts/link-configs.sh

fi

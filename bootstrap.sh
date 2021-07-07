#!/bin/bash

# Spin-specific bootstrapping
if [ $SPIN ]; then

  # Install dependencies
  bash ~/dotfiles/spin-scripts/install-native-packages.sh
  bash ~/dotfiles/spin-scripts/install-rust-packages.sh
  
  # Symlink configs
  bash ~/dotfiles/spin-scripts/link-configs.sh
  
  # Bootstrap `shopify` specific things
  if [ $SPIN_SHOPIFY_SERVICE_FQDN ]; then
    bash ~/dotfiles/spin-scripts/boot-hedwig-workers.sh
  fi

fi

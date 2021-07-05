#!/usr/bin/sh

# Spin-specific bootstrapping
if [ $SPIN ]; then

  # Install Ubuntu packages
  sudo apt-get install -y \
    build-essential \
    htop \
    vim
    
  # Install Rustup
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --quiet --profile default --no-modify-path -y

  # Install packages from Cargo
  ~/.cargo/bin/cargo install \
    lsd \
    ripgrep \
    starship \
    zoxide
    
  # Link Starship configuration
  ln -sf ~/dotfiles/.config/starship.toml ~/.config/starship.toml
  
  # Link Git configuration
  ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
  
  # Link Vim configuration
  ln -sf ~/dotfiles/.vimrc ~/.vimrc
  
  # Link Zsh configuration
  ln -sf ~/dotfiles/.zshrc ~/.zshrc
  
  # Link modified Spin `server` command for Core
  ln -sf ~/dotfiles/spin-bin/core-server.sh ~/.spin/bin/server
  chmod +x ~/.spin/bin/server

fi

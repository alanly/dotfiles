#!/usr/bin/sh

# Core
brew install \
  aria2 \
  chruby \
  chruby-fish \
  exa \
  ffmpeg \
  fish \
  git \
  openssh \
  ripgrep \
  ruby-install \
  telnet \
  wget

# Cask
brew cask install \
  1password \
  alfred \
  android-platform-tools \
  appcleaner \
  bartender \
  filebot \
  inssider \
  java \
  slack \
  steam \
  spectacle \
  tidal \
  transmit \
  visual-studio-code \
  vlc

# Versions
brew tap caskroom/versions  
brew cask install \
  firefoxdeveloperedition \
  google-chrome-beta \
  iterm2-nightly

# Fonts
brew tap caskroom/fonts
brew cask install \
  font-fira-code \
  font-input
  
# Drivers
brew tap caskroom/drivers
brew cask install \
  logitech-options


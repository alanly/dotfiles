#!/usr/bin/sh

# Grab sudo
sudo true

# Core
brew install \
  aria2 \
  autojump \
  chruby \
  chruby-fish \
  exa \
  ffmpeg \
  fish \
  git \
  golang \
  mtr \
  openssh \
  python3 \
  reattach-to-user-namespace \
  ripgrep \
  ruby-install \
  rust \
  telnet \
  tmux \
  wget \
  youtube-dl

# Cask
brew cask install \
  1password \
  aerial \
  alfred \
  android-platform-tools \
  appcleaner \
  bartender \
  devdocs \
  filebot \
  google-drive-file-stream \
  insomnia \
  inssider \
  java \
  musicbrainz-picard \
  slack \
  steam \
  spectacle \
  transmit \
  visual-studio-code

# Versions
brew tap caskroom/versions  
brew cask install \
  docker-edge \
  google-chrome-beta \
  vlc-nightly

# Fonts
brew tap caskroom/fonts
brew cask install \
  font-ibm-plex
  
# Drivers
brew tap caskroom/drivers
brew cask install \
  logitech-options

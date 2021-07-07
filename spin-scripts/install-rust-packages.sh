# Install Rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --quiet --profile default --no-modify-path -y

# Install packages from Cargo
~/.cargo/bin/cargo install \
  lsd \
  ripgrep \
  starship \
  zoxide

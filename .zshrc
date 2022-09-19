export LANG="en_US.UTF-8"
export PATH="$HOME/.cargo/bin:/usr/local/sbin:$PATH"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

alias g="git"
alias sc="systemctl"
alias jc="journalctl"

if typeset -f dev > /dev/null; then
  alias d="dev"
fi

if [ $SPIN ]; then
  alias f='rgfzf() { rg --files -g '\''!*.rbi'\'' | fzf --query "$1" --bind "enter:accept+execute-silent(code -r {})" }; rgfzf'
  alias rc="ruby ~/dotfiles/spin-scripts/refresh_constellation.rb"
  export PATH="$HOME/.local/bin:$PATH"
fi

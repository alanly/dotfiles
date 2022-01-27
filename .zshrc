export LANG="en_US.UTF-8"
export PATH="$HOME/.cargo/bin:/usr/local/sbin:$PATH"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

alias d="dev"
alias g="git"
alias sc="systemctl"
alias jc="journalctl"
alias f='rgfzf() { rg --files -g '\''!*.rbi'\'' | fzf --query "$1" --bind "enter:accept+execute-silent(code -r {})" }; rgfzf'

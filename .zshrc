eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export LANG="en_US.UTF-8"
export GOPATH="/Users/alan/go"
export PATH="/usr/local/sbin:$PATH"

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
if [ -e /Users/alan/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/alan/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

alias be="bundle exec"
alias d="dev"
alias dt="dev test"
alias dtc="dev typecheck"
alias g="git"

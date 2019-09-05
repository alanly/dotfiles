export PATH=$HOME/.cargo/bin:/usr/local/sbin:$PATH
export ZSH="/Users/alan/.oh-my-zsh"
export LANG="en_US.UTF-8"

ZSH_THEME="miloshadzic"
COMPLETION_WAITING_DOTS="true"
DISABLED_UNTRACKED_FILES_DIRTY="true"
plugins=(git ruby)

source $ZSH/oh-my-zsh.sh

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

ulimit -S -n 2048

alias d="dev"
alias g="git"
alias dt="dev test"
alias dtc="dev typecheck"

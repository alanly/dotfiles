export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(rails git ruby)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export SSH_KEY_PATH="$HOME/.ssh/id_ed25519"
export DEFAULT_USER="alanly"

unalias be
function be {
  bundle check || bundle install && bundle exec $@
}

function rt {
  if grep -q "spring-commands-testunit" Gemfile; then
    bundle check || bundle install && bundle exec spring testunit $@
  else
    bundle check || bundle install && bundle exec ruby -Itest $@
  fi
}

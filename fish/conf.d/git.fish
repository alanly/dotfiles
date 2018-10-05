# Aliases for 'git'
alias g="git"
alias grm="g fetch origin master; and g rebase origin/master"
alias gcl="g br --merged | grep --invert-match 'master' | xargs git br -d"

function gco
  g fetch origin $argv; and g checkout $argv
end

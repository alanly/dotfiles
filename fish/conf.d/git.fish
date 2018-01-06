# Aliases for 'git'
alias g="git"
alias grm="g fetch origin master; and g rebase origin/master"

function gco
  g fetch origin $argv; and g checkout $argv
end

if test -f /opt/dev/dev.fish
  source /opt/dev/dev.fish
end

[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

alias e='exa'

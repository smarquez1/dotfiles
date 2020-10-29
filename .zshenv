# Get the system type in a variable: Linux/Darwin
SYSTEM_TYPE=$(uname -s)
# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}
# GPG (needed by yadm)
export GPG_TTY=$(tty)
# Use nvim as manpager `:h Man`
export MANPAGER='nvim +Man!'
# Git
alias g=git
# Neovim replaces Vi/Vim
alias vi=nvim
alias vim=nvim
alias v=nvim
# Bundler aliases
alias b="bundle"
alias be="bundle exec"
alias bi="bundle install"
alias bu="bundle update"
# Rails aliases
alias rs="bundle exec rails s"
alias rc="bundle exec rails c"
# Wget resume by defaut
alias wget='wget -c'
# VSCode
alias vscode="/usr/local/bin/code"
# Code directory
alias code="cd ~/code"
# Open
[ "$SYSTEM_TYPE" = "Linux" ] && alias open='xdg-open'

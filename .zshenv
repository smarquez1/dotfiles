# Get the system type in a variable: Linux/Darwin
SYSTEM_TYPE=$(uname -s)
# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}
# GPG (needed by yadm)
export GPG_TTY=$(tty)
# Use nvim as manpager `:h Man`
export MANPAGER='nvim +Man!'
# Git
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gc="git commit -v"
alias gc!="git commit -v --amend"
alias gs="git status"
alias gp="git pull"
alias gm="git merge"
alias gp="git push"
alias gr="git rebase"
alias gra="git rebase --abort"
alias grc="git rebase --continue"
alias glog="git log --oneline --decorate --graph"
alias gfp="git fetch --prune"
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
alias rs="be rails s"
alias rc="be rails c"
alias rdm="be rake db:migrate"
alias rdr="br rake db:rollback"
# Wget resume by defaut
alias wget='wget -c'
# VSCode
alias vscode="/usr/local/bin/code"
# Code directory
alias code="cd ~/code"
# Open
[ "$SYSTEM_TYPE" = "Linux" ] && alias open='xdg-open'

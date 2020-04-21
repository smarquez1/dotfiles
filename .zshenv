source ~/.secrets

SYSTEM_TYPE=$(uname -s)

# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}

# Neovim replaces Vim
alias g=git
# Neovim replaces Vim
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
# Open
[ "$SYSTEM_TYPE" = "Linux" ] && alias open='xdg-open'

# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}

SYSTEM_TYPE=$(uname -s)

# Neovim replaces Vim
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
if [ "$SYSTEM_TYPE" = "Linux" ]; then
  alias open='xdg-open'
fi

# FZF
# export FZF_DEFAULT_COMMAND='fd --hidden --exclude ".git" .'; 
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Update System
le_update() {
  if [ "$SYSTEM_TYPE" = "Darwin" ]; then
    # Homebrew
    brew update && brew upgrade && brew cask upgrade && brew cleanup
  elif [ "$SYSTEM_TYPE" = "Linux" ]; then
    # Pacman
    sudo pacman -Syu --noconfirm
  fi

  # Tmux
  ~/.tmux/plugins/tpm/scripts/update_plugin.sh
  # Neovim
  nvim '+PlugUpgrade' '+PlugUpdate' '+PlugClean!' '+qall'
  # Zim
  zimfw update && zimfw upgrade
  # Rbenv plugins
  rbenv update
}

## Teleport shortcuts
alias tlogin="tsh --proxy=decisiv.sh:443 login --auth=okta"

# Ex tlsd builder
tlsd() {
	tsh ls --cluster=decisiv | grep app=$1 | grep -Eo '[^/"]+'
}

# Ex tshd builder-app-dev-1.dev.decisivapps.com
# Ex2 tshd builder-app-dev-1.dev.decisivapps.com tmux a
tshd() {
  tsh ssh --cluster=decisiv developers@$1 $2
}

tshdd() {
  tsh ssh --cluster=decisiv developers@$1.decisivapps.com
}

#!/bin/bash
SYSTEM_TYPE=$(uname -s)

# Update System
if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  # Homebrew
  brew update && brew upgrade && brew cask upgrade && brew cleanup
elif [ "$SYSTEM_TYPE" = "Linux" ]; then
  # Pacman + Aur
  yay -Syu --noconfirm
fi

# Tmux
~/.tmux/plugins/tpm/scripts/update_plugin.sh
# Neovim
nvim '+PlugUpgrade' '+PlugUpdate' '+PlugClean!' '+CocUpdate' '+qall'
sudo pip3 install pynvim --upgrade
# Zim
zimfw update && zimfw upgrade
# Rbenv plugins
# rbenv update

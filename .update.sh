#!/usr/bin/env bash

# Update mirrors
# sudo pacman-mirrors --country all && pacman -Syyu

# System
yay -Syu --devel --noconfirm
# Tmux
~/.tmux/plugins/tpm/scripts/update_plugin.sh
# Neovim
nvim '+PlugUpgrade' '+PlugUpdate' '+PlugClean!' '+qall'
# Zim
zmanage update
# Rbenv plugins
rbenv update

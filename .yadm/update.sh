#!/usr/bin/env bash
# System
yay -Syu --devel --noconfirm
# Base16
cd ~/.config/base16-shell && git pull && cd ~
# Tmux
~/.tmux/plugins/tpm/scripts/update_plugin.sh
# Neovim
nvim '+PlugUpgrade' '+PlugUpdate' '+PlugClean!' '+qall'
# Zim
sh ~/.zim/tools/zim_update
# Rbenv plugins
rbenv update
# Gnome Shell extensions
gnome-shell-extension-installer --update --yes
# Nodejs dependencies
yarn global upgrade

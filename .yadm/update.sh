#!/usr/bin/env bash
# System
yay -Syu --devel --noconfirm
# Tmux
~/.tmux/plugins/tpm/scripts/update_plugin.sh
# Neovim
nvim '+PlugUpgrade' '+PlugUpdate' '+PlugClean!' '+qall'
# Zim
sh ~/.zim/tools/zim_update
# Rbenv plugins
rbenv update
# Nodejs dependencies
yarn global upgrade

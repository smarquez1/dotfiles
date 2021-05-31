## User configuration sourced by interactive shells

source ~/.secrets

# load asdf
. /usr/local/opt/asdf/asdf.sh
# autostart TMUX
[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}

# Git
alias git="LANG=en git"
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

# Input/output
#
# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS
# Prompt for spelling correction of commands.
setopt CORRECT
# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52
# Change cursor shape for different vi modes.
function zle-keymap-select () {
  starship_render
  zle reset-prompt

  if [ $KEYMAP = vicmd ]; then
    echo -ne '\e[1 q'
  else
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select
echo -ne '\e[5 q' # Use beam shape cursor on startup.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# --------------------
# Module configuration
# --------------------

# input
#

# Append `../` to your input for each `.` you type after an initial `..`
zstyle ':zim:input' double-dot-expand yes

# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# ------------------
# Initialize modules
# ------------------

if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it does not exist or it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

source ~/.secrets

eval "$(starship init zsh)"
# Access yarn global executables globally
export PATH="$PATH:`yarn global bin`"
# Vim is default editor
export EDITOR=nvim
export VISUAL=$EDITOR
# TERM
export TERM="xterm-256color"
# Macos specific
if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  # Brew path
  export PATH="/usr/local/sbin:$PATH"
  # https://stackoverflow.com/questions/52941426/
  export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
fi

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

source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

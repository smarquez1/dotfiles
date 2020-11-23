source ~/.secrets

# Load p10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Access yarn global executables globally
export PATH="$PATH:`yarn global bin`"
# Vim is default editor
export EDITOR=nvim
export VISUAL=$EDITOR

# BAT colorscheme
export BAT_THEME=TwoDark

# Macos specific
if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  # Brew path
  export PATH="/usr/local/sbin:$PATH"
  # https://stackoverflow.com/questions/52941426/upgraded-to-macos-mojave-and-now-getting-error-in-rails-console
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
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v 
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# --------------------
# Module configuration
# --------------------

# fix completions not working (once a day)
# autoload -Uz compinit
# for dump in ~/.zcompdump(N.mh+24); do
#   compinit
# done
# compinit -C

# input
#

# Append `../` to your input for each `.` you type after an initial `..`
zstyle ':zim:input' double-dot-expand yes

# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor root)

# ------------------
# Initialize modules
# ------------------

if [[ ${ZIM_HOME}/zimfw.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

source ${ZIM_HOME}/init.zsh

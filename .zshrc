#  Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Initialize zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh
# load zgen
source "/usr/share/zsh/share/zgen.zsh"
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# yarn
export PATH="$(yarn global bin):$PATH"
# load aliases
source ".aliases"

# Vim is default editor
export EDITOR=nvim
export VISUAL=$EDITOR
# Report terminal type
export TERM=tmux-256color

# Prevent history to save duplicates
setopt hist_ignore_all_dups
# wait 10 seconds before really executing 'rm -rf *'
setopt RM_STAR_WAIT
# auto correct
setopt CORRECT

# Reattach tmux session
if [[ $TMUX = "" ]]; then
  tmux ls | grep -vq attached && TMUXARG="attach-session -d"
  exec eval "tmux $TMUXARG"
fi

# Zgen plugins
if ! zgen saved; then
  zgen oh-my-zsh

  zgen oh-my-zsh plugins/docker-compose
  zgen oh-my-zsh plugins/vi-mode
  zgen load denysdovhan/spaceship-prompt spaceship

  zgen save
fi

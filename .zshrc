#  Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Elixir
export PATH="$PATH:/path/to/elixir/bin"
# Initialize zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh
# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# yarn
export PATH="$(yarn global bin):$PATH"
# load aliases
source "$HOME/.aliases"

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

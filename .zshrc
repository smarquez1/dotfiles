#  Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Initialize zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh
# Base 16 shell
# BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-eighties.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# yarn
export PATH="$(yarn global bin):$PATH"

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

# Aliases
# =======
# Wget resume by defaut
alias wget='wget -c'
# Neovim replaces Vim
alias vim=nvim
alias v=nvim
# open
alias open='xdg-open'
# Bundler aliases
alias b="bundle"
alias be="bundle exec"
alias bi="bundle install"
alias bu="bundle update"
# Rbenv aliases
alias re="rbenv exec"
# Rails aliases
alias pspec="be rake parallel:spec $1"
# Update system and dependencies
alias le_update="~/.yadm/update.sh"

# Reattach tmux session
if [[ $TMUX = "" ]]; then
  tmux ls | grep -vq attached && TMUXARG="attach-session -d"
  exec eval "tmux $TMUXARG"
fi

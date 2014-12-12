# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Initialize zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh
# Base 16 shell
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-eighties.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
# NVM & AVN
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
#source /usr/share/nvm/nvm.sh
#source /usr/share/nvm/bash_completion
#source /usr/share/nvm/install-nvm-exec
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
#yarn
#export PATH="$PATH:`yarn global bin`"

# Vim is default editor
export EDITOR=nvim
export VISUAL=$EDITOR
# Report terminal type
export TERM=tmux-256color
# export TERM=screen-256color
# set locale to english
export LC_ALL=en_US.UTF-8

# Prevent history to save duplicates
setopt hist_ignore_all_dups
# wait 10 seconds before really executing 'rm -rf *'
setopt RM_STAR_WAIT
# auto correct
# setopt CORRECT

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
alias ber="bundle exec rails"
alias pspec="be rake parallel:spec $1"
# aliases for Tmux
alias tmux='tmux -2'
alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'

# Attach tmux session
if [[ $TMUX = "" ]]; then
  tmux ls | grep -vq attached && TMUXARG="attach-session -d"
  exec eval "tmux $TMUXARG"
fi

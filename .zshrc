system_type=$(uname -s)

# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Elixir
# export PATH="$PATH:/path/to/elixir/bin"

# Initialize zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Access yarn global executables globally
export PATH="$PATH:`yarn global bin`"

# load aliases
source "$HOME/.aliases"

# Vim is default editor
export EDITOR=nvim
export VISUAL=$EDITOR

# Brew path
if [ "$system_type" = "Darwin" ]; then
  export PATH="/usr/local/sbin:$PATH"
fi

# Report term
if [ "$system_type" = "Darwin" ]; then
  if [ -z "$TMUX" ]; then
    export TERM=xterm-256color
   else
     export TERM=screen-256color
   fi
 fi

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

## Teleport shortcuts
alias teleport_login="tsh --proxy=decisiv.sh:443 login --auth=okta"

# Ex tls_decisiv dev builder
function tls_decisiv() {
	command tsh ls --cluster=decisiv-$1 | grep app=$2 | grep -Eo '[^/"]+'
}

# Ex tsh_decisiv dev builder-app-dev-1.dev.decisivapps.com
# Ex2 tsh_decisiv dev builder-app-dev-1.dev.decisivapps.com tmux a
function tsh_decisiv() {
   command tsh ssh --cluster=decisiv-$1 developers@$2 $3
}

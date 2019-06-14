#  Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Elixir
export PATH="$PATH:/path/to/elixir/bin"
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
# Report term
if [ -z "$TMUX" ]; then
  export TERM=xterm-256color
else
  export TERM=tmux-256color
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

# teleport shortcuts
alias teleport_login="tsh --proxy=decisiv.sh:443 login --auth=okta"
alias tls_staging='tsh ls --cluster=decisiv-studebaker '
alias tls_prod='tsh ls --cluster=decisiv-prod '
alias tls_dev='tsh ls --cluster=decisiv-dev '
alias tls_qa='tsh ls --cluster=decisiv-qa '
alias tls_ud_prod='tsh ls --cluster=decisiv-ud-prod '
alias tls_misp_test='tsh ls --cluster=decisiv-misp_test '
alias tls_qa='tsh ls --cluster=decisiv-qa '

function tsh_staging() {
   command tsh ssh --cluster=decisiv-studebaker developers@$1
}

function tsh_prod() {
   command tsh ssh --cluster=decisiv-prod developers@$1
}

function tsh_dev() {
   command tsh ssh --cluster=decisiv-dev developers@$1
}

function tsh_qa() {
   command tsh ssh --cluster=decisiv-qa developers@$1
}

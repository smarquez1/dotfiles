## User configuration sourced by all invocations of the shell

# Get the system type in a variable: Linux/Darwin
SYSTEM_TYPE=$(uname -s)
# Vim is default editor
export EDITOR=nvim
export VISUAL=$EDITOR
# Use nvim as manpager `:h Man`
export MANPAGER='nvim +Man!'
# Bat configuration
export BAT_THEME="TwoDark"

# Macos specific
if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  # PSQL path
  export PATH="/usr/local/opt/postgresql@10/bin:$PATH"
  # Brew path
  export PATH="/usr/local/sbin:$PATH"
  # Yarn global path
  # export PATH="~/.config/yarn/global/node_modules/.bin:$PATH"
  # https://stackoverflow.com/questions/52941426/
  export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
  # Needed by yadm encrypt not to crash on pinentry
  export GPG_TTY=$(tty)
fi

# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}

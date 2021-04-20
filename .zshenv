# Get the system type in a variable: Linux/Darwin
SYSTEM_TYPE=$(uname -s)
# Vim is default editor
export EDITOR=nvim
export VISUAL=$EDITOR
# Access yarn global executables globally
export PATH="$PATH:`yarn global bin`"
# GPG (needed by yadm)
export GPG_TTY=$(tty)
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
  # https://stackoverflow.com/questions/52941426/
  export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
fi

# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}

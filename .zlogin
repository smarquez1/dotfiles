# User configuration sourced by login shells

# Initialize Zim
source ${ZIM_HOME}/login_init.zsh -q &!

# https://unix.stackexchange.com/questions/43601/how-can-i-set-my-default-shell-to-start-up-tmux
[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}

# Start tmux on login
# shell:
#   program: /bin/zsh
#   args:
#     - -l
#     - -c
#     - "tmux attach || tmux new -s 1"

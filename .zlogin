# Initialize Zim
source ${ZIM_HOME}/login_init.zsh -q &!

# Initialize rbenv
eval "$(rbenv init -)"

# ==============================
# Tmux
# ==============================

# Automatically start tmux on interactive SSH shell.
# if command -v tmux >/dev/null;
#     # If no tmux session is started, start a new session.
#     if tmux has-session; then
#         exec tmux attach
#     else
#         exec tmux new-session
#     fi
# fi

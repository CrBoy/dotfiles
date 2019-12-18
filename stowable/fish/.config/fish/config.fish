set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)


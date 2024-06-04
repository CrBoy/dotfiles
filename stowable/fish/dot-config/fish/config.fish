eval (/opt/homebrew/bin/brew shellenv)

set -g fish_user_paths "/usr/local/bin" "/usr/local/sbin" $fish_user_paths "/opt/homebrew/opt/python@3.12/libexec/bin"
set -x LANG en_US.UTF-8

# status --is-interactive; and source (pyenv init -|psub)
# status --is-interactive; and source (pyenv virtualenv-init -|psub)

alias ssh-add-all="find ~/.ssh/keys -type f ! -name '*.pub' | xargs ssh-add"

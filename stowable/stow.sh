#!/usr/bin/env bash

echo "Stowing..."

mkdir -p "$HOME/.config" && stow fish
stow vimrc && ./vimrc/install.sh
stow git
stow tmux

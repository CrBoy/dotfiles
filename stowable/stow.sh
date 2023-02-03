#!/usr/bin/env bash

echo "Stowing..."

stow stow
mkdir -p "$HOME/.config" && stow fish
stow vimrc && ./vimrc/install.sh
stow git
stow tmux

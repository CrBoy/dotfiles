#!/usr/bin/env bash

echo "Stowing..."

mkdir -p ~/.config && stow fish
stow vimrc && ./vimrc/install.sh
stow git
stow tmux


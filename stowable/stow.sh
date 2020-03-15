#!/usr/bin/env bash

echo "Stowing..."

mkdir -p "$HOME/.config" && stow fish
mkdir -p "$HOME/Library/Application Support/" && stow Spectacle
stow vimrc && ./vimrc/install.sh
stow git
stow tmux


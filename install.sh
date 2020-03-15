#!/bin/sh

INSTALL_DIR=~

if [ `uname` = "Linux" ]; then
	LN='ln -sin'
elif [ `uname` = "Darwin" ]; then
	LN='ln -sih'
fi

stow git && echo 'git stowed'
stow vimrc && vimrc/install.sh && echo 'vimrc stowed'
stow zshrc && echo 'zshrc stowed'
stow tmux && echo 'tmux stowed'

mkdir -p ../Library/Application\ Support/Spectacle && stow Spectacle && echo 'Spectacle stowed'


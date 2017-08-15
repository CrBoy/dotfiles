#!/bin/sh

INSTALL_DIR=~

if [ `uname` = "Linux" ]; then
	LN='ln -sin'
elif [ `uname` = "Darwin" ]; then
	LN='ln -sih'
fi

hash curl >/dev/null 2>&1 && {
	env curl -L http://install.ohmyz.sh | sh
} || {
	hash wget >/dev/null 2>&1 && {
		env wget --no-check-certificate http://install.ohmyz.sh -O- | sh
	} || {
		echo "Cannot install oh-my-zsh"
		exit
	}
}

stow git && echo 'git stowed'
stow vim && vim/install.sh && echo 'vim stowed'
stow zshrc && echo 'zshrc stowed'
stow tmux && echo 'tmux stowed'
stow Spectacle && echo 'Spectacle stowed'


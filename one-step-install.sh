#!/bin/sh

DOTFILES=~/_dotfiles

die(){
	echo "$1" >&2
	exit 1
}

[ -e "$DOTFILES" ] && die "$DOTFILES already exists."

git clone --recursive https://github.com/CrBoy/dotfiles.git "$DOTFILES"
cd "$DOTFILES"

./install.sh && echo "CrBoy's dotfiles installed."


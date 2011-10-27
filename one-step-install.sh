#!/bin/sh

DOTFILES=~/.dotfiles

die(){
	echo "$1" >&2
	exit 1
}

[ -e "$DOTFILES" ] && die "$DOTFILES already exists."

git clone git://github.com/CrBoy/dotfiles.git "$DOTFILES"
cd "$DOTFILES"
git submodule update --init

./install.sh

echo "CrBoy's dotfiles installed."


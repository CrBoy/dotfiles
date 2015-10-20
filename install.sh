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

${LN} $PWD/zshrc                 $INSTALL_DIR/.zshrc         && echo 'zshrc installed'
${LN} $PWD/ctags                 $INSTALL_DIR/.ctags         && echo 'ctags settings installed'
${LN} $PWD/gitconfig             $INSTALL_DIR/.gitconfig     && echo 'gitconfig installed'
${LN} $PWD/tmux.conf             $INSTALL_DIR/.tmux.conf     && echo 'tmux.conf installed'
${LN} $PWD/gdb                   $INSTALL_DIR/.gdb           && \
${LN} $INSTALL_DIR/.gdb/gdbinit  $INSTALL_DIR/.gdbinit       && echo 'gdb settings installed'


#!/bin/sh

INSTALL_DIR=~

if [ `uname` = "Linux" ]; then
	LN='ln -sin'
elif [ `uname` = "Darwin" ]; then
	LN='ln -sih'
fi

${LN} $PWD/zshrc                 $INSTALL_DIR/.zshrc         && echo 'zshrc installed'
${LN} $PWD/ctags                 $INSTALL_DIR/.ctags         && echo 'ctags settings installed'
${LN} $PWD/gitconfig             $INSTALL_DIR/.gitconfig     && echo 'gitconfig installed'
${LN} $PWD/gdb                   $INSTALL_DIR/.gdb           && echo 'gdb setting installed'
${LN} $INSTALL_DIR/.gdb/gdbinit  $INSTALL_DIR/.gdbinit       && echo 'gdbinit installed'
${LN} $PWD/tmux.conf             $INSTALL_DIR/.tmux.conf     && echo 'tmux.conf installed'



#!/bin/sh

INSTALL_DIR=~

ln -sih $PWD/zshrc                 $INSTALL_DIR/.zshrc         && echo 'zshrc installed'
ln -sih $PWD/ctags                 $INSTALL_DIR/.ctags         && echo 'ctags settings installed'
ln -sih $PWD/gitconfig             $INSTALL_DIR/.gitconfig     && echo 'gitconfig installed'
ln -sih $PWD/gdb                   $INSTALL_DIR/.gdb           && echo 'gdb setting installed'
ln -sih $INSTALL_DIR/.gdb/gdbinit  $INSTALL_DIR/.gdbinit       && echo 'gdbinit installed'
ln -sih $PWD/tmux.conf             $INSTALL_DIR/.tmux.conf     && echo 'tmux.conf installed'



#!/bin/sh

INSTALL_DIR=~

ln -si $PWD/zshrc           $INSTALL_DIR/.zshrc         && echo 'zshrc installed'
ln -si $PWD/ctags           $INSTALL_DIR/.ctags         && echo 'ctags installed'
ln -si $PWD/gitconfig       $INSTALL_DIR/.gitconfig     && echo 'gitconfig installed'
ln -si $PWD/gdb             $INSTALL_DIR/.gdb           &&
    ln -si $INSTALL_DIR/.gdb     $INSTALL_DIR/.gdbinit       && echo 'gdb installed'



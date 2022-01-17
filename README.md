CrBoy's Dotfiles
================
`Author: CrBoy (http://github.com/CrBoy)`

Introduction
------------
Here's some of my dotfiles in usual. A dotfile means those files begin with a `.`, e.g. `.zshrc`, `.screenrc`, or `.vimrc`. They usually stand for a configuration of some software.

If [git] and [stow] is installed on the machine, these settings could be installed by only one step on most of Unix-like OS.

[git]: https://git-scm.com/
[stow]: https://www.gnu.org/software/stow/

One-Step Install
----------------
**Prerequisite: Make sure GIT and [stow] is installed**

Using curl (MacOSX should have curl):

	curl -o- https://raw.githubusercontent.com/CrBoy/dotfiles/master/one-step-install.sh | sh

or wget (Linux often has wget):

	wget -O- https://raw.githubusercontent.com/CrBoy/dotfiles/master/one-step-install.sh | sh


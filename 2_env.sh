#!/bin/sh

cp $HOME/.bash_aliases $HOME/.bash_aliases_old
cp $HOME/.profile $HOME/.profile_old
cp $HOME/.vimrc $HOME/.vimrc_old
cp $HOME/.gitconfig $HOME/.gitconfig_old
cp .bash_aliases $HOME/
cp .profile $HOME/
cp .vimrc $HOME/
cp .gitconfig $HOME/

echo "Please log out and log back into your system"

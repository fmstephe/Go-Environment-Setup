#!/bin/sh

if [ -f $HOME/.bash_aliases ]
then
	mv $HOME/.bash_aliases $HOME/.bash_aliases_old
fi
if [ -f $HOME/.profile ]
then
	mv $HOME/.profile $HOME/.profile_old
fi
if [ -f $HOME/.vimrc ]
then
	mv $HOME/.vimrc $HOME/.vimrc_old
fi
if [ -f $HOME/.gitconfig ]
then
	mv $HOME/.gitconfig $HOME/.gitconfig_old
fi
cp .bash_aliases $HOME/
. $HOME/.bash_aliases
cp .profile $HOME/
. $HOME/.profile
cp .vimrc $HOME/
. $HOME/.vimrc
cp .gitconfig $HOME/
. $HOME/.gitconfig

echo "Please log out and log back into your system"

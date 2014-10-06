#!/bin/sh

if [ -f $HOME/.vimrc ]
then
	cp $HOME/.vimrc $HOME/.vimrc_old
fi
cp .vimrc $HOME/

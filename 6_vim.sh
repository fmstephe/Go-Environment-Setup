#!/bin/bash

if [ -f $HOME/.vimrc ]
then
	cp $HOME/.vimrc $HOME/.vimrc_old
fi
cp .vimrc $HOME/

mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

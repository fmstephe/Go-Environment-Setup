#!/bin/bash

if [ -f $HOME/.vimrc ]
then
	mv $HOME/.vimrc $HOME/.vimrc_old
fi
cp .vimrc $HOME/

if [ -d $HOME/.vim ]
then
	mv $HOME/.vim/ $HOME/.vim_old/
fi
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

vim +PluginInstall +qall

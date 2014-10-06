#!/bin/bash

if [ -f $HOME/.bash_aliases ]
then
	mv $HOME/.bash_aliases $HOME/.bash_aliases_old
fi
if [ -f $HOME/.profile ]
then
	mv $HOME/.profile $HOME/.profile_old
fi
cp .bash_aliases $HOME/
cp .profile $HOME/

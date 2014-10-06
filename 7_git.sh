#!/bin/bash

if [ -f $HOME/.gitconfig ]
then
	cp $HOME/.gitconfig $HOME/.gitconfig_old
fi
cp .gitconfig $HOME/

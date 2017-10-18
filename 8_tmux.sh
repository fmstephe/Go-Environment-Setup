#!/bin/bash

if [ -f $HOME/.tmux ]
then
	mv $HOME/.tmux $HOME/.tmux_old
fi
cp .tmux $HOME/

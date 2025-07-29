#!/bin/bash

sudo apt-get --assume-yes install golang

cd $HOME/golang
if [ ! -d $HOME/golang/go ]; then
	git clone https://go.googlesource.com/go
fi	

cd $HOME/golang/go/src
git checkout go1.22.1
# Don't actually build the source, just enjoy it as is
#./all.bash

which go

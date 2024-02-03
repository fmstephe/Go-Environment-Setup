#!/bin/bash

# install a bootstrapping version of Go to build the compiler
sudo apt-get --assume-yes install golang

cd $HOME/golang
if [ ! -d $HOME/golang/go ]; then
	git clone https://go.googlesource.com/go
fi	

cd $HOME/golang/go/src
git checkout go1.21.6
./all.bash

# Remove the bootstrap version of Go (if we had to install it)
sudo apt-get --assume-yes remove golang
sudo apt-get --assume-yes autoremove

which go

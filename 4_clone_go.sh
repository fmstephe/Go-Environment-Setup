#!/bin/bash

# install a bootstrapping version of Go to build the compiler
sudo apt-get --assume-yes install golang

cd $HOME/golang
git clone https://go.googlesource.com/go
cd $HOME/golang/go/src
git checkout go1.18.3
./all.bash

# Remove the bootstrap version of Go
sudo apt-get --assume-yes remove golang
sudo apt-get --assume-yes autoremove

which go

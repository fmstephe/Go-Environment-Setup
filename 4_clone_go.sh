#!/bin/bash

if [[ $(uname) == "Darwin" ]]
then
	wget https://storage.googleapis.com/golang/go1.18.3.darwin-amd64.tar.gz
	tar xvfz go1.18.3.darwin-amd64.tar.gz
	mv go $HOME/golang/
	rm go1.18.3.darwin-amd64.tar.gz
else
	wget https://go.dev/dl/go1.18.3.linux-arm64.tar.gz
	tar xvfz go1.18.3.linux-amd64.tar.gz
	mv go $HOME/golang/
	rm go1.18.3.linux-amd64.tar.gz
fi

cd $HOME/golang
git clone https://go.googlesource.com/go
cd $HOME/golang/go/src
git checkout go1.18.3
./make.bash


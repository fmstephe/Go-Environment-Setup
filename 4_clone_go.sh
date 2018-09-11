#!/bin/bash

if [[ $(uname) == "Darwin" ]]
then
	wget https://storage.googleapis.com/golang/go1.8.3.darwin-amd64.tar.gz
	tar xvfz go1.8.3.darwin-amd64.tar.gz
	mv go ../go1.4
	rm go1.8.3.darwin-amd64.tar.gz
else
	wget https://storage.googleapis.com/golang/go1.4.3.linux-amd64.tar.gz
	tar xvfz go1.4.3.linux-amd64.tar.gz
	mv go ../go1.4
	rm go1.4.3.linux-amd64.tar.gz
fi

# Setup bootstrap go version

cd $HOME/golang
git clone https://go.googlesource.com/go
cd $HOME/golang/go/src
git checkout release-branch.go1.11
./all.bash

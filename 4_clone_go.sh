#!/bin/bash

# Setup bootstrap go version
wget https://storage.googleapis.com/golang/go1.4.3.linux-amd64.tar.gz
tar xvfz go1.4.3.linux-amd64.tar.gz
mv go ../go1.4
rm go1.4.3.linux-amd64.tar.gz

cd $HOME/golang
git clone https://go.googlesource.com/go
cd $HOME/golang/go/src
git checkout release-branch.go1.6
./all.bash


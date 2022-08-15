#!/bin/bash

# NB: User needs to first install bootstrap go version

cd $HOME/golang
git clone https://go.googlesource.com/go
cd $HOME/golang/go/src
git checkout go1.18.3
./make.bash

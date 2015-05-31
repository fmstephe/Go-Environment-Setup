#!/bin/bash

cd $HOME/golang
git clone https://go.googlesource.com/go
cd $HOME/golang/go/src
git checkout release-branch.go1.4
./all.bash

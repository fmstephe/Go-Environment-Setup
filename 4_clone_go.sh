#!/bin/sh

cd $HOME/golang
hg clone -u weekly https://go.googlecode.com/hg/ go
cd $HOME/golang/go/src
./all.bash

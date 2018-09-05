#!/bin/bash

go get golang.org/x/tools/cmd/goimports
go install golang.org/x/tools/cmd/goimports

go get github.com/junegunn/fzf/src/fzf
go install github.com/junegunn/fzf/src/fzf

source $HOME/.bash_aliases
source $HOME/.profile

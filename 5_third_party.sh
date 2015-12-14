#!/bin/bash

go get github.com/skelterjohn/go-gb/gb
go install github.com/skelterjohn/go-gb/gb

go get golang.org/x/tools/cmd/goimports
go install golang.org/x/tools/cmd/goimports

source $HOME/.bash_aliases
source $HOME/.profile

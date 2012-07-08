#!/bin/sh

echo export GOLANG=\$HOME/golang  >> $HOME/.profile
echo export GOROOT=\$GOLANG/go  >> $HOME/.profile
echo export GOARCH=amd64  >> $HOME/.profile
echo export GOOS=linux  >> $HOME/.profile
echo export GOBIN=\$GOROOT/bin  >> $HOME/.profile
echo export GOPATH=\$GOLANG/proj  >> $HOME/.profile
echo PATH=\$PATH:\$GOPATH/bin:\$GOBIN >> $HOME/.profile

. ~/.profile

echo alias psrc=\"cd \$GOPATH/src/github.com/fmstephe\"  >> $HOME/.bash_aliases
echo alias gsrc=\"cd \$GOROOT/src/pkg\"  >> $HOME/.bash_aliases
echo alias gi=goinstall  >> $HOME/.bash_aliases


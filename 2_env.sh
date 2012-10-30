#!/bin/sh

echo export GOLANG=\$HOME/golang >> $HOME/.profile
echo export GOROOT=\$GOLANG/go >> $HOME/.profile
echo export GOARCH=amd64 >> $HOME/.profile
echo export GOOS=linux >> $HOME/.profile
echo export GOBIN=\$GOROOT/bin >> $HOME/.profile
echo export GOPATH=\$GOLANG/proj >> $HOME/.profile
echo PATH=\$PATH:\$GOPATH/bin:\$GOBIN >> $HOME/.profile

. ~/.profile

echo alias psrc=\"cd \$GOPATH/src/github.com/fmstephe\" >> $HOME/.bash_aliases
echo alias pkg=\"cd \$GOPATH/pkg\" >> $HOME/.bash_aliases
echo alias gsrc=\"cd \$GOROOT/src/pkg\" >> $HOME/.bash_aliases
echo alias gi=goinstall >> $HOME/.bash_aliases
echo alias gst=\"git status\" >> $HOME/.bash_aliases
echo alias gco=\"git checkout\" >> $HOME/.bash_aliases
echo alias gcm=\"git commit\" >> $HOME/.bash_aliases
echo alias gbr=\"git branch\" >> $HOME/.bash_aliases
echo alias glg=\"git log\" >> $HOME/.bash_aliases
echo alias pprof=\"go tool pprof\" >> $HOME/.bash_aliases
echo alias bnc=\"go test -bench='.*'\" >> $HOME/.bash_aliases
echo alias ls=\"ls -1\" >> $HOME/.bash_aliases

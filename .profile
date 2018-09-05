# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export PS1="\w $ "

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

source "$HOME/.rvm/scripts/rvm"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
export LESSCHARSET=utf-8
export GOLANG=$HOME/golang
export GOROOT=$GOLANG/go
export GOARCH=amd64
export GOOS=darwin
export GOBIN=$GOROOT/bin
export GOPATH=$GOLANG/proj
export GOMAXPROCS=4
export CFLAGS="-Wall"
PATH=$PATH:$GOPATH/bin:$GOBIN

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

. ~/.bash_aliases

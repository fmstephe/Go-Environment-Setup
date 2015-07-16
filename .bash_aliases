# Golang
function psrc() {
	cd $GOPATH/src/github.com/fmstephe
}

function bel() {
	cd $GOPATH/src/github.com/belua
}

function gsrc() {
	cd $GOROOT/src/pkg
}

function pkg() {
	cd $GOPATH/pkg
}

function killg() {
	ps -ef | grep $1 | awk -F ' ' '{print $2}' | xargs kill -9
}

function psg() {
	ps -ef | grep $1
}

alias tdis="rename 's/.go/.go.disabled/g' *test.go"
alias ten="rename 's/.go.disabled/.go/g' *test.go.disabled"

alias gbt="clear && time gb -t"
alias allGo="find . -name '*.go' | xargs"

#App Engine
alias aeserve="gofmt -w . && goapp serve --host 0.0.0.0"
alias aebuild="clear && gofmt -w . && goapp build"
alias aedeploy="gofmt -w . && goapp deploy"
alias aetest="clear gofmt -w . && goapp test"

# Git
alias gst="git status"
alias gco="git checkout"
alias gcm="git commit"
alias gbr="git branch -avv"
alias glg="git log --pretty=format:'%C(dim yellow)<%an> (%cr) %C(red)%h %C(dim white)%d%n%n%C(blue)%s%n%n%Creset%b%Creset%n'"
alias grp="git grep"


#Misc
alias hig="history | grep "
alias fswp="find . -name '*.swp'"
alias lll="ls -1"
alias lln="ls -1 | grep"

repeat() {
        n=$1
        shift
        while [ $(( n -= 1 )) -ge 0 ]
        do
                "$@"
        done
}


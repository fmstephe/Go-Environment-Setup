# Golang
alias psrc="cd $GOPATH/src/github.com/fmstephe"
alias bel="cd $GOPATH/src/github.com/belua"
alias gsrc="cd $GOROOT/src/pkg"
alias pkg="cd $GOPATH/pkg"
alias gbt="clear && time gb -t"
alias allGo="find . -name '*.go' | xargs"

#App Engine
alias serve="goapp serve"
alias build="goapp build"
alias deploy="goapp deploy"

# Git
alias gst="git status"
alias gco="git checkout"
alias gcm="git commit"
alias gbr="git branch -avv"
alias glg="git log --pretty=format:'%C(dim yellow)<%an> (%cr) %C(red)%h %C(dim white)%d%n%n%C(blue)%s%n%n%Creset%b%Creset%n'"

#Misc
alias hig="history | grep "

repeat() {
        n=$1
        shift
        while [ $(( n -= 1 )) -ge 0 ]
        do
                "$@"
        done
}


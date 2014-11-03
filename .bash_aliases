alias psrc="cd $GOPATH/src/github.com/fmstephe"
alias bel="cd $GOPATH/src/github.com/belua"
alias gsrc="cd $GOROOT/src/pkg"
alias pkg="cd $GOPATH/pkg"
alias gst="git status"
alias gco="git checkout"
alias gcm="git commit"
alias gbr="git branch -avv"
alias glg="git log --pretty=format:'%C(dim yellow)<%an> (%cr) %C(red)%h %C(dim white)%d%n%n%C(blue)%s%n%n%Creset%b%Creset%n'"
alias gbt="clear && time gb -t"

alias hig="history | grep "

repeat() {
        n=$1
        shift
        while [ $(( n -= 1 )) -ge 0 ]
        do
                "$@"
        done
}

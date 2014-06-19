alias psrc="cd $GOPATH/src/github.com/fmstephe"
alias pkg="cd $GOPATH/pkg"
alias gsrc="cd $GOROOT/src/pkg"
alias gi=goinstall
alias gst="git status"
alias gco="git checkout"
alias gcm="git commit"
alias gbr="git branch"
alias glg="git log --pretty=format:'%C(dim yellow)<%an> (%cr) %C(red)%h %C(dim white)%d%n%n%C(blue)%s%n%n%Creset%b%Creset%n'"
alias pprof="go tool pprof"
alias bnc="go test -bench=.*"
alias mk="clear && make"
alias clr="clear"
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

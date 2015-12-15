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

function aestop() {
	ps -ef | grep 'python.*dev_appserver' | awk -F ' ' '{print $2}' | xargs kill -9
}

function aelist() {
	ps -ef | grep 'python.*dev_appserver'
}

function killg() {
	ps -ef | grep $1 | awk -F ' ' '{print $2}' | xargs kill -9
}

function psg() {
	ps -ef | grep $1
}

function gr() {
	find . -name '*.go' | xargs sed -i 's/'$1'/'$2'/g'
}

function grpl() {
	grep -r --color=always --exclude-dir="\.git" $1 . | less -R
}

function do_in_subdirs()
{
	clear
        WD=`pwd`;
        for DIR in ${WD}/*;
        do
		cd ${DIR};
		$1
        done
	cd ${WD}
}

function echotest()
{
	do_in_subdirs ls
}

function git_fetch_in_dir()
{
	CURR_DIR=`pwd`;
	if test -e ${CURR_DIR}/.git;
	then
		echo ${CURR_DIR}
		git fetch
	fi
}

function fetchall() {
	do_in_subdirs git_fetch_in_dir
}

function git_status_in_dir()
{
	CURR_DIR=`pwd`;
	if test -e ${CURR_DIR}/.git;
	then
		S=`git status | grep ahead`
		S+=`git status | grep behind`
		S+=`git status --porcelain`;
		if [ "${S}" != "" ];
		then
			echo
			echo "-----------------"
			echo
			echo ${CURR_DIR}
			git status
		fi
	fi
}

function statusall() {
	do_in_subdirs git_status_in_dir
}

function git_rebase_in_dir()
{
	CURR_DIR=`pwd`;
	if test -e ${CURR_DIR}/.git;
	then
		git rebase
	fi
}

function rebaseall() {
	do_in_subdirs git_rebase_in_dir
}

alias tdis="rename 's/.go/.go.disabled/g' *test.go"
alias ten="rename 's/.go.disabled/.go/g' *test.go.disabled"

alias gbt="clear && time gb -t"
alias allGo="find . -name '*.go' | xargs"

#App Engine
function aeserve() {
	if [ -e portfile  ];
	then
		PORT=`cat portfile`;
	ADMIN_PORT=$PORT;
	((ADMIN_PORT+=1000))
		goapp serve --host 127.0.0.1 -port $PORT -admin_port $ADMIN_PORT;
	else
		echo "No portfile found";
	goapp serve --host 127.0.0.1;
	fi
}
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


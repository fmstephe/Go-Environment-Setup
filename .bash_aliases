function term() {
	gnome-terminal --working-directory=`pwd`
}

function termx() {
	gnome-terminal --working-directory=`pwd` && exit
}

# Golang
function psrc() {
	cd $GOPATH/src/github.com/fmstephe
}

# Golang Src
function gsrc() {
	cd $GOROOT/src
}

function adj() {
	cd $GOPATH/src/github.com/adjust
}

function kpi() {
	cd $GOPATH/src/github.com/adjust/kpi-service
}

function crash() {
	cd $GOPATH/src/github.com/adjust/perf_tools/crashlogs/crun
}

function profile() {
	cd $GOPATH/src/github.com/adjust/perf_tools/profile_collector
}


function back() {
	cd $GOPATH/src/github.com/adjust/backend
}

function profile() {
	cd ~/golang/proj/src/github.com/adjust/perf_tools/profile_collector
}

function buildBackend() {
	pushd `pwd`
	back
	go build $(go list ./... | grep -v vendor)
	popd
}

function testBackend() {
	pushd `pwd`
	back
	go test $(go list ./... | grep -v vendor)
	popd
}

function vend() {
	cd $GOPATH/src/github.com/adjust/backend-vendor
}

function psg() {
	ps -ef | grep $1
}

function gr() {
	find . -name 'vendor' -prune -o -name '*.go' -print | xargs sed -i "" -e 's/'$1'/'$2'/g'
}

function grpl() {
	grep -nrI --color=always --exclude-dir="\.git" $1 . | less -R
}

function srcg() {
	grep -nr -I --color=always --exclude-dir="\.git" --include=*.go --exclude=*_test.go $1 .
}

function srcgl() {
	grep -nr -I --color=always --exclude-dir="\.git" --include=*.go --exclude=*_test.go $1 . | less -R
}

function tstg() {
	grep -nr -I --color=always --exclude-dir="\.git" --include=*_test.go $1 .
}

function tstgl() {
	grep -nr -I --color=always --exclude-dir="\.git" --include=*_test.go $1 . | less -R
}

function clearLogs() {
	find . -name '*.log' -exec rm {} \;
}

function do_in_subdirs()
{
        local WD=`pwd`;
        for DIR in ${WD}/*;
        do
		if test -d ${DIR};
		then
			cd ${DIR};
			$1
			do_in_subdirs $1
		fi
        done
	cd ${WD}
}

function git_fetch_in_dir()
{
	local CURR_DIR=`pwd`;
	if test -e ${CURR_DIR}/.git;
	then
		echo $CURR_DIR
		git fetch
	fi
}

function fetchall() {
	clear
	do_in_subdirs git_fetch_in_dir
}

function git_status_in_dir()
{
	local CURR_DIR=`pwd`;
	if test -e ${CURR_DIR}/.git;
	then
		S=`git status | grep ahead`
		S+=`git status | grep behind`
		S+=`git status --porcelain`;
		if [ "${S}" != "" ];
		then
			echo $CURR_DIR
			echo
			echo "-----------------"
			echo
			git status
		fi
	fi
}

function statusall() {
	clear
	do_in_subdirs git_status_in_dir
}

function git_rebase_in_dir()
{
	local CURR_DIR=`pwd`;
	if test -e ${CURR_DIR}/.git;
	then
		R=`git rebase`
		GR=`echo ${R} | grep "is\sup\sto\sdate"`
		if [ "${GR}" == "" ];
		then
			echo $CURR_DIR
			echo ${R}
		fi
	fi
}

function rebaseall() {
	clear
	do_in_subdirs git_rebase_in_dir
}

function git_push_in_dir()
{
	local CURR_DIR=`pwd`;
	if test -e ${CURR_DIR}/.git;
	then
		git push
	fi
}

function pushall() {
	clear
	do_in_subdirs git_push_in_dir
}

function build_in_dir()
{
	local CURR_DIR=`pwd`;
	if test -e ${CURR_DIR}/main.go;
	then
		echo ${CURR_DIR}
		go build
	fi
}

function buildall() {
	clear
	do_in_subdirs build_in_dir
}

function test_in_dir()
{
	local CURR_DIR=`pwd`;
	if test -e ${CURR_DIR}/*_test.go;
	then
		echo ${CURR_DIR}
		go test
	fi
}

function testall() {
	clear
	do_in_subdirs test_in_dir
}

alias allGo="find . -name '*.go' | xargs"

function rnet() {
	sudo ifdown eth0
	sleep 1
	sudo ifup eth0
}

# Git
alias gst="git status"
alias gco="git checkout"
alias gcm="git commit"
alias gbr="git branch -vv"
alias glg="git log --pretty=format:'%C(dim yellow)<%an> (%cr) %C(red)%h %C(dim white)%d%n%n%C(blue)%s%n%n%Creset%b%Creset%n'"
alias glgr="git log --graph --pretty=format:'%C(dim yellow)<%an> (%cr) %C(red)%h %C(dim white)%d%n%n%C(blue)%s%n%n%Creset%b%Creset%n'"
alias grp="git grep"
alias gam_fpush="git commit -a --amend --no-edit && git push -f"
alias gdu="git diff @{upstream}"
alias grb="git rebase -i origin/master"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias gfrm="git fetch && git rebase origin/master"

function pushCosmeticRebase() {
	DIFF=$(git diff @{upstream})
	if [ "$DIFF" == "" ]
	then
		git push -f
	else
		echo "Can't push, branch differs from upstream"
		echo $DIFF
	fi
}

# Vim
function fv() {
	search=$(echo $1 | cut -f1 -d:)
	line=$(echo $1 | cut -f2 -d:)
	if [ "$search" == "$line"  ]
	then
		line=""
	fi
	path=""
	if [ "$search" != ""  ]
	then
		path=$(fzf -q $search)
	else
		path=$(fzf)
	fi
	if [ "$path" == ""  ]
	then
		return
	fi
	if [ "$line" == "" ]
	then
		vim $path
	else
		vim +$line $path
	fi
}

#Misc
alias hig="history | grep "
alias fswp="find ~/ -name '*.swp'"
alias lll="ls -1"
alias lln="ls -1 | grep"
alias ll="ls -l"

repeat() {
	n=$1
	shift
	while [ $(( n -= 1 )) -ge 0 ]
	do
		"$@"
	done
}


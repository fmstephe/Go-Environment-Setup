# Misc

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
	cd $GOPATH/src/github.com/adjust/perf_tools/profile
}

function perf() {
	cd $GOPATH/src/github.com/adjust/perf_tools
}

function back() {
	cd $GOPATH/src/github.com/adjust/backend
}

function psg() {
	ps -ef | grep $1
}

function gr() {
	find . -name 'vendor' -prune -o -name '*.go' -print | xargs sed -i "" -e 's/$1/$2/g'
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

function cnfg() {
	grep -nr -I --color=always --exclude-dir="\.git" --include=*.yml $1 .
}

function cnfgl() {
	grep -nr -I --color=always --exclude-dir="\.git" --include=*.yml $1 . | less -R
}

function tstg() {
	grep -nr -I --color=always --exclude-dir="\.git" --include=*_test.go $1 .
}

function tstgl() {
	grep -nr -I --color=always --exclude-dir="\.git" --include=*_test.go $1 . | less -R
}

alias allGo="find . -name '*.go' | xargs"

function rnet() {
	sudo ifdown eth0
	sleep 1
	sudo ifup eth0
}

# Go
alias buildTests="go test ./... -run a^"
alias gobuild="clear && go build ./..."
alias gotest="clear && go test ./..."
function dependantPackages() {
	OUTPUT=`go list -f {{.Deps}}`
	LINES=( $OUTPUT )
	printf "%s\n" "${LINES[@]}"
}

# Profiling
alias web_heap="pprof --http :8081 -source_path /Users/fmstephe/golang/proj -alloc_objects heap"
alias web_prof="pprof --http :8081 -source_path /Users/fmstephe/golang/proj profile"

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
alias gdf="clear && git diff ./"
alias grc="git rebase --continue"
alias grs="git rebase --skip"
alias gra="git rebase --abort"
alias gfrm="git fetch && git rebase origin/master"
alias gsh="git show HEAD"
alias gshn="git show HEAD --name-only"
alias grec="git reflog | egrep -io 'moving from ([^[:space:]]+)' | awk '{ print \$3 }' | awk ' !seen[\$0]++' | head -n10"
alias gdc="git log origin/master..HEAD --pretty=format:'%s' | sort | uniq -d"

function clearGone() {
	for branch in `git branch -vv | grep ': gone]' | awk '{print $1}'`; do
		echo "Delete $branch?"
		select yn in "Yes" "No"; do
			case $yn in
				Yes ) git branch -D $branch; break;;
				No ) ;;
			esac
		done
	done
}

# > to_deploy.sh <branch> <base_branch>
function to_deploy() {
	declare -r mains=$(go list -json ./... | jq --compact-output '. | select(.Name == "main") | {ImportPath: .ImportPath, Deps: .Deps}')
	declare -r changed=($(git diff --name-only origin/master...HEAD \
		    | grep -v '_test.go$' \
		    | grep '.go$' \
		    | xargs -I % dirname % \
		    | sort -u \
	))

	to_deploy=()

	for pkg in ${changed[@]}; do
		    to_deploy+=($(echo "$mains" | jq --raw-output ". | select(.Deps[] | endswith(\"$pkg\")) | .ImportPath"))
	done
	echo ${to_deploy[@]} | tr ' ' '\n' | sort -u
}

function grb() {
	MISSING=`git cherry -v HEAD origin/master`
	if [ "${MISSING}" != "" ]; then
		echo "${BRANCH} is not ahead of origin/master"
		echo "Please fetch and rebase"
	else
		git rebase -i origin/master
	fi
}

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


function kp() {
  kill -9 $(lsof -ti :${1})
}

function ff { osascript -e 'tell application "Finder"'\
 -e "if (${1-1} <= (count Finder windows)) then"\
 -e "get POSIX path of (target of window ${1-1} as alias)"\
 -e 'else' -e 'get POSIX path of (desktop as alias)'\
 -e 'end if' -e 'end tell'; };\

function cdff { cd "`ff $@`"; };

function marked(){
	open -a "Marked 2" $1
}

function vmarked(){
  touch $1
  marked $1
  vim $1
}
function tfep(){
	tfenv $1 plan -out plan ${2:*}
}

function tfeq(){
	tfenv $1 destroy -force ${2:*}
}

function tfa(){
	tf apply plan $*
}

function tfepa(){
	tfp $1 && tfa
}

eval "$(thefuck --alias frack)"
eval "$(hub alias -s)"

# Go forward in Git commit hierarchy, towards particular commit
# Usage:
#  gofwd v1.2.7
# Does nothing when the parameter is not specified.
gofwd() {
  git checkout `git rev-list --topo-order HEAD.."$*" | tail -1`
}

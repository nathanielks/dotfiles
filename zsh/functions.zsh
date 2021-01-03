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

function tp(){
	tf validate && tf plan -out plan ${*}
}

function tfa(){
	tf apply plan $*
}

# Go forward in Git commit hierarchy, towards particular commit
# Usage:
#  gofwd v1.2.7
# Does nothing when the parameter is not specified.
function gofwd() {
  git checkout `git rev-list --topo-order HEAD.."$*" | tail -1`
}

function generate_password () {
	local length="${1:-64}"
	cat /dev/random | tr -dc 'a-zA-Z0-9' | fold -w "$length" | head -n 1
}

function generate_hexadecimal () {
	local length="${1:-64}"
	cat /dev/random | tr -dc 'a-fA-F0-9' | fold -w "$length" | head -n 1
}

function count () {
  local content="${@}"

  echo "${content}" | wc -c
}

function hmdecode () {
  local url="$( echo "$1" | cut -d = -f 2-)"
  php -r "echo urldecode('$url');" | cut -d '&' -f 1 | pbcopy
}


function test_circle () {
  local job="$1"
  circleci config process .circleci/config.yml > circle.yml
  circleci local execute -c circle.yml --job "$job"
  rm circle.yml
}

function replace_all() {
  rg -l $1 | xargs gsed -i '' "s/$1/$2/g"
}

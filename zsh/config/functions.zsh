function gpsu() {
  git push --set-upstream origin $(git branch --show-current)
}

function kp() {
  kill -9 $(lsof -ti :${1})
}

# FIND PROCESS
function p(){
        ps aux | grep -i $1 | grep -v grep
}

# KILL ALL
function ka(){

    cnt=$( p $1 | wc -l)  # total count of processes found
    klevel=${2:-15}       # kill level, defaults to 15 if argument 2 is empty

    echo -e "\nSearching for '$1' -- Found" $cnt "Running Processes .. "
    p $1

    echo -e '\nTerminating' $cnt 'processes .. '

    ps aux  |  grep -i $1 |  grep -v grep   | awk '{print $2}' | xargs sudo kill -klevel
    echo -e "Done!\n"

    echo "Running search again:"
    p "$1"
    echo -e "\n"
}

function ff { osascript -e 'tell application "Finder"'\
 -e "if (${1-1} <= (count Finder windows)) then"\
 -e "get POSIX path of (target of window ${1-1} as alias)"\
 -e 'else' -e 'get POSIX path of (desktop as alias)'\
 -e 'end if' -e 'end tell'; };\

function cdff { cd "`ff $@`"; };

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

function generate_hex () {
	local length="${1:-64}"
	cat /dev/random | tr -dc 'a-fA-F0-9' | fold -w "$length" | head -n 1
}

function count () {
  local content="${@}"

  echo "${content}" | wc -c
}

function test_circle () {
  local job="$1"
  circleci config process .circleci/config.yml > circle.yml
  circleci local execute -c circle.yml --job "$job"
  rm circle.yml
}

function replace_all() {
  rg -l $1 | xargs gsed -i '' -e "s/$1/$2/g"
}

# Codi
# Usage: codi [filetype] [filename]
function codi() {
  local syntax="${1:-javascript}"
  shift
  vim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@"
}

function dsh () {
  docker exec -it $1 sh
}

function json () {
  echo $1 | jq '.'
}

function kssh () {
  local ip="$1"
  KEY_FLAG=
  SSH_KEY="${SSH_KEY:-}"
  if [[ -n "$SSH_KEY" ]]; then
    KEY_FLAG="-i $SSH_KEY"
    if [[ -f  "$SSH_KEY" ]]; then
      echo 'key exists, wtf'
    else
      echo 'key does not exist, wtf'
    fi
  fi
  
  kitty +kitten ssh -vv $KEY_FLAG ec2-user@$ip
}

alias reload!="source ~/.zshrc"
alias a='php artisan'
alias o='open . && fg';
alias y='yarn'
alias tkill='tmux kill-session -t'
alias vdu='vagrant destroy -f && vagrant up'
alias c="composer"
alias cu="composer update && ga . && gc -m 'updated composer'"
alias dc="docker-compose"
alias el="exa -la --group-directories-first"
alias gds="git delete-squashed"
alias gff="git flow finish"
alias gffs="git flow feature start"
alias gfrs="git flow release start"
alias gfrf="git flow release finish"
alias gfhs="git flow hotfix start"
alias gfhf="git flow hotfix finish"
alias goback='git checkout HEAD~'
alias grc="git rebase --continue"
alias gcod='gco develop'
alias gcos='gco staging'
alias gcom='gco main'
alias gbrl='g branch --list'
alias gpr='gh pull-request create'
alias gd='g diff'
alias gdt='g difftool'
alias gco="git checkout"
alias g="git"
alias gg="lazygit"
alias gupdate='gco master; gpa; g delete-merged-branches'
alias tf='terraform'
alias tfu='terraform force-unlock'
alias ta='terraform apply plan'
alias be='bundle exec'
alias bake='bundle exec rake'
alias rc='bundle exec rails c'
alias l='NVIM_TUI_ENABLE_TRUE_COLOR=1 lvim'
alias nv='NVIM_TUI_ENABLE_TRUE_COLOR=1 lvim'
# http://www.freshblurbs.com/blog/2017/04/16/inspect-docker-volumes-on-mac.html
# dm-disk ls -l /docker/var/lib/docker/volumes/
alias dm-disk='docker run --rm -it -v /:/docker alpine:edge $@'
alias rgjs="rg -g '*.js' -g '!*.min.js' -g '!**/node_modules/**/*'"
alias flush-dns='sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache'
alias git-pull-all="git pull && git submodule sync && git submodule foreach --recursive 'git fetch --tags' && git submodule update --init --recursive;"
alias gpa='git-pull-all'
alias gp='git push'
alias dgs="ls -l | grep '^d' | awk '{print \$9}' | xargs -I % -n 1 -P 8 bash -c 'cd %; git status --short 2>/dev/null | sed "'"s/.*/% &/"'"; cd ..;'"
alias rgphp="rg -tphp -g '!**/*/vendor' -g '!**/*/lib' -g '!lib/*' -g '!tests/*'"
alias typora="open -a typora"
alias nn="nnn -dHS"
alias pip=$(which pip3)
alias awsls="aws --endpoint ${LOCALSTACK_ENDPOINT}"
alias nip="npm install --package-lock-only"
alias nr="npm run"
alias nrw="npm run watch"
alias nrt="npm run test"

# Docker
alias docker-kill-all='docker kill $(docker ps -a -q)'
alias docker-stop-all='docker stop $(docker ps -a -q)'
alias docker-remove-all='docker rm $(docker ps -a -q)'
alias docker-cleanup='docker-stop-all; docker-remove-all; docker network prune --force'
alias docker-rmi-all='docker rmi $(docker images -a -q)'
alias runcircle='circleci config process .circleci/config.yml > /tmp/process.yml; circleci local execute -c /tmp/process.yml -e CIRCLE_PROJECT_REPONAME=${PWD##*/} --job '
alias sum_numbers='paste -s -d+ | bc'
alias find_servers='sudo nmap -sU -p 137,5353 --script nbstat,dns-service-discovery'
alias darkMode="2>/dev/null defaults read -g AppleInterfaceStyle"

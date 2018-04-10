alias reload!="source ~/.zshrc"
alias a='php artisan'
alias o='open . && fg';
alias tkill='tmux kill-session -t'
alias vdu='vagrant destroy -f && vagrant up'
alias ajdpush="composer update && bundle exec cap staging deploy && cd ../servers && ansible-playbook -i hosts/staging -K restart.yml"
alias c="composer"
alias cu="composer update && ga . && gc -m 'updated composer'"
alias dc="docker-compose"
alias e="exa -la"
alias gff="git flow finish"
alias gffs="git flow feature start"
alias gfrs="git flow release start"
alias gfrf="git flow release finish"
alias gfhs="git flow hotfix start"
alias gfhf="git flow hotfix finish"
alias goback='git checkout HEAD~'
alias gs="git status"
alias grc="git rebase --continue"
alias mm="middleman"
alias gcod='gco develop'
alias gcom='gco master'
alias gbrl='g branch --list'
alias gpr='g pull-request -b develop'
alias gd='g diff'
alias gdk='g difftool'
alias tf='terraform'
alias tp='terraform plan -out plan'
alias ta='terraform apply plan'
alias be='bundle exec'
alias bake='bundle exec rake'
alias rc='bundle exec rails c'
# alias git=hub
alias v=vagrant
alias ave='ansible-vault edit '
alias v='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias vim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias r='redux'
alias bvp='bv vagrant provision'
alias l='ls -lah --color'
# http://www.freshblurbs.com/blog/2017/04/16/inspect-docker-volumes-on-mac.html
# dm-disk ls -l /docker/var/lib/docker/volumes/
alias dm-disk='docker run --rm -it -v /:/docker alpine:edge $@'

alias flush-dns='sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache'

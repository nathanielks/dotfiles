# re-enable if you want to profile startup time
# zmodload zsh/zprof

# Package configuration
arch="$(arch)"
if [[ "$OS_TYPE" == "linux-gnu"* ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [[ $OSTYPE == darwin* ]]; then

  if [[ ! -L ~/.1password/agent.sock ]]; then
    # create standard location for 1Password SSH Agent
    mkdir -p ~/.1password && ln -s ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock ~/.1password/agent.sock
  fi

  source /Users/aang/Library/Application\ Support/org.dystroy.broot/launcher/bash/br
  if [[ "$arch" == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export PATH="/opt/homebrew/lib/ruby/gems/3.1.0/bin:/opt/homebrew/opt/ruby/bin:$PATH"
    export FZF_BASE=/opt/homebrew/opt/fzf 
  elif [[ "$arch" == "i386" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

[ -s "$NVM_DIR/zsh_completion" ] && \. "$NVM_DIR/zsh_completion"  # This loads nvm bash_completion
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
eval "$(pyenv init --path)" 
eval "$(pyenv init -)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
if type "limactl" > /dev/null; then
  source <(limactl completion zsh)
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases and Functions
# source every *.zsh file in the repo
for file ($DOTFILES/zsh/config/*.zsh) source $file
for file ($WORKDOTS/zsh/*.zsh) source $file

# iTerm2 Shell Integration
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# AutoCD
setopt auto_cd

# Add GOPATH to paths cd will go into
cdpath=($GOPATH)
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# re-enable if you want to profile startup time
# zprof
source "$HOME/.config/op/plugins.sh"


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/aang/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)



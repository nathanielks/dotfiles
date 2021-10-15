# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Package configuration
if [[ "$OS_TYPE" == "linux-gnu"* ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [[ $OSTYPE == darwin* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

[ -s "$NVM_DIR/zsh_completion" ] && \. "$NVM_DIR/zsh_completion"  # This loads nvm bash_completion
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
eval "$(pyenv init --path)" 
eval "$(pyenv init -)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
source "$HOME/.config/broot/launcher/bash/br"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases and Functions
# source every *.zsh file in the repo
for file ($DOTFILES/zsh/config/*.zsh) source $file

# iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# AutoCD
setopt auto_cd

# Add GOPATH to paths cd will go into
cdpath=($GOPATH)
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /Users/aang/.config/broot/launcher/bash/br

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


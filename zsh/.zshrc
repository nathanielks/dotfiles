# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/zsh_completion" ] && \. "$NVM_DIR/zsh_completion"  # This loads nvm bash_completion
eval "$(pyenv init -)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"


# Starship config
eval "$(starship init zsh)"

source /home/aang/.config/broot/launcher/zsh/br

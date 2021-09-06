# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Package configuration
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
[ -s "$NVM_DIR/zsh_completion" ] && \. "$NVM_DIR/zsh_completion"  # This loads nvm bash_completion
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
eval "$(pyenv init -)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
source "$HOME/.config/broot/launcher/zsh/br"

# Aliases and Functions
source "$HOME/.dotfiles/zsh/config/aliases.zsh"
source "$HOME/.dotfiles/zsh/config/functions.zsh"

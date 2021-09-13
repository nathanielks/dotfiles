#!/usr/bin/env bash

if [[ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]]; then
  git clone --recursive git@github.com:sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

if [[ ! -d "$HOME/.local/share/lunarvim" ]]; then
  bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
fi

for pkg in stow kitty nvm lvim; do
  bash "post-install.$pkg.sh"
done

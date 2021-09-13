#!/usr/bin/env bash

if [[ ! -d "$NVM_DIR" ]]; then
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
  source ~/.zshrc
  nvm install --lts
fi

#!/usr/bin/env bash
git clone https://github.com/nathanielks/dotfiles ~/.dotfiles
(cd ~/.dotfiles && bin/install-symlinks.sh)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PluginInstall +qall

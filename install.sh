#!/usr/bin/env bash
git clone https://github.com/nathanielks/dotfiles ~/dotfiles
(cd ~/dotfiles && rake install)
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

#!/usr/bin/env bash

CONTRIB="$HOME/.zprezto/contrib"

mkdir -p "$CONTRIB"
pushd $CONTRIB
# git submodule add -f https://github.com/lildude/fzf-prezto "$CONTRIB/fzf"
git clone https://github.com/Aloxaf/fzf-tab $CONTRIB/fzf-tab
popd

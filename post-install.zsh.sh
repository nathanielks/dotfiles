#!/usr/bin/env bash

CONTRIB="$HOME/.zprezto/contrib"

mkdir -p "$CONTRIB"
pushd $CONTRIB
git submodule add -f https://github.com/lildude/fzf-prezto "$CONTRIB/fzf"
popd

#!/usr/bin/env bash

for lang in javascript typescript vue json go python lua html css; do
  lvim +qall +LspInstall $lang
done

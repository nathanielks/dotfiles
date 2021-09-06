#!/usr/bin/env bash

for dir in zsh lvim git; do
  stow $dir
done

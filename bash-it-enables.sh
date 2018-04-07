#!/usr/bin/env bash
source "$HOME/.bashit_init"

for a in curl git general vagrant
do
  bash-it enable alias "$a"
done

for c in 'bash-it' brew composer dirs git ssh system vagrant virtualbox
do
  bash-it enable completion "$c"
done

for p in history
do
  bash-it enable plugin "$p"
done

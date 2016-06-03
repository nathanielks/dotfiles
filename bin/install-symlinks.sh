#!/usr/bin/env bash

shopt -s globstar

for FILE in **/*.symlink; do
  SOURCE="$(pwd)/$FILE"
  FILENAME=$(basename "$FILE" ".symlink")
  TARGET="$HOME/.$FILENAME"
  ln -si "$SOURCE" "$TARGET"
done

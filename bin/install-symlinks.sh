#!/usr/bin/env bash

for FILE in **/*.symlink; do
  SOURCE="$(pwd)/$FILE"
  FILENAME=$(basename "$FILE" ".symlink")
  TARGET="$HOME/.$FILENAME"
  ln -sif "$SOURCE" "$TARGET"
done

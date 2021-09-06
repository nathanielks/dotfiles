#!/usr/bin/env bash

DOTFILES_DIR="$( cd "$( dirname "$0" )" && pwd )/../"
echo $DOTFILES_DIR

for FILE in **/*.symlink; do
  SOURCE="$(pwd)/$FILE"
  FILENAME=$(basename "$FILE" ".symlink")
  TARGET="$HOME/.$FILENAME"
  ln -sif "$SOURCE" "$TARGET"
done

mkdir -p ~/.config/lvim
ln -sf "$DOTFILES_DIR/lvim/lv-config.lua" ~/.config/lvim/lv-config.lua

mkdir -p ~/.config/fish
ln -sf "$DOTFILES_DIR/fish/config.fish" ~/.config/fish/config.fish

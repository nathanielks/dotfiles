#!/usr/bin/env bash

# If macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  defaults write -g AppleShowAllFiles -bool true
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Set right alt to win for Regolith
  setxkbmap -option altwin:swap_alt_win
fi

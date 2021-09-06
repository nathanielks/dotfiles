#!/usr/bin/env bash

# If macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  defaults write -g AppleShowAllFiles -bool true
# elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
fi

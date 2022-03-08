#!/usr/bin/env bash

MODE="$1"
if [[ "$MODE" == "dark" ]]; then
  kitty @ set-colors -a "~/.config/kitty/colors/nightfox/nightfox.conf"
fi

if [[ "$MODE" == "light" ]]; then
  kitty @ set-colors -a "~/.config/kitty/colors/papercolor/papercolor-light.conf"
fi

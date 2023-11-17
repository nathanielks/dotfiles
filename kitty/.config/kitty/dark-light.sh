#!/usr/bin/env bash
exec 19>/Users/aang/dark-light.log
BASH_XTRACEFD=19

set -x

MODE="$1"
if [[ "$MODE" == "dark" ]]; then
  kitty @ set-colors -a "~/.config/kitty/colors/tokyonight_storm.conf"
fi

if [[ "$MODE" == "light" ]]; then
  kitty @ set-colors -a "~/.config/kitty/colors/tokyonight_day.conf"
fi

function dwest() {
  WORKDIR="/workspaces/firmware"
  if [[ "$1" == "build" ]]; then
    WORKDIR="/workspaces/firmware/app"
  fi

  docker run --rm \
    -w "$WORKDIR" \
    -v "$ZMK_FIRMWARE_DIR:/workspaces/firmware" \
    -v "$ZMK_CONFIG_DIR:/workspaces/zmk-config" \
    west west $1 ${@:2}
    # zmkfirmware/zephyr-west-action-arm $1 ${@:2}
}

alias kl="dwest build -p -d build/left -b nice_nano -- -DSHIELD=dactyl_manuform_4x5_left -DZMK_CONFIG=/workspaces/zmk-config"
alias kr="dwest build -p -d build/right -b nice_nano -- -DSHIELD=dactyl_manuform_4x5_right -DZMK_CONFIG=/workspaces/zmk-config"

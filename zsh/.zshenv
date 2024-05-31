# Prezto loads this via the environment module

# DO NOT MODIFY PATH HERE. https://gist.github.com/Linerre/f11ad4a6a934dcf01ee8415c9457e7b2
# Modify it in zshrc or zprofile

export DOTFILES=$HOME/.dotfiles
export WORKDOTS=$HOME/.workdots

export EDITOR="lvim"
export NVM_DIR="$HOME/.nvm"
export STARSHIP_CONFIG="$DOTFILES/starship/config.toml"
export KITTY_CONFIG_DIRECTORY="$DOTFILES/kitty/.config/kitty"

# Go config
export GOPATH=$HOME/go
export GOBIN="$GOPATH/bin"
if [[ $OSTYPE == darwin* && "$arch" == "arm64" ]]; then
  export GOROOT=/opt/homebrew/opt/go/libexec
elif [[ $OSTYPE == darwin* && "$arch" == "i386" ]]; then
  export GOROOT=/usr/local/opt/go/libexec
fi

# Python
export PYENV_ROOT="$HOME/.pyenv" 

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

# ZMK
export ZEPHYR_TOOLCHAIN_VARIANT="gnuarmemb"
export GNUARMEMB_TOOLCHAIN_PATH="$HOME/Code/zmk/gcc-arm"
export ZMK_FIRMWARE_DIR="$HOME/Code/zmk/firmware"
export ZMK_CONFIG_DIR="$HOME/Code/zmk/zmk-config/config"

# QMK
export QMK_HOME=$HOME/Code/GitHub/nathanielks/qmk_firmware

export DIFF_PAGER_LIGHT="delta --light --syntax-theme='GitHub'"
export DIFF_PAGER_DARK="delta --syntax-theme='Monokai Extended'"
export LIBRARY_PATH="/usr/local/opt"
export AWS_PAGER=""
. "$HOME/.cargo/env"

export SSH_AUTH_SOCK="~/.1password/agent.sock"
export GPG_TTY="$(tty)"

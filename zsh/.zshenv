# Prezto loads this via the environment module

export DOTFILES=$HOME/.dotfiles

export EDITOR="lvim"
export NVM_DIR="$HOME/.nvm"
export STARSHIP_CONFIG="$DOTFILES/starship/config.toml"
export KITTY_CONFIG_DIRECTORY="$DOTFILES/kitty/.config/kitty"

# Go config
export GOPATH=$HOME/go
export GOBIN="$GOPATH/bin"
export GOROOT=/usr/local/opt/go/libexec

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

# PATH modifications
## System level
PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"

# User level
PATH="$PYENV_ROOT/bin:$PATH" 
PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
PATH="$GOBIN:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH=$DOTFILES/bin:$PATH

# Project level
PATH="./vendor/bin:$PATH"
PATH="../node_modules/.bin:$PATH"
PATH="./node_modules/.bin:$PATH"
PATH="./bin:$PATH"

# Get OpenSSL compiler flags set correctly
if [[ $OSTYPE == darwin* ]]; then
  PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

  export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib -L/opt/homebrew/opt/zlib/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include -I/opt/homebrew/opt/zlib/include"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig:/opt/homebrew/opt/zlib/lib/pkgconfig"
fi

export PATH

export LIBRARY_PATH="/usr/local/opt"
export AWS_PAGER=""
. "$HOME/.cargo/env"

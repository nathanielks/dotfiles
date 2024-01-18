## System level
if [[ $OSTYPE == darwin* && "$arch" == "arm64" ]]; then
  PATH="/opt/homebrew/bin:$PATH"
  export FZF_BASE=/opt/homebrew/bin
  PATH="$HOME/Library/Python/3.9/bin:$PATH"
elif [[ $OSTYPE == darwin* && "$arch" == "i386" ]]; then
  PATH="/usr/local/bin:$PATH"
  PATH="/usr/local/sbin:$PATH"
fi

# User level
PATH="$PYENV_ROOT/bin:$PATH" 
PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
PATH="$GOBIN:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.local/bin/platform-tools:$PATH"
PATH="$DOTFILES/bin:$PATH"

# Project level
PATH="./vendor/bin:$PATH"
PATH="../node_modules/.bin:$PATH"
PATH="./node_modules/.bin:$PATH"
PATH="./bin:$PATH"

# Get OpenSSL compiler flags set correctly
if [[ $OSTYPE == darwin* ]]; then
  export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib -L/opt/homebrew/opt/zlib/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include -I/opt/homebrew/opt/zlib/include"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig:/opt/homebrew/opt/zlib/lib/pkgconfig"
  PATH="/opt/homebrew/opt/ruby/bin:$PATH"
fi

export PATH

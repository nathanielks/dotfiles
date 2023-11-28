#
# Executes commands at login pre-zshrc.
#


### If on OS X:
if [[ "$OSTYPE" = darwin* ]] ; then
  # Tell compilers we have a 64 bit architecture
  # This resolves install issues with mysql, postgres, and
  # other python packages with native non universal binary extensions
  export ARCHFLAGS="-arch x86_64"
fi

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='lvim'
export VISUAL='lvim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

# PATH modifications
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



#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-g -i -M -R -S -w -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

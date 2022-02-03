# Borrowed from Jeff Widman's Brewfile
# https://github.com/jeffwidman/dotfiles/blob/c6055bbd7fd01dcd91912762e67ef645456439dc/homebrew/.Brewfile
# 
# To make it so Homebrew can handle Brewfiles:
#   `brew tap Homebrew/bundle`
#   `brew bundle --file=~/.dotfiles/homebrew/.Brewfile`

# Generally life is simplest to not update OSX default SSH
# Because making a non-Apple SSH work with the OSX Keychain can be a pain
# As of OpenSSH 6.5 there's a much more secure encryption format for private keys:
# https://pthree.org/2014/12/08/super-size-the-strength-of-your-openssh-private-keys/
# Unfortunately doesn't seem to be supported by FileZilla (as of Feb 18, 2015)
# Also, no need to install HPN SSH patch per posts from 'djm' here:
# http://lwn.net/Articles/377723/
# brew 'ssh'

# Tap a few required taps
tap "homebrew/bundle"
tap "homebrew/core"

# Install all the things:
brew 'zsh'
brew 'ssh-copy-id'
brew 'git'
brew 'git-extras'
brew 'gibo' # quickly access Github's git ignore templates
brew 'less'
brew 'lesspipe' # pre-processes various file formats so they can be paged via Less
brew 'stow' # we'll use this later to manage dotfiles
brew 'htop'
brew 'iftop'
brew 'ncdu' # ncurses-based directory/file size viewer
brew "gcc"
brew "gh"
brew "git-delta" # better git diffs
brew "jq"
brew "lazygit"
brew "pyenv"
brew "starship"
brew "direnv"
brew "curl"
brew "wget"

# Modern Unix
brew 'ripgrep' # Faster grep
brew 'zoxide' # Fast directory switcher
brew 'broot' # Fast directory explorer
brew "exa" # better ls
brew "fd" # better find
brew "bat" # better cat
brew "fzf"


# Databases
brew 'sqlite'

# Go
brew 'go'

# Neovim
# I prefer over Vim for the simple reason they accepted one of my patches ;)
brew 'neovim'

# Quicklook plugins
tap 'homebrew/cask'
cask 'qlstephen'
cask 'betterzipql'

# Mac apps
cask 'istat-menus'

# Command-not-found
# this is used by prezto's command-not-found module:
# https://github.com/sorin-ionescu/prezto/tree/master/modules/command-not-found#command-not-found
# https://github.com/Homebrew/homebrew-command-not-found#install
tap 'homebrew/command-not-found'

# Fonts
tap 'homebrew/cask-fonts'

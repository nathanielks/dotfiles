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
tap "common-fate/granted"
tap "cormacrelf/tap"
tap "homebrew/bundle"
tap "homebrew/services"

# Command-not-found
# this is used by prezto's command-not-found module:
# https://github.com/sorin-ionescu/prezto/tree/master/modules/command-not-found#command-not-found
# https://github.com/Homebrew/homebrew-command-not-found#install
tap 'homebrew/command-not-found'

# Install all the things:
brew "act"
brew "openssl@3"
brew "aws-sam-cli"
brew "awscli"
brew "libgit2"
brew "bat" # better cat
brew "boost"
brew 'broot' # Fast directory explorer
brew "cdk"
brew "certbot"
brew "cfn-lint"
brew "cli53"
brew "coreutils"
brew "curl"
brew "direnv"
brew "duti"
brew "dynein"
brew "folly"
brew "fizz"
brew "wangle"
brew "fbthrift"
brew "fb303"
brew "edencommon"
brew "eza" # better ls
brew "fd" # better find
brew "flyctl"
brew "fzf"
brew "gcc"
brew "gh"
brew 'gibo' # quickly access Github's git ignore templates
brew "git"
brew "git-delta" # better git diffs
brew "git-extras"
brew "git-lfs"
brew "gnu-sed"
brew "gnu-tar"
brew "go"
brew "helm"
brew "htop"
brew "hyperfine"
brew "iftop"
brew "jq"
brew "k6"
brew "kubectx"
brew "lazygit"
brew "less"
brew 'lesspipe' # pre-processes various file formats so they can be paged via Less
brew "luarocks"
brew "minikube"
brew "mvfst"
brew 'ncdu' # ncurses-based directory/file size viewer
brew "neovim"
brew "parallel"
brew "php"
brew "pillow"
brew "pyenv"
brew "qemu"
brew "rain"
brew 'ripgrep' # Faster grep
brew "socket_vmnet"
brew "ssh-copy-id"
brew "starship"
brew 'stow' # we'll use this later to manage dotfiles
brew "telnet"
brew "tree"
brew "watch"
brew "watchman"
brew "wget"
brew "yq"
brew "zlib"
brew 'zoxide' # Fast directory switcher
brew "zsh"
brew "common-fate/granted/granted"
brew "cormacrelf/tap/dark-notify"
cask "1password-cli"
cask "alfred"
cask "bartender"
cask "claude"
cask "discord"
cask "emmetapp"
cask "firefox"
cask "font-sauce-code-pro-nerd-font"
cask "ghostty"
cask "google-chrome"
cask "istat-menus"
cask "keybase"
cask "kitty"
cask "meld"
cask "monitorcontrol"
cask "ngrok"
cask "obsidian"
cask "ollama"
cask "pocket-casts"
cask "rapidapi"
cask "session-manager-plugin"
cask "signal"
cask "slack"
cask "spotify"
cask "steam"
cask "tableplus"
cask "typora"
cask "visual-studio-code"
cask "zoom"
vscode "dansarich.tokyo-right"
vscode "dsznajder.es7-react-js-snippets"
vscode "eamodio.gitlens"
vscode "esbenp.prettier-vscode"
vscode "golang.go"
vscode "ms-python.debugpy"
vscode "ms-python.python"
vscode "ms-python.vscode-pylance"
vscode "ms-vscode-remote.remote-containers"
vscode "ms-vscode-remote.remote-ssh"
vscode "ms-vscode-remote.remote-ssh-edit"
vscode "ms-vscode-remote.remote-wsl"
vscode "ms-vscode-remote.vscode-remote-extensionpack"
vscode "ms-vscode.cpptools"
vscode "ms-vscode.remote-explorer"
vscode "ms-vscode.remote-server"
vscode "plorefice.devicetree"
vscode "twxs.cmake"
vscode "undefined_publisher.@noop-inc/vscode-snippets"
vscode "unifiedjs.vscode-mdx"
vscode "vscodevim.vim"

# Dotfiles

To get vim set up quickly:
```
curl -fsSL https://raw.githubusercontent.com/nathanielks/dotfiles/master/install.sh | bash
```

### On Fresh Install
- Install `homebrew`
    ```
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ```
- `brew install ansible`
- Run ansible
    ```
    cd ~/.dotfiles
    ansible-playook -i hosts computer.yml
    ```
- Install `oh-my-zsh`
    ```
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ```
- Install `asdf`
    ```
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.3.0
    echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc.local
    echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc.local
    ```
- Install `asdf` plugins
    ```
    asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
    ```
- Install `nodejs`
    ```
    asdf install nodejs 6.10
    ```
- Install Vim Plug
    ```
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

- Install python neovim dependency:
    ```
    sudo -H pip install neovim
    ```

# TODO

- Download Alfred sounds and to library: https://www.alfredapp.com/labs/

## Notes:
- List user-installed brew packages: `brew leaves`
- List user-installed cask packages: `brew cask list`

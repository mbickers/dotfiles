#!/usr/bin/env bash

# Setup nvim
mkdir -p ~/.config/nvim/autoload/airline/themes
ln -sf ~/dotfiles/vim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/vim/nord2.vim ~/.config/nvim/autoload/airline/themes/nord2.vim

# Setup tmux
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

# Setup git
ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git/gitignore ~/.gitignore

# Setup zsh
touch ~/.hushlogin
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc

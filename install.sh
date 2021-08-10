ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
rm -r ~/.config
mkdir -p ~/.config
ln -sf ~/dotfiles/vim ~/.config/nvim

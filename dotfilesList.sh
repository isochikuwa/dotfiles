#!/bin/sh
set vimrc="~/.config/nvim"
if [[ ! -d ~/.config/nvim ]]; then
  mkdir -p ~/.config/nvim
fi
if [[ ! -d ~/.config/alacritty ]]; then
  mkdir -p ~/.config/alacritty
fi
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.dein.toml ~/.dein.toml
ln -sf ~/dotfiles/.dein_lazy.toml ~/.dein_lazy.toml
ln -sf ~/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.tigrc ~/.tigrc
ln -sf ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

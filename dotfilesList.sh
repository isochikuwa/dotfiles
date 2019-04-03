#!/bin/sh
set vimrc="~/.config/nvim"
if [[ ! -d ~/.config/nvim ]]; then
  mkdir -p ~/.config/nvim
fi
ln -sf ~/dotfiles/.vimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.dein.toml ~/.dein.toml
ln -sf ~/dotfiles/.dein_lazy.toml ~/.dein_lazy.toml

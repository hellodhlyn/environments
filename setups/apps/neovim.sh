#!/usr/bin/env bash

# Install neovim
[ `which nvim` ] || brew install neovim
[ `which rg` ] || brew install ripgrep

# Install vim-plug
vim_plug_filename="${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim
if [ ! -f $vim_plug_filename ]; then
  sh -c "curl -fLo $vim_plug_filename --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
fi


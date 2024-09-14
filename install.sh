#!/usr/bin/env bash

curr_path=$(dirname "$0")
(cd "$curr_path" && git pull)

if [[ "$OSTYPE" == "darwin"* ]]; then
  bash "$curr_path/setups/macos.sh"
elif [[ "$OSTYPE" == "linux-gnu" && -f "/etc/arch-release" ]]; then
  bash "$curr_path/setups/archlinux.sh"
fi

cp $curr_path/dotfiles/.tmux.conf $HOME
cp $curr_path/dotfiles/.zsh_plugins $HOME
cp $curr_path/dotfiles/.zshrc $HOME
cp $curr_path/dotfiles/.vimrc $HOME

mkdir -p "$HOME/.config/nvim/init.vim"
cp "$curr_path/dotfiles/init.vim" "$HOME"/.config/nvim/init.vim

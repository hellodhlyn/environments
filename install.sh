#!/usr/bin/env bash

curr_path=$(dirname "$0")
(cd $curr_path && git pull)

if [[ "$OSTYPE" == "darwin"* ]]; then
    bash $curr_path/setups/macos.sh
fi

cp $curr_path/dotfiles/.tmux.conf $HOME
cp $curr_path/dotfiles/.zsh_plugins $HOME
cp $curr_path/dotfiles/.zshrc $HOME
cp $curr_path/dotfiles/.vimrc $HOME


#/usr/bin/env bash

curr_path=$(dirname "$0")

(cd $curr_path && git pull)

cp $curr_path/dotfiles/.tmux.conf $HOME
cp $curr_path/dotfiles/.zsh_plugins $HOME

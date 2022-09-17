#!/usr/bin/env bash

curr_path=$(dirname "$0")

sudo pacman -Syu
sudo pacman -S --needed archlinux-keyring
sudo pacman -S --needed direnv sops tmux exa bat jq

for f in "$curr_path/apps/"*; do
  bash $f
done

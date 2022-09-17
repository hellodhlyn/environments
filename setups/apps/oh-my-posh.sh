#!/usr/bin/env bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  brew install jandedobbeleer/oh-my-posh/oh-my-posh
elif [[ "$OSTYPE" == "linux-gnu" && -f "/etc/arch-release" ]]; then
  yay -Syu oh-my-posh-bin
fi
oh-my-posh font install

mkdir -p $HOME/.omp/themes
curl https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/aliens.omp.json -o $HOME/.omp/themes/aliens.omp.json

#!/usr/bin/env bash

brew install jandedobbeleer/oh-my-posh/oh-my-posh
oh-my-posh font install

mkdir -p $HOME/.omp/themes
curl https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/aliens.omp.json -o $HOME/.omp/themes/aliens.omp.json


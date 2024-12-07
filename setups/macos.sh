#!/usr/bin/env bash

curr_path=$(dirname "$0")

# Homebrew
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
if [ ! -d "$HOME/.antidote" ]; then
  git clone --depth=1 https://github.com/mattmc3/antidote.git $HOME/.antidote
fi

brew update
brew install direnv sops tmux eza bat jq

for f in "$curr_path/apps/"*; do
  bash $f
done

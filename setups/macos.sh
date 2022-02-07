#!/usr/bin/env bash

curr_path=$(dirname "$0")

# Homebrew
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update
brew install antibody tmux exa bat

for f in "$curr_path/apps/"*; do
    bash $f
done


#!/usr/bin/env bash

if ! command -v asdf &> /dev/null; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
fi

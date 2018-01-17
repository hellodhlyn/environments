#!/bin/bash

# Install redis.
brew install redis

# Add 'redis-dashboard' alias.
brew install tmux

mkdir -p ~/.scripts
cp dotfiles/.scripts/redis-dashboard.sh ~/.scripts

if [ ! -f ~/.scripts/aliases.sh ]; then
    cp dotfiles/.scripts/aliases.sh ~/.scripts
    echo -e 'source ~/.scripts/aliases.sh\n' >> ~/.zshrc
fi
echo -e 'alias redis-dashboard="sh $SCRIPTPATH/redis-dashboard.sh"' >> ~/.scripts/aliases.sh

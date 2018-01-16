#!/bin/bash

# Setup git
git config --global user.name 'Do Hoerin'
git config --global user.email 'hellodhlyn@gmail.com'

# Install scm_breeze
# See: https://github.com/scmbreeze/scm_breeze
git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh

# Install pyenv
# See: https://github.com/pyenv/pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo '# Pyenv configurations' >> ~/.zshrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
echo '' >> ~/.zshrc

source ~/.zshrc

pyenv init
pyenv install 3.6.4  # TODO: get latest version of python 3
pyenv global 3.6.4

# Install nvm
# See: https://github.com/creationix/nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

source ~/.zshrc

nvm install --lts
nvm use --lts
nvm alias default node


echo 'Setup completed. Reload shell using command "zsh".'

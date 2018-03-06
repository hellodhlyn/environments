#!/bin/bash

# Setup git
git config --global user.name 'Do Hoerin'
git config --global user.email 'hellodhlyn@gmail.com'

# Install scm_breeze
# See: https://github.com/scmbreeze/scm_breeze
echo -e '\n*** Install scm_breeze'
if [ -d "$HOME/.scm_breeze" ]; then
  echo 'Scm_breeze already installed.'
else
  git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
  ~/.scm_breeze/install.sh
fi

# Install pyenv
# See: https://github.com/pyenv/pyenv
echo -e '\n*** Install Pyenv'
if [ -d "$HOME/.pyenv" ]; then
  echo 'Pyenv already installed.'
else
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
fi

# Install nvm
# See: https://github.com/creationix/nvm
echo -e '\n*** Install nvm'
if [ -d "$HOME/.nvm" ]; then
  echo 'nvm already installed.'
else
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

  source ~/.zshrc

  nvm install --lts
  nvm use --lts
  nvm alias default node
fi

# Install rbenv
# See: https://github.com/rbenv/rbenv#installation
echo -e '\n*** Install rbenv'
if [ -d "$HOME/.rbenv" ]; then
  echo 'rbenv already installed.'
else
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv

  echo '# Rbenv configurations' >> ~/.zshrc
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
  echo '' >> ~/.zshrc

  PATH="$HOME/.rbenv/bin:$PATH"

  ~/.rbenv/bin/rbenv init

  mkdir -p "$(rbenv root)"/plugins
  git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
fi

echo 'Setup completed. Reload shell using command "zsh".'

#!/bin/bash
###
### Environments setup file for Ubuntu 18.04
###

APT=${APT:-'sudo apt'}

function print_green {
  echo -e "\e[32m$1\e[39m"
}

function print_red {
  echo -e "\e[31m$1\e[39m"
}

function test {
  result=$($1)
  if [[ $result == *"$2"* ]]; then
    print_green 'Test succeed :)'
  else
    print_red 'Test failed :('
    print_red "Command:  $1"
    print_red "Expected: $2"
    print_red "Actual:   $result"
    exit 1
  fi
}

## Set install environments
export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true

## Update system-wide configs
print_green 'Update system-wide configs'
$APT install tzdata -y
sudo echo 'Asia/Seoul' > /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata

## Update system packages
print_green 'Update system packages'
$APT update -y
$APT upgrade -y

## Zsh
print_green 'Install Zsh'
$APT install zsh -y

## Git
print_green 'Install git'
$APT install git -y

git config --global user.email 'hellodhlyn@gmail.com'
git config --global user.name 'Do Hoerin'

test 'git config --global user.email' 'hellodhlyn@gmail.com'
test 'git config --global user.name' 'Do Hoerin'

## Pyenv
# See: https://github.com/pyenv/pyenv
print_green 'Install pyenv'
if [ ! -d "$HOME/.pyenv" ]; then
  $APT install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python-openssl

  git clone https://github.com/pyenv/pyenv.git ~/.pyenv

  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
  echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
  echo '' >> ~/.zshrc
fi

## Rbenv
# See: https://github.com/rbenv/rbenv#installation
print_green 'Install rbenv'
if [ ! -d "$HOME/.rbenv" ]; then
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv

  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
  echo '' >> ~/.zshrc

  PATH="$HOME/.rbenv/bin:$PATH"
  ~/.rbenv/bin/rbenv init

  mkdir -p "$(rbenv root)"/plugins
  git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
fi

## NVM
# See: https://github.com/creationix/nvm
print_green 'Install nvm'
if [ ! -d "$HOME/.nvm" ]; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
  
  echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
  echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc
  echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.zshrc
fi

## GVM
# See: https://github.com/moovweb/gvm
print_green 'Install gvm'
if [ ! -d "$HOME/.gvm" ]; then
  $APT install -y bison

  curl -o- https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | bash
  
  echo 'source /home/tester/.gvm/scripts/gvm' >> ~/.zshrc

  source /home/tester/.gvm/scripts/gvm
  gvm install go1.4 -B
fi

print_green 'Setup completed! Please reload your terminal.'

#!/bin/bash
if [[ $(uname -s) == "Darwin" ]]; then
  if ! [[ $(command -s brew) ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew bundle
  fi
else
  if ! [[ $(command -s brew) ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    ./linuxbrew/bin/brew bundle
  fi
fi
chsh -s $(which fish)
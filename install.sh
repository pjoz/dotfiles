#!/bin/bash

# Install script for my dotfiles. (For fresh (clean) macos systems ONLY)
#-------------------------------------------------------------------------------
# Git clone this repo into your home directory.
#
# Run the following:
# 1. cd ~/dotfiles
# For complete installation - for fresh systems only
# 2. bash install.sh -I complete
# Otherwise run
# 2. bash install.sh
# 3. cd ~/ && rm -rf dotfiles
#
# This script will dump and install any dependencies outside of this directory
# (to the parent).
#-------------------------------------------------------------------------------

while getopts "I:" opt; do
  case "$opt" in
    I)
      INSTALL="$OPTARG"
      ;;
    *)
      echo "Unknown command"
      exit 0
      ;;
    esac
done

# change the dir to go outside of the dotfiles, which should lead to home dir.
cd ../

get_brew()
{
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

zsh()
{
  # Install zsh
  brew update
  brew install zsh

  # Install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  # Copy oh-my-zsh customs
  cp -R dotfiles/.oh-my-zsh .
}

zsh_theme()
{
  cd ~/.oh-my-zsh/custom
  mkdir themes
  cd themes
  git clone https://github.com/geometry-zsh/geometry
  cd geometry
  git submodule update --init --recursive
  cp ~/dotfiles/.oh-my-zsh/custom/themes/geometry.sh .
  cd ~/
}

fonts()
{
  # clone
  git clone https://github.com/powerline/fonts.git --depth=1
  # install
  cd fonts
  ./install.sh
  # clean-up a bit
  cd ..
  rm -rf fonts
}

chunk()
{
    # from http://hde-advent-2017.hatenadiary.jp/entry/2017/12/24/000000
  brew tap crisidev/homebrew-chunkwm
  brew install --HEAD --with-tmp-logging chunkwm
  brew install --HEAD --with-logging  koekeishiya/formulae/skhd
}

if ! which brew; then
  get_brew
fi

if [ "$INSTALL" = "complete" ]
then
  zsh
  zsh_theme
  fonts
  chunk
fi

if [ "$INSTALL" = "fonts" ]
then
  fonts
fi

ln -s dotfiles/.zshrc
ln -s dotfiles/.vimrc
ln -s dotfiles/.chunkwmrc
ln -s dotfiles/.skhdrc

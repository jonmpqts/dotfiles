#!/bin/bash -

set -euo pipefail

cd $HOME

DOTFILES_DIR=$HOME/dotfiles
DOTFILE_SCRIPTS_DIR=$DOTFILES_DIR/scripts

if [ ! -d $DOTFILES_DIR ]; then
  if hash git 2>/dev/null; then
    echo "Git is already installed. Cloning repository..."
    git clone ssh://git@github.com/jonmpqts/dotfiles.git $DOTFILES_DIR
  else
    echo "Git is not installed. Downloading repository archive..."
    curl -sL https://github.com/jonmpqts/dotfiles/archive/master.tar.gz --output master.tar.gz
    tar xzvf master.tar.gz
    mv dotfiles-master dotfiles
  fi
else
  cd $DOTFILES_DIR
  git stash
  git pull origin master
  git stash pop
fi

cd $DOTFILES_DIR

unamestr=`uname`

if [[ "$unamestr" == 'Linux' ]]; then
  "$DOTFILE_SCRIPTS_DIR/setup/linux.sh"
fi

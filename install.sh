#!/bin/sh

DOT_DIR="$HOME/dotfiles"

# clone
if [ ! -e "$DOT_DIR" ]; then
  git clone https://github.com/hyrorre/dotfiles.git ${DOT_DIR}
fi

# mkdir
mkdir -p ~/.config/git
mkdir -p ~/.ssh

# link
ln -s $DOT_DIR/.config/git/ignore ~/.config/git/ignore
ln -s $DOT_DIR/.ssh/config ~/.ssh/config
ln -s $DOT_DIR/.Brewfile ~/.Brewfile
ln -s $DOT_DIR/.gitconfig ~/.gitconfig
ln -s $DOT_DIR/.gitconfig_private ~/.gitconfig_private
ln -s $DOT_DIR/.gitconfig_work ~/.gitconfig_work
ln -s $DOT_DIR/.zshrc ~/.zshrc
ln -s $DOT_DIR/.zprofile ~/.zprofile

# homebrew
# if type brew >/dev/null 2>&1; then
#   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# fi

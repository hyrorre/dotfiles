#!/bin/sh

DOT_DIR="$HOME/dotfiles"

# clone
if [ ! -e "$DOT_DIR" ]; then
  git clone https://github.com/hyrorre/dotfiles.git ${DOT_DIR}
fi

# mkdir
mkdir -p ~/.config/git
mkdir -p ~/.config/micro
mkdir -p ~/.ssh

# link
ln -s $DOT_DIR/.config/git/ignore ~/.config/git/ignore
ln -s $DOT_DIR/.config/micro/bindings.json ~/.config/micro/bindings.json
ln -s $DOT_DIR/.config/micro/settings.json ~/.config/micro/settings.json
ln -s $DOT_DIR/.ssh/config ~/.ssh/config
ln -s $DOT_DIR/.gitconfig ~/.gitconfig
ln -s $DOT_DIR/.gitconfig_private ~/.gitconfig_private
ln -s $DOT_DIR/.gitconfig_work ~/.gitconfig_work
ln -s $DOT_DIR/.zshrc ~/.zshrc
ln -s $DOT_DIR/.zprofile ~/.zprofile

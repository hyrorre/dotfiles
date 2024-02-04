#!/bin/sh

DOT_DIR="$HOME/dotfiles"

# clone
if [ ! -e "$DOT_DIR" ]; then
  git clone https://github.com/yamashita-kllc/dotfiles.git ${DOT_DIR}
fi

# link
ln -s $DOT_DIR/.ssh/config ~/.ssh/config
ln -s $DOT_DIR/.gitconfig ~/.gitconfig
ln -s $DOT_DIR/.gitconfig_private ~/.gitconfig_private
ln -s $DOT_DIR/.gitconfig_work ~/.gitconfig_work
ln -s $DOT_DIR/.zshrc ~/.zshrc
ln -s $DOT_DIR/.zprofile ~/.zprofile

# zsh
if type zsh >/dev/null 2>&1; then
  sudo apt -y install zsh
fi

if [ "${$(echo $SHELL)##*/}" -ne "zsh" ]; then
  chsh -s $(which zsh)
  echo "Please restart terminal to change shell."
fi

# homebrew
if type brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# dotfiles

dotfiles for hyrorre

mainly for macOS

## install

```sh
git clone https://github.com/hyrorre/dotfiles.git ~/dotfiles
~/dotfiles/install.sh

# optional (homebrew)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file=~/dotfiles/Brewfile

# optional (mise)
brew install mise
mise install

# optional (ssh-keygen)
ssh-keygen -t rsa -b 4096
ssh-keygen -t ed25519

# optional (change git remote url https -> ssh)
cd ~/dotfiles
git remote set-url origin git@github.com:hyrorre/dotfiles.git

# optional (linux codex remote-control)
curl -fsSL https://chatgpt.com/codex/install.sh | sh
source ~/.zshrc
codex features enable remote_control
codex remote-control start
```

## files

- git config
- ssh config
- zsh config
- micro editor config
- homebrew bundle file

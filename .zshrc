# zsh
autoload -Uz colors && colors
PROMPT="%F{green}%n@%m%f%f:%F{blue}%~%f"$" "
export LSCOLORS=cxfxcxdxbxegedabagacad

# aliases
alias .="pwd"
alias ..="cd .."
alias ...="cd ../.."
alias mkdircd='(){mkdir $1;cd $1}'
alias ls="ls -G --color"
alias lsa="ls -aG --color"
alias lsl="ls -lG --color"
alias lsal="ls -alG --color"

alias vz="vi ~/.zshrc"
alias nz="nano ~/.zshrc"
alias sz="source ~/.zshrc"
alias vzp="vi ~/.zprofile"
alias nzp="nano ~/.zprofile"
alias szp="source ~/.zprofile"
alias re='exec $SHELL -l'
alias rosetta="arch -x86_64 zsh"

export EDITOR=nano

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export VCPKG_ROOT="$HOME/vcpkg"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.2/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.2/sbin:$PATH"
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"
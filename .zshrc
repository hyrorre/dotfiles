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

alias nr='npm run'

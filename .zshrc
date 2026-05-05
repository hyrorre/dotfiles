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
alias ll="ls -lG --color"
alias la="ls -alG --color"
alias lsa="ls -aG --color"
alias lsl="ls -lG --color"
alias lsal="ls -alG --color"
alias path='echo $PATH | tr ":" "\n"'

alias m="micro"
alias vz="vi ~/.zshrc"
alias nz="nano ~/.zshrc"
alias mz="micro ~/.zshrc"
alias cz="cat ~/.zshrc"
alias sz="source ~/.zshrc"
alias vzp="vi ~/.zprofile"
alias nzp="nano ~/.zprofile"
alias mzp="micro ~/.zprofile"
alias szp="source ~/.zprofile"
alias czp="cat ~/.zprofile"
alias nn="nano ~/.nanorc"
alias cn="cat ~/.nanorc"
alias ms="micro ~/.config/micro/settings.json"
alias mb="micro ~/.config/micro/bindings.json"

alias re='exec $SHELL -l'
alias rosetta="arch -x86_64 zsh"

export EDITOR=micro

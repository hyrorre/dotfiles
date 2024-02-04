# zsh
autoload -Uz colors && colors
PROMPT="%F{green}%n@%m%f %F{cyan}($(arch))%f:%F{blue}%~%f"$" "
export LSCOLORS=cxfxcxdxbxegedabagacad

# aliases
alias .="pwd"
alias ..="cd .."
alias ...="cd ../.."
alias mkdircd='(){mkdir $1;cd $1}'
alias ls="ls -G"
alias la="ls -aG"
alias ll="ls -alG"

alias vz="vi ~/.zshrc"
alias sz="source ~/.zshrc"

alias re='exec $SHELL -l'

alias rosetta="arch -x86_64 zsh"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
export PATH="/opt/homebrew/opt/php@7.4/sbin:$PATH"

export PATH="/Users/yamashita/.anyenv/envs/nodenv/shims/:$PATH"

export PATH="/opt/homebrew/opt/node@16/bin:$PATH"

alias reload='exec zsh'
alias cls=clear
alias ls='lsd --group-dirs first'
alias la='ls -A'
alias ll='ls -Al'
alias cl='clear;la'
alias cll='clear;ll'
alias ev='vim ~/.vimrc'
alias ep='vim ~/.zsh/aliases.zsh'
alias cpdir="pwd | tr -d '\n' | pbcopy"
# Dotfiles Version Control {{{1
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

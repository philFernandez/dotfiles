# Aliases {{{1
# Misc {{{2
alias reload='exec zsh'
alias q='exit'
alias ppath='print -l $path'
alias cpdir="pwd | tr -d '\n' | pbcopy"
# Config File Shortcuts {{{2
alias ev='vim ~/.vimrc'
alias ep='vim ~/.zsh/aliases.zsh'
alias el='vim ~/.zsh/.zlogin'
alias rc='vim ~/.zsh/.zshrc'
# Navigating and Displaying {{{2
alias cls=clear
alias ls='lsd --group-dirs first'
alias la='ls -A'
alias ll='ls -Al'
alias l='lsd --blocks date,name,size --date relative -tA'
alias cl='clear;la'
alias c='clear;ls -1'
alias cll='clear;ll'
alias bk='cd ..'
alias fl='fd -HI -d1'
# Dotfiles Version Control {{{2
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cst='config status'
alias cpush='config push -u origin main'
alias cdl='config diff'
alias clcp='config log -p'
alias ccam='config commit -a -m'
alias clo='config log --oneline --all --decorate --graph'
# Homebrew {{{2
alias clean='brew cleanup --prune=all -s'
alias update='brew -v update'
alias upgrade='brew upgrade'
# Global Aliases {{{1
# Goto Shortcuts {{{2
alias -g SOU="~/Source_Code"
alias -g DOC="~/Documents"
alias -g DOW="~/Downloads"
alias -g BIN="~/.bin"
# File Manipulation {{{2
alias -g CP="|tr -d '\n'|pbcopy"
alias -g CPL="|pbcopy"
# Misc {{{2
alias -g C="|awk END'{print NR}'"
alias -g G='| rg --no-filename --color never'
alias -g B='|bat'
alias -g F='|fzf'

# Modeline {{{1
# vim:foldenable foldmethod=marker foldcolumn=1 foldlevel=0

# Aliases {{{1
# Misc {{{2
alias reload='exec zsh'
alias q='exit'
alias ppath='print -l $path'
alias cpdir="pwd | tr -d '\n' | pbcopy"
alias ds='du -sh 2> /dev/null'
alias ip="ifconfig | rg '\d{3}\.\d{3}\.\d\.\d{2}\b' -o --color=never"
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
# Git {{{2
alias gls="git ls-files"
alias gce="git commit -a --allow-empty-message -m ''"
alias gzap='git checkout .'
alias glor='LESS+=-N git log --oneline --decorate --reverse'
alias gst='git status'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gcam='git commit -a -m'
alias glgp='git log --stat -p'
alias glg='git log --stat'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat"
alias glod="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias glods="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
alias glog='git log --decorate --graph'
alias gloa='git log --oneline --decorate --graph --all'
alias glo='git log --oneline --decorate --graph'
alias gm='git merge'
alias gp='git push'
alias gpl='git pull'
alias gsps='git show --pretty=short --show-signature'
alias gss='git status -s'
alias gst='git status'
alias gcl='git clone'
alias gsl='git shortlog'
alias gco='git checkout'
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

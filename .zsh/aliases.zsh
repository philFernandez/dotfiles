# Aliases {{{1
# Misc {{{2
alias reload='exec zsh'
alias q='exit'
alias cpdir="pwd | tr -d '\n' | pbcopy"
alias ds='du -sh 2> /dev/null'
alias ip="ifconfig | rg '\d{3}\.\d{3}\.\d\.\d{2}\b' -o --color=never"
alias timestamp="date +'%A %B %e %G %r'"
# Config File Shortcuts {{{2
alias ev="$EDITOR ~/.vimrc"
alias ep="$EDITOR ~/.zsh/aliases.zsh"
alias el="$EDITOR ~/.zsh/.zlogin"
alias rc="$EDITOR ~/.zsh/.zshrc"
alias ek="$EDITOR ~/.config/kitty/kitty.conf"
alias ez="$EDITOR ~/.zshenv"
# Navigating and Displaying and File Things {{{2
alias md='mkdir -p'
alias rd='rm -fr'
alias cls=clear
alias icat="kitty +kitten icat"
alias ls='lsd --group-dirs first'
alias la='ls -A'
alias ll='ls -Al'
alias l='lsd --blocks date,name,size --date relative -tA'
alias cl='clear;la'
alias c='clear;ls -1'
alias cll='clear;ll'
alias bk='cd ..;cl'
alias fl='fd -HI -d1'
alias ka='k -a'
# Use in ~/.bin and ~/.zsh/autoloaded to see which files aren't tracked by git
alias confdiff="delta =(fd -tf -d1 | sort) =(config ls-files | sort)"
alias kdiff='kitty +kitten diff'
alias fbat='fd -HI -tf | fzf --bind "enter:execute(clear;bat --paging=always {})"'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
# Dotfiles Version Control {{{2
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cst='config status'
alias cpush='config push -u origin main'
alias cdl='config diff'
alias clcp='config log -p'
alias ccam='config commit -a -m'
alias clo="config log --all --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr)'"
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
alias gdl='git diff'
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
alias gloa="git log --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr)%Creset' --graph --decorate --all"
alias glo="git log --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr)%Creset' --graph --decorate"
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
alias -g DES="~/Desktop"
alias -g DOW="~/Downloads"
alias -g BIN="~/.bin"
alias -g NOT="~/Documents/Notes"
# File Manipulation {{{2
alias -g CP="|tr -d '\n'|pbcopy"
alias -g CPL="|pbcopy"
# Misc {{{2
alias -g C="|awk END'{print NR}'"
alias -g G='| rg --no-filename --color never'
alias -g B='|bat'
alias -g F='|fzf'
alias -g L='|less'
alias -g DSF='|delta'
# This is like the fbat alias above, except this can be preceded by and find/fd command. ex: fd -e py FB
alias -g FB='|fzf --bind "enter:execute(clear;bat --paging=always {})"'

# Modeline {{{1

# vim:foldenable foldmethod=marker foldcolumn=1 foldlevel=0

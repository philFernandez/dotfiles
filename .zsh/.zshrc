
#                                                        ███████╗███████╗██╗  ██╗██████╗  ██████╗
#                                                        ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#                                                          ███╔╝ ███████╗███████║██████╔╝██║
#                                                         ███╔╝  ╚════██║██╔══██║██╔══██╗██║
#                                                        ███████╗███████║██║  ██║██║  ██║╚██████╗
#                                                        ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝

# p10k Instant Prompt {{{1
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export BOOK=$HOME/Source_Code/GoLang/PowerfulCmdApps
# zmodlads and autoloads {{{1
zmodload zsh/complist
# Lazy load my functions in ~/.zsh/autoloaded. Loads normal files and symlinks. 
# (^/:t) is a glob modifier that '^/' says give files and symlinks, ':t' says strip off
# the path and only give the file name.
autoload -Uz $fpath[1]/*(^/:t)

# Shell Options {{{1
setopt \
  HIST_IGNORE_ALL_DUPS \
  INC_APPEND_HISTORY \
  HIST_SAVE_NO_DUPS \
  HIST_IGNORE_SPACE \
  APPEND_HISTORY \
  SHARE_HISTORY \
  NO_CLOBBER \
  AUTO_CD \
  AUTO_PUSHD \
  PUSHD_IGNORE_DUPS \
  PUSHD_MINUS \
  INTERACTIVE_COMMENTS \
  COMPLETE_ALIASES \
  CD_SILENT \
  MENU_COMPLETE \
  GLOB_COMPLETE \
  GLOB_DOTS \
  HIST_NO_STORE \
  HIST_FCNTL_LOCK

#
# What the (non obvious) above options do -
#
# NO_CLOBBER - Prevents redirection from ovewriting files. Can be sidestepped with >| 
#              or >!
# AUTO_CD - Cd's into a directory implicitly without first entering cd
#
# PUSHD_MINUS - Exchanges the meanings of + and - when used with a number to specify a 
#               directory in the stack.
# INTERACTIVE_COMMENTS - Allows comments in interactive shells
#
# COMPLETE_ALIASES - Prevents aliases on the command line from being internally substituted before completion is attempted
#
# CD_SILENT - Prevent echoing back of PWD when AUTO_CDing or dirstacking into a directory
#
# MENU_COMPLETE - Make it so that pusing tab just starts scrolling through completion list with cursor
#
# GLOB_COMPLETE - Prevents glob expansion from filling in all at once and instead opens a completion menu. 
#                 (i.e. ls *.txt<Tab> will not automatically insert all txt files; it will open the menu.)
# GLOB_DOTS - Includes filenames that begin with '.' in all glob completions without needing to explicitly type 
#             '.' as the first character. (e.g. ls<Tab> will list all files, including hidden ones)
#                         
# HIST_NO_STORE - prevents the 'history' and 'fc -l' commands from being saved to history
#
# HIST_FCNTL_LOCK - may prevent history corruption. (also it may not, and it may make things worse)
#


# Exports {{{1
export SAVEHIST=500000
export RANGER_LOAD_DEFAULT_RC=false
export HISTSIZE=500000
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
export EDITOR=nvim
export GOARCH=arm64
export GOOS=darwin
export FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD 2> /dev/null || fd . -HI)'
export FZF_DEFAULT_OPTS="--color=hl:120,gutter:35,\
pointer:220,hl+:118,fg:251,fg+:bright-blue,\
marker:196,border:214,prompt:214,\
header:208,bg+:240 --reverse \
--bind=ctrl-t:top --border --multi"
# zvm setup {{{1
function zvm_config() {
    ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_ZLE
    ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
    ZVM_VI_EDITOR=/opt/homebrew/bin/vim
    ZVM_KEYTIMEOUT=0.01
    ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
    ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BEAM
    ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_UNDERLINE
    ZVM_VISUAL_LINE_MODE_CURSOR=$ZVM_CURSOR_BLINKING_UNDERLINE
}

# Source Things (Needs to come after Exports) {{{1
source $HOME/.zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/plugins/powerlevel10k/powerlevel9k.zsh-theme
source $HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/plugins/dircolors
source $HOME/.zsh/plugins/colored-man-pages/colored-man-pages.zsh
if [[ $TERM_PROGRAM == 'vscode' ]]; then
    source $HOME/.zsh/.p10k_vscode.zsh
else
    source $HOME/.zsh/.p10k.zsh
fi

# Keybindings (Needs to come after Source Things) {{{1
# Bindings related to vim mode
zvm_bindkey vicmd ' ' zvm_append_eol
zvm_bindkey viins "^[[A" history-beginning-search-backward
zvm_bindkey viins "^[[B" history-beginning-search-forward
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Tab Completion Things (zstyle: Needs to come after Source Things) {{{1
# The following lines were added by compinstall (and by me { Phil })
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}%B<- %d ->%b%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-dirs-first 1
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:commands'  list-colors '=*=1;38;5;220'
zstyle ':completion:*:builtins'  list-colors '=*=1;38;5;170'
zstyle ':completion:*:aliases'  list-colors '=*=1;38;5;68'
zstyle ':completion:*:parameters'  list-colors '=*=1;38;5;166'
zstyle ':completion:*:options' list-colors '=^(-- *)=1;38;5;227'
zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' match-original both
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' menu select=long
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' substitute 1
zstyle ':completion:*' menu select=1
zstyle :compinstall filename '/Users/philthy/.zsh/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Set Kitty Window Title {{{1

# Executed right before each prompt is drawn
# It displays the PWD
function set-title-precmd() {
  printf "\e]2;%s\a" "${PWD/#$HOME/~}"
}

# Executed after pressing enter, before command line runs.
# It displays the name of the running command.
function set-title-preexec() {
  printf "\e]2;%s\a" "$1"
}

# See here for info on zsh-hooks
# https://github.com/rothgar/mastering-zsh/blob/master/docs/config/hooks.md

autoload -Uz add-zsh-hook
add-zsh-hook precmd set-title-precmd
add-zsh-hook preexec set-title-preexec
# Modeline {{{1

# vim:foldenable foldmethod=marker foldcolumn=1 foldlevel=0

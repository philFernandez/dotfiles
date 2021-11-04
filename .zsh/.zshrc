# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
  COMPLETE_ALIASES

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
source $HOME/.zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh

source $HOME/.zsh/plugins/powerlevel10k/powerlevel9k.zsh-theme
source $HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/plugins/dircolors
source $HOME/.zsh/.p10k.zsh

# Bindings related to vim mode
zvm_bindkey vicmd ' ' zvm_append_eol
zvm_bindkey viins "^[[A" history-beginning-search-backward
zvm_bindkey viins "^[[B" history-beginning-search-forward
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history


# The following lines were added by compinstall
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
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
zstyle :compinstall filename '/Users/philthy/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Exports {{{1
export EDITOR=/opt/homebrew/bin/vim
export FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD 2> /dev/null || fd . -HI)'
export FZF_DEFAULT_OPTS="--color=hl:120,gutter:35,\
pointer:220,hl+:118,fg:251,fg+:bright-blue,\
marker:196,border:214,prompt:214,\
header:208,bg+:240 --reverse \
--bind=ctrl-t:top --border --multi"

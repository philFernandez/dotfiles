ZDOTDIR=$HOME/.zsh
# Add completion for brew and brew installed packages that provide completion files
fpath=("/opt/homebrew/share/zsh/site-functions" $fpath)
# Add my autoloaded functions to fpath
fpath=("$HOME/.zsh/autoloaded" $fpath)

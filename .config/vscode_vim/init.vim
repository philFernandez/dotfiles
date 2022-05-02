let mapleader=","

call plug#begin(stdpath('data') . '/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

Plug 'tpope/vim-surround'


" Initialize plugin system
call plug#end()



nmap sa ggVG
nmap J }
nmap K {
nmap Q :q!<cr>

nnoremap <Space> A
nnoremap <leader><Space> :nohl<cr>

au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=500}

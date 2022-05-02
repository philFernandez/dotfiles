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


hi IncSearch gui=bold guifg=black guibg=yellow


syntax on
set number
set termguicolors

nnoremap <silent> <leader><space> :nohl<cr>
nnoremap <space> A
nnoremap sa ggVG

nnoremap <silent> bn :bNext<cr>
nnoremap <silent> bp :bprevious<cr>

au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=500}

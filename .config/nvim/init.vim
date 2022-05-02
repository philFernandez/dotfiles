let mapleader=","


call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-surround'

call plug#end()


hi IncSearch gui=bold guifg=black guibg=yellow


syntax on
set number
set termguicolors
set confirm
set noswapfile

nnoremap <silent> <leader><space> :nohl<cr>
nnoremap <space> A
nnoremap sa ggVG

nnoremap <silent> bn :bNext<cr>
nnoremap <silent> bp :bprevious<cr>
nmap Q :q<cr>


au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=500}

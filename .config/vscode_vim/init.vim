let mapleader=","

call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-surround'


call plug#end()



nmap sa ggVG
nmap J }
nmap K {
nmap Q :q!<cr>

nnoremap <Space> A
nnoremap <leader><Space> :nohl<cr>

au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=500}

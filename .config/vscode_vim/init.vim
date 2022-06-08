" This is the init.vim for Visual Studio Code's vscode-nvim plugin

let mapleader=","


" Vim Plug
call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-surround'

call plug#end()


" Keymaps
nmap sa ggVG
nmap J }
nmap K {
nmap Q :q!<cr>

nnoremap <Space> A
nnoremap <leader><Space> :nohl<cr>

" Yank into system clipboard register
vnoremap CV "*y
" Paste from system clipboard register
nnoremap CP "*p

" Colors
au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=500}

hi IncSearch cterm=NONE ctermfg=black ctermbg=yellow


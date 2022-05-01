let mapleader=","

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

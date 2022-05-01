hi IncSearch gui=bold guifg=black guibg=yellow

let mapleader=","
nmap sa ggVG
nmap J }
nmap K {
nmap Q :q!<cr>

nnoremap <Space> A
nnoremap <leader><Space> :nohl<cr>

au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=500}

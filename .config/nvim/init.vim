let mapleader=","
syntax enable


call plug#begin(stdpath('data') . '/plugged')


Plug 'jiangmiao/auto-pairs'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'lifepillar/vim-mucomplete'
Plug 'preservim/nerdcommenter'
Plug 'fladson/vim-kitty'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf.vim'
Plug '/opt/homebrew/opt/fzf'

call plug#end()

set title
set termguicolors
set number
set ruler
set ttimeoutlen=0
set splitright
set splitbelow
set timeoutlen=1000
set cursorline

" Vim Settings {{{1
set mouse=a
set backspace=indent,eol,start
set confirm
set hidden
set history=1000
set noswapfile
set autowrite
set updatetime=100
set wildmenu
set linebreak " Don't wrap in middle of word
set encoding=utf-8
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" Indent Settings {{{1
set autoindent
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4

" Search Settings {{{1
set hlsearch
set ignorecase
set smartcase
set incsearch
set wrapscan

nnoremap <silent> <leader><space> :nohl<cr>
nnoremap <space> A
nnoremap sa ggVG

nnoremap <silent> bn :bNext<cr>
nnoremap <silent> bp :bprevious<cr>
nmap Q :q<cr>


au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=500}

"hi IncSearch gui=bold guifg=black guibg=yellow
hi IncSearch cterm=NONE ctermfg=black ctermbg=yellow



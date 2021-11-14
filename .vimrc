" Things that go first ! {{{1
set nocompatible
let mapleader = ','
let &t_ut='' " This is so vim doesn't look stupid in kitty.
filetype plugin indent on
syntax enable

" vim-plug {{{1
call plug#begin('~/.vim/plugged')
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
" UI Settings {{{1
color OceanicNext
set termguicolors
set title
set number
set ruler
set ttimeoutlen=0
set splitright
set splitbelow
set timeoutlen=1000
set cursorline
set shortmess-=S " Show number of matches when searching with '/' or '?'

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

" Fold Settins {{{1
"    Vim folding commands
"---------------------------------
"zf#j creates a fold from the cursor down # lines.
"zf/ string creates a fold from the cursor to string .
"zj moves the cursor to the next fold.
"zk moves the cursor to the previous fold.
"za toggle a fold at the cursor.
"zo opens a fold at the cursor.
"zO opens all folds at the cursor.
"zc closes a fold under cursor.
"zm increases the foldlevel by one.
"zM closes all open folds.  (fold all)
"zr decreases the foldlevel by one.
"zR decreases the foldlevel to zero -- (un-fold all)
"zd deletes the fold at the cursor.
"zE deletes all folds.
"[z move to start of open fold.
"]z move to end of open fold.
"---------------------------------
set foldmethod=indent
"set foldnestmax=1
set foldlevel=99
" uncomment to disable fold on file open
set nofoldenable
" Completion Settings {{{1
set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c   " Shut off completion messages
let g:mucomplete#enable_auto_at_startup = 1

" Keymaps {{{1
"
" scroll each visible line of wrapped line
" (use g0 and g$ to move to begin and end of visible lines)
nnoremap <A-j> gj
nnoremap <A-k> gk

tnoremap <A-n> <c-\><c-n>

"copy into sys clipboard
vnoremap <silent> CP "+y
"paste from sys clipboard
nnoremap <silent> CV "+p
" copy line into sys clipboard
map <silent> CL I<Esc>v$h"+y
nnoremap <silent> <leader>cd :cd %:p:h<cr>
nnoremap <silent> <leader>n :set number!<cr>
nnoremap <silent> <leader>s :set spell!<cr>
nnoremap sa ggVG
nnoremap <silent> bn :bnext<cr>
nnoremap <silent> bp :bNext<cr>
nnoremap <silent> bc :bdelete!<cr>
nnoremap <silent> <leader><space> :nohl<cr>
nnoremap J }
nnoremap K {
map Q :q<cr>
nnoremap <silent> CC :clo<cr>
nnoremap <space> A
" resize splits
nnoremap <silent> <F5> :resize +2<cr>
nnoremap <silent> <F6> :resize -2<cr>
nnoremap <silent> <F7> :vertical resize +2<cr>
nnoremap <silent> <F8> :vertical resize -2<cr>
nnoremap <leader>f :Files<cr>



" Auto Commands {{{1
"
" No auto comment on next line
autocmd FileType * setlocal formatoptions-=ro
" vim:foldenable foldmethod=marker foldcolumn=1 foldlevel=0

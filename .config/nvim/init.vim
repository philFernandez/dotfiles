let mapleader=","


call plug#begin(stdpath('data') . '/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'preservim/nerdcommenter'
Plug 'fladson/vim-kitty'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'junegunn/fzf.vim'
Plug '/opt/homebrew/opt/fzf'
Plug 'nvim-lualine/lualine.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" See https://github.com/artur-shaik/jc.nvim for info on setting up/getting
" auto-comp working
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'williamboman/nvim-lsp-installer'
Plug 'puremourning/vimspector'
Plug 'artur-shaik/jc.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

set completeopt=menu,menuone,noselect

color nightfox

set title
set noshowmode
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

nnoremap <silent> bn :bnext<cr>
nnoremap <silent> bp :bprevious<cr>
noremap <silent> CC :close!<CR>
nmap Q :q<cr>
vnoremap CV "*y
nnoremap CP "*p
nnoremap J }
nnoremap K {
nnoremap <silent> <leader>l :Buf<CR>
nnoremap <silent> <leader>f :NvimTreeToggle<cr>
nnoremap <silent> <leader>s :source ~/.config/nvim/init.vim<cr>

let g:vimspector_enable_mappings = 'HUMAN'

" Delete whitespace on save
"au BufWritePre * :%s/\s\+$//e

" Format file on sync (using lsp?)
au BufWritePre * lua vim.lsp.buf.formatting_sync()
au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=500}

"hi IncSearch gui=bold guifg=black guibg=yellow
hi IncSearch cterm=NONE ctermfg=black ctermbg=yellow

" fix broken cursor line for neovim only ----------------
function! s:CustomizeColors()
  if has('guirunning') || has('termguicolors')
    let cursorline_gui=''
    let cursorline_cterm='ctermfg=white'
  else
    let cursorline_gui='guifg=white'
    let cursorline_cterm=''
  endif
  exec 'hi CursorLine ' . cursorline_gui . ' ' . cursorline_cterm
endfunction

augroup OnColorScheme
  autocmd!
  autocmd ColorScheme,BufEnter,BufWinEnter * call s:CustomizeColors()
augroup END
" -------------------------------------------------------

luafile ~/.config/nvim/configs.lua

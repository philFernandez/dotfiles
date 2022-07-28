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
Plug 'machakann/vim-highlightedyank'
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

" Load up lua config file. This line has to be right below VimPlug list.
luafile ~/.config/nvim/configs.lua

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
nnoremap <silent> bd :bwipeout<CR>
nnoremap <silent> CC :close!<CR>
nmap Q :q<cr>
vnoremap CV "*y
nnoremap CP "*p
nnoremap J }
nnoremap K {
nnoremap <silent> <leader>l :Buf<CR>
nnoremap <silent> <leader>f :NvimTreeToggle<cr>
nnoremap <silent> <leader>s :source ~/.config/nvim/init.vim<cr>

" Go to Buffers
nnoremap <silent> <leader>1 :LualineBuffersJump 1<cr>
nnoremap <silent> <leader>2 :LualineBuffersJump 2<cr>
nnoremap <silent> <leader>3 :LualineBuffersJump 3<cr>
nnoremap <silent> <leader>4 :LualineBuffersJump 4<cr>
nnoremap <silent> <leader>5 :LualineBuffersJump 5<cr>
nnoremap <silent> <leader>6 :LualineBuffersJump 6<cr>
nnoremap <silent> <leader>7 :LualineBuffersJump 7<cr>
nnoremap <silent> <leader>8 :LualineBuffersJump 8<cr>
nnoremap <silent> <leader>9 :LualineBuffersJump 9<cr>


let g:vimspector_enable_mappings = 'HUMAN'


" Disable automatic comments
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Delete whitespace on save
"au BufWritePre * :%s/\s\+$//e

" Format file on sync (using lsp?)
au BufWritePre * lua vim.lsp.buf.formatting_sync()

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


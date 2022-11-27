let mapleader=","

" VIMWIKI like plugin for neovim
" jakewvincent/mkdnflow.nvim : already installed. just read the docs

" Vim Plug {{{1
call plug#begin(stdpath('data') . '/plugged')
Plug 'mhartington/formatter.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'williamboman/mason.nvim'
Plug 'jakewvincent/mkdnflow.nvim'
Plug 'ap/vim-css-color'
Plug 'akinsho/bufferline.nvim'
Plug 'preservim/nerdcommenter'
Plug 'fladson/vim-kitty'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'junegunn/fzf.vim'
Plug '/opt/homebrew/opt/fzf'
Plug 'nvim-lualine/lualine.nvim'
Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
Plug 'EdenEast/nightfox.nvim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-highlightedyank'
" See https://github.com/artur-shaik/jc.nvim for info on setting up/getting
" auto-comp working
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'puremourning/vimspector'
"Plug 'artur-shaik/jc.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" Vim Settings {{{1

" Load up lua config file. This line has to be right below VimPlug list.
luafile ~/.config/nvim/configs.lua

set completeopt=menu,menuone,noselect
set termguicolors
set title
set noshowmode
set number
set ruler
set ttimeoutlen=0
set splitright
set splitbelow
set timeoutlen=1000
set cursorline
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

" Keymaps {{{1
nnoremap <silent> <leader><space> :nohl<cr>
nnoremap <space> A
nnoremap sa ggVG

nnoremap <silent> bn :BufferLineCycleNext<cr>
nnoremap <silent> bp :BufferLineCyclePrev<cr>
nnoremap <silent> bd :bwipeout<CR>
nmap Q :q<cr>
vnoremap CV "*y
nnoremap J }
nnoremap K {
nnoremap <silent> <leader>l :Buffers<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <leader>f :NvimTreeToggle<cr>
nnoremap <silent> <leader>s :source ~/.config/nvim/init.vim<cr>

" Go to Buffers
nnoremap <silent> <leader>1 :BufferLineGoToBuffer 1<cr>
nnoremap <silent> <leader>2 :BufferLineGoToBuffer 2<cr>
nnoremap <silent> <leader>3 :BufferLineGoToBuffer 3<cr>
nnoremap <silent> <leader>4 :BufferLineGoToBuffer 4<cr>
nnoremap <silent> <leader>5 :BufferLineGoToBuffer 5<cr>
nnoremap <silent> <leader>6 :BufferLineGoToBuffer 6<cr>
nnoremap <silent> <leader>7 :BufferLineGoToBuffer 7<cr>
nnoremap <silent> <leader>8 :BufferLineGoToBuffer 8<cr>
nnoremap <silent> <leader>9 :BufferLineGoToBuffer 9<cr>


" Non-Lua Plugin Configs {{{1
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
"}}}

" Autocmds, variables, functions {{{1

let g:vimspector_enable_mappings = 'HUMAN'

" neovim integrated terminal settings -------
au TermOpen * setlocal nonumber
" -------------------------------------------


" Disable automatic comments
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Delete whitespace on save
"au BufWritePre * :%s/\s\+$//e

au BufWritePre *.php lua vim.lsp.buf.formatting_sync()

augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
augroup END


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

" vim:foldenable foldmethod=marker foldcolumn=1 foldlevel=0

let mapleader=","
syntax enable


call plug#begin(stdpath('data') . '/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'rafi/awesome-vim-colorschemes'
"Plug 'lifepillar/vim-mucomplete'
Plug 'preservim/nerdcommenter'
Plug 'fladson/vim-kitty'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf.vim'
Plug '/opt/homebrew/opt/fzf'

" See https://github.com/artur-shaik/jc.nvim for info on setting up/getting
" auto-comp working
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp' 
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'williamboman/nvim-lsp-installer'
Plug 'puremourning/vimspector'
Plug 'artur-shaik/jc.nvim'

call plug#end()

lua require('jc').setup{}

set completeopt=menu,menuone,noselect

color OceanicNext

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
vnoremap CV "*y
nnoremap CP "*p


au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=500}

"hi IncSearch gui=bold guifg=black guibg=yellow
hi IncSearch cterm=NONE ctermfg=black ctermbg=yellow


lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<C-Space>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },

    ['<Tab>'] = function(fallback)
      if not cmp.select_next_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,

    ['<S-Tab>'] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
EOF

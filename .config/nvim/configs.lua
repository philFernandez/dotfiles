-- vim:foldenable foldmethod=marker foldcolumn=1 foldlevel=0

-- {{{ colorscheme +++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Valid styles
--bold
--underline
--undercurl	    curly underline
--underdouble	double underline
--underdotted	dotted underline
--underdashed	dashed underline
--strikethrough
--reverse
--inverse		same as reverse
--italic
--standout
--nocombine	override attributes instead of combining them
--NONE		no attributes used (used to reset it)

-- Calls colorscheme automagically
--require('onenord').setup({
    --theme = nil, -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
    --borders = true, -- Split window borders
    --fade_nc = false, -- Fade non-current windows, making them more distinguishable
    ---- Style that is applied to various groups: see `highlight-args` for options
    --styles = {
        --comments = "italic",
        --strings = "bold",
        --keywords = "bold",
        --functions = "bold",
        --variables = "bold",
        --diagnostics = "undercurl",
    --},
    --disable = {
        --background = false, -- Disable setting the background color
        --cursorline = false, -- Disable the cursorline
        --eob_lines = true, -- Hide the end-of-buffer lines
    --},
    ---- Inverse highlight for different groups
    --inverse = {
        --match_paren = false,
    --},
    --custom_highlights = {}, -- Overwrite default highlight groups
    --custom_colors = {}, -- Overwrite default colors
--})

require('nightfox').setup({
  options = {
    styles = {              
      comments = "italic",    
      conditionals = "bold",
      constants = "bold",
      functions = "bold",
      keywords = "bold",
      numbers = "NONE",
      operators = "bold",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {},           
  },
  palettes = {},
  specs = {},
  groups = {},
})
vim.cmd("colorscheme nightfox")

-- }}}

-- {{{ nvim-lsp-installer +++++++++++++++++++++++++++++++++++++++++
require("nvim-lsp-installer").setup {}
-- }}}

--{{{ nvim-tree ++++++++++++++++++++++++++++++++++++++++++++++++++
require("nvim-tree").setup()
-- }}}

-- {{{ bufferline +++++++++++++++++++++++++++++++++++++++++++++++++
vim.opt.termguicolors = true
require('bufferline').setup {
    options = {
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree",
                text = "Nvim Tree", 
                text_align = "left",
                separator = true
            }
        },
        --separator_style = "slant" | "thick" | "thin" | { 'any', 'any' },
    }
}
-- }}}

-- {{{ lua-line +++++++++++++++++++++++++++++++++++++++++++++++++++
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', { 'fileformat', icons_enabled = false }, 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        --lualine_a = { 'buffers' },
        --lualine_z = { 'tabs' }
    },
    winbar = {
    },
    inactive_winbar = {},
    extensions = { 'fzf' }
}
-- }}}

-- {{{ java-lsp +++++++++++++++++++++++++++++++++++++++++++++++++++
require('jc').setup {}
--}}}

-- {{{ nvim-treesitter ++++++++++++++++++++++++++++++++++++++++++++
require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    -- ensure_installed = { "java", "vim" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    -- sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- auto_install = true,

    -- List of parsers to ignore installing (for "all")
    -- ignore_install = { "javascript" },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        --disable = {"vim"},

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = { "vim" },
    },
}
-- }}}

-- {{{ nvim-lspconfig +++++++++++++++++++++++++++++++++++++++++++++
-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'vimls', 'tsserver', 'pylsp', 'intelephense' } -- <- ADD NEW LSP SERVER NAMES HERE
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        -- on_attach = my_custom_on_attach,
        capabilities = capabilities,
    }
end
-- }}}

-- {{{ nvim-cmp +++++++++++++++++++++++++++++++++++++++++++++++++++
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
local cmp = require("cmp")

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            --luasnip.lsp_expand(args.body)
            require('luasnip').lsp_expand(args.body)
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
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),

    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        --{ name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
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
-- }}}

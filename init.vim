" -------------------------------------------------------------------------

" Plugins

call plug#begin()

Plug 'neovim/nvim-lspconfig'       		" Core LSP support

Plug 'hrsh7th/nvim-cmp'             	" Autocompletion popup
Plug 'hrsh7th/cmp-nvim-lsp'         
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

Plug 'mason-org/mason.nvim'				" Auto to install lsp languages
Plug 'mason-org/mason-lspconfig.nvim'	

Plug 'EdenEast/nightfox.nvim'

call plug#end()

" -------------------------------------------------------------------------

" General config

lua << EOF

-- Options :set 
vim.opt.number = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.colorcolumn = "100"

-- Command :
vim.cmd.colorscheme = "carbonfox"

-- Global :let
vim.g.mapleader = " "
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25

-- Keymap :noremap
vim.keymap.set( { "n", "v" }, "<leader>y", ":y+<CR>", { noremap = true, silent = true })
vim.keymap.set( { "n", "v" }, "<leader>e", ":Lexplore<CR>", { noremap = true, silent = true })
vim.keymap.set( { "n", "v" }, "<leader>t", ":terminal<CR>", { noremap = true, silent = true })

EOF

" -------------------------------------------------------------------------

" Plugin config 

" Mason
lua << EOF

-- Mason
require("mason").setup()
require("mason-lspconfig").setup()

-- Cmp
local cmp = require'cmp'

cmp.setup({
	window = {
	  -- completion = cmp.config.window.bordered(),
	  -- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
	  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
	  ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  ['<C-Space>'] = cmp.mapping.complete(),
	  ['<C-e>'] = cmp.mapping.abort(),
	  ['<CR>'] = cmp.mapping.confirm({ select = true }),   
	}),
	sources = cmp.config.sources({
	  { name = 'nvim_lsp' },
	  { name = 'buffer' },
	})
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['kotlin_language_server'].setup {
		capabilities = capabilities
}
EOF

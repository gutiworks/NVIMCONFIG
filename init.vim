" -------------------------------------------------------------------------

" General config

lua << EOF

-- Options :set 
-- vim.opt.number = true
-- vim.opt.splitright = true
-- vim.opt.tabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.colorcolumn = "100"
-- vim.opt.path:append("**")

-- Command :
-- vim.cmd.colorscheme = "default"

-- Global :let
-- vim.g.mapleader = " "
-- vim.g.netrw_liststyle = 3
-- vim.g.netrw_winsize = 25
vim.g.startify_custom_header = {
  [[ ____                         _   ]],
  [[|  _ \  __ ___   ___ __   ___| |_ ]],
  [[| | | |/ _` \ \ / / '_ \ / _ \ __|]],
  [[| |_| | (_| |\ V /| | | |  __/ |_ ]],
  [[|____/ \__,_| \_/ |_| |_|\___|\__|]],
}
vim.g.startify_custom_footer = {
  "",
  "Welcome — you are plugged into DAVNET",
  "ようこそ — ダブネットに接続しています",
}
vim.g.startify_enable_special = 0  
vim.g.startify_files_number = 0

-- Keymap :noremap
-- vim.keymap.set( { "n", "v" }, "<leader>t", ":terminal<CR>", { noremap = true, silent = true })
-- vim.keymap.set( { "n", "v" }, "<leader>e", ":Lexplore<CR>", { noremap = true, silent = true })
-- vim.keymap.set( { "n", "v" }, "<leader>y", ":y+<CR>", { noremap = true, silent = true })
-- vim.keymap.set( "n", "<leader>d", ":lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
-- vim.keymap.set( "n", "<leader>de", ":lua vim.diagnostic.setqflist()<CR>", { noremap = true, silent = true })

EOF

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
Plug 'mhinz/vim-startify'

call plug#end()

colorscheme carbonfox

" -------------------------------------------------------------------------

" Plugin config 

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

" -------------------------------------------------------------------------

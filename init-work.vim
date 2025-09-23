" -------------------------------------------------------------------------

" General config

lua << EOF

-- Options :set 
vim.opt.number = true
vim.opt.splitright = true
vim.opt.splitbelow = true 
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.path:append("**")

-- Command :
-- vim.cmd.colorscheme = "default"

-- Global :let
vim.g.mapleader = " "
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25

-- Keymap :noremap
vim.keymap.set( { "n", "v" }, "<leader>e", ":Lexplore<CR>", { noremap = true, silent = true })
vim.keymap.set( { "n", "v" }, "<leader>y", ":y+<CR>", { noremap = true, silent = true })
vim.keymap.set( "n", "<leader>b", ":bn<CR>", { noremap = true, silent = true } )
-- vim.keymap.set( { "n", "v" }, "<leader>t", ":terminal<CR>", { noremap = true, silent = true })
-- vim.keymap.set( "n", "<leader>d", ":lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
-- vim.keymap.set( "n", "<leader>h", ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
-- vim.keymap.set( "n", "<leader>de", ":lua vim.diagnostic.setqflist()<CR>", { noremap = true, silent = true })
-- vim.keymap.set( "n", "<leader>r", ":!javac --release 8 % && java Main<CR>", { noremap = true, silent = true})

EOF

" -------------------------------------------------------------------------

" Plugins

call plug#begin()

Plug 'neovim/nvim-lspconfig'       		

Plug 'mason-org/mason.nvim'				
Plug 'mason-org/mason-lspconfig.nvim'	

Plug 'hrsh7th/nvim-cmp'             	
Plug 'hrsh7th/cmp-nvim-lsp'         
Plug 'hrsh7th/cmp-buffer'

Plug 'EdenEast/nightfox.nvim'

call plug#end()

colorscheme carbonfox

" -------------------------------------------------------------------------

" Plugin config 

lua << EOF

-- Diagnostic configuration
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	float = { border = "rounded" },
})

-- Mason
require("mason").setup()
require("mason-lspconfig").setup()

-- Cmp
local cmp = require'cmp'

cmp.setup({
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

vim.lsp.config["kotlin_language_server"] = {
		capabilities = capabilities
}

vim.lsp.enable("jdtls")

EOF

" -------------------------------------------------------------------------

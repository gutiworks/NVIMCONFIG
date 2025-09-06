" -------------------------------------------------------------------------

" General config

colorscheme habamax " Change theme
set number " Add numbers 
let mapleader = " " " Use <Space> as leader (if not already set) 
nnoremap <leader>e :Lexplore<CR> " Shortcut: <Space>e to toggle Lexplorer 
let g:netrw_liststyle = 3 " tree view by default 
let g:netrw_winsize = 25 " width of explorer panel 
" let g:netrw_banner = 2 " hide banner for a cleaner view
nnoremap <leader>t :terminal<CR> " Open terminal

" -- Lua (init.lua)
vim.cmd [[
  highlight Normal ctermbg=none guibg=none
  highlight NonText ctermbg=none guibg=none
]]

" -------------------------------------------------------------------------

" Plugins

call plug#begin()
"   " List your plugins here
Plug 'neovim/nvim-lspconfig'        " Core LSP support
Plug 'hrsh7th/nvim-cmp'             " Autocompletion popup
Plug 'hrsh7th/cmp-nvim-lsp'         " Hook LSP completions into nvim-cmp

Plug 'mason-org/mason.nvim'		" Mason to install lsp languages
Plug 'mason-org/mason-lspconfig.nvim'	" Mason to install lsp languages

call plug#end()

" Plugin config 
" require("mason-lspconfig").setup()
" === Lua setup ===
lua << EOF
require("mason").setup()
require("mason-lspconfig").setup()
EOF

lua << EOF
require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- An example for configuring `clangd` LSP to use nvim-cmp as a completion engine
require('lspconfig').clangd.setup {
  capabilities = capabilities,
  ...  -- other lspconfig configs
}
EOF

" -------------------------------------------------------------------------

" General config

colorscheme habamax 			" Change theme
set number 				" Add numbers 
set splitright 				" Open tabs on the right side
let mapleader = " " 			" Use <Space> as leader (if not already set) 
nnoremap <leader>e :Lexplore<CR> 	" Short added 
nnoremap <leader>t :terminal<CR> 	" Open terminal
let g:netrw_liststyle = 3 		" tree view by default 
let g:netrw_winsize = 25 		" width of explorer panel 
" let g:netrw_banner = 2 		" hide banner for a cleaner view

" hi Normal ctermbg=none guibg=none guifg=#ffffff	 	" Transparent wallpaper
" hi NonText ctermbg=none guibg=none guifg=#555555	" Transparent wallpaper

" -------------------------------------------------------------------------

" Plugins

call plug#begin()

Plug 'neovim/nvim-lspconfig'       	" Core LSP support
Plug 'hrsh7th/nvim-cmp'             	" Autocompletion popup
Plug 'hrsh7th/cmp-nvim-lsp'         
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

Plug 'mason-org/mason.nvim'		" Auto to install lsp languages
Plug 'mason-org/mason-lspconfig.nvim'	
Plug 'EdenEast/nightfox.nvim'

call plug#end()

" -------------------------------------------------------------------------

" Plugin config 

" Mason
lua << EOF
require("mason").setup()
require("mason-lspconfig").setup()
EOF

" Nvim-cmp
lua <<EOF
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

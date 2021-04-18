"Plugins
call plug#begin('~/.vim/plugged')

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" brackets, comments
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'

"Start screen
Plug 'mhinz/vim-startify'

"Telescope 
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Icons for Telescope
Plug 'kyazdani42/nvim-web-devicons'

"Theme
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Colors
Plug 'norcalli/nvim-colorizer.lua'
Plug 'junegunn/rainbow_parentheses.vim'

call plug#end()


" LSP Server setup
autocmd BufEnter * lua require'completion'.on_attach()
lua require'lspconfig'.gopls.setup{}
lua require'lspconfig'.bashls.setup{}


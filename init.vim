"(Neo)Vim Rocks V2
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
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview

" Javascript, JSX, Typescript Syntax Highlight
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'

" multi line selector
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" File explorer
Plug 'kyazdani42/nvim-tree.lua'

call plug#end()


" completion-nvim - Enable TAB to trigger completion
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" LSP Server setup
lua require'lspconfig'.gopls.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.bashls.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.dockerls.setup{on_attach=require'completion'.on_attach}

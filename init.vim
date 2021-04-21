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

"Icons for Telescope - nvim-tree
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

" Snippets
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Git
Plug 'kdheepak/lazygit.nvim'
Plug 'mhinz/vim-signify'

call plug#end()

"Signify
set updatetime=100

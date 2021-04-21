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

autocmd BufEnter * lua require'completion'.on_attach()

"Signify
set updatetime=100

"UtilSnips setup
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.


" completion-nvim - Enable TAB to trigger completion
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)
let g:completion_enable_snippet = 'UltiSnips'


" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <silent><expr> <Tab>   pumvisible() ? "\<C-c>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" LSP Server setup
lua require'lspconfig'.gopls.setup{}
lua require'lspconfig'.bashls.setup{}
lua require'lspconfig'.dockerls.setup{}
lua require'lspconfig'.cssls.setup{}
lua require'lspconfig'.tsserver.setup{}
lua require'lspconfig'.html.setup{}
lua require'lspconfig'.dartls.setup{}

"ignore files
let g:completion_matching_strategy_list=["exact", "substring", "fuzzy"]
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

set completeopt=menuone,noinsert,noselect
set nu
set relativenumber
set nohlsearch
set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set signcolumn=yes
set isfname+=@-@
set updatetime=50
set shortmess+=c
set colorcolumn=80
set cursorline
set clipboard+=unnamedplus
set splitbelow
set splitright
set cmdheight=2
set mouse=a
set autoindent

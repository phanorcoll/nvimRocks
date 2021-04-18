"Plugins
call plug#begin('~/.vim/plugged')
"Telescope 
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Icons for Telescope
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

"General Remaps
let mapleader = " "
inoremap <C-c> <esc>

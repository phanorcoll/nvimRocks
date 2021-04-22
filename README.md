## (Neo)vim Rocks v2

Hey guys, I'm sharing my (Neo)Vim configurations, this will be a work in progress since I'm always exploring new ways to improve my coding experience.

To work with the latest features, including native LSP, you're going to need **NVIM > v0.5 nightly** [download here](https://github.com/neovim/neovim/releases/nightly) 

### Currently Using
```
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
```

### Instalation

Clone this repo in your root path ~/ or $HOME and run `./install`
This will create the needed folders inside `~/HOME/.config/nvim` and create the symlink to all the files, this way you can edit your config without worrying about PATHS o messing directly with `.config/`

After opening **nvim** run `:PlugInstall` to install all the plugins listed above.

You may notice that there are no direct links to any of the configuration files, this is because all the config files `.lua` or `.vim` are loaded when you fire up (Neo)vim, sweet right? :) 

## TODO
- [ ] Setup terminal integration.
- [ ] Convert all configuration files to `.lua`.
- [ ] Improve on keybindings.
- [ ] Improve installation script


Got any suggestions, better plugins, configurations, let me know [@phanor](https://twitter.com/phanor)

**- Keep Moving Forward -**

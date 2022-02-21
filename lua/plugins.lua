local execute = vim.api.nvim_command

-- check if packer is installed (~/.local/share/nvim/site/pack)
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local compile_path = install_path .. "/plugin/packer_compiled.lua"
local is_installed = vim.fn.empty(vim.fn.glob(install_path)) == 0

if not is_installed then
    if vim.fn.input("Install packer.nvim? (y for yes) ") == "y" then
        execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
        execute("packadd packer.nvim")
        print("Installed packer.nvim.")
        is_installed = 1
    end
end

-- Packer commands
vim.cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
vim.cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
vim.cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
vim.cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]
vim.cmd [[command! PC PackerCompile]]
vim.cmd [[command! PS PackerStatus]]
vim.cmd [[command! PU PackerSync]]

local packer = nil
if not is_installed then return end
if packer == nil then
  packer = require('packer')
  packer.init({
    -- we don't want the compilation file in '~/.config/nvim'
    compile_path = compile_path
  })
end
-- end packer verification

local use = packer.use

-- Packer can manage itself
use {'wbthomason/packer.nvim'}

-- Needed to load first
use {'lewis6991/impatient.nvim'}
use {'nathom/filetype.nvim'}
use {'nvim-lua/plenary.nvim'}
use {'kyazdani42/nvim-web-devicons'}

-- Theme
use 'EdenEast/nightfox.nvim'

-- Treesitter
use {'nvim-treesitter/nvim-treesitter', config = "require('plugins.treesitter')", run = ':TSUpdate'}
use {'nvim-treesitter/nvim-treesitter-textobjects', after = {'nvim-treesitter'}}

-- LSP
use {'neovim/nvim-lspconfig'}
use {'williamboman/nvim-lsp-installer', config = "require('lsp.installer')"}
use {'onsails/lspkind-nvim', config = "require('plugins.kind')"}

-- Autocompletion nvim-cmp
use {
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-calc',
  },
}
use {'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp'}
use {'David-Kunz/cmp-npm', requires = 'nvim-lua/plenary.nvim', after = 'nvim-cmp', config = "require('plugins.cmp-npm')"}


-- Snippets & Syntax
use {'windwp/nvim-autopairs', after = {'nvim-treesitter', 'nvim-cmp'}, config = "require('plugins.autopairs')"}
use {'p00f/nvim-ts-rainbow'}
use {'norcalli/nvim-colorizer.lua', config = "require('plugins.colorizer')"}
use {'hrsh7th/vim-vsnip'}
use {'SirVer/ultisnips', requires = {"honza/vim-snippets", "quangnguyen30192/cmp-nvim-ultisnips"}, config = "require('plugins.ultisnips')", after = 'nvim-cmp'}
use {'lukas-reineke/indent-blankline.nvim', config = "require('plugins.indent')"}
use {'crispgm/nvim-go'}
use {'mfussenegger/nvim-lint'}
use {'heavenshell/vim-jsdoc'}

-- Telescope
 use {'nvim-telescope/telescope.nvim', config = "require('plugins.telescope')",
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim'}
    }
  }
use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
use {'ahmedkhalf/project.nvim', config = function() require('project_nvim').setup{} end}
use {'/xiyaowong/telescope-emoji.nvim'}

-- General Plugins
use {'tpope/vim-commentary'}
use {'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter'}
use {'mg979/vim-visual-multi'}
use {'szw/vim-maximizer'}
use {'nacro90/numb.nvim', config = "require('plugins.numb')"}
use {'folke/todo-comments.nvim'}
use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', 'arkav/lualine-lsp-progress'}}
use {'romgrk/barbar.nvim', config = "require('plugins.bar')"}
use {'folke/twilight.nvim', config = function() require("twilight").setup {} end}
--use {'folke/which-key.nvim', config = "require('plugins.which-key')", event = "BufWinEnter"}
-- use {'glepnir/dashboard-nvim', config = "require('plugins.dashboard')"}


-- LSP
--use {'tami5/lspsaga.nvim', config = "require('plugins.saga')"}
--use {'onsails/lspkind-nvim', config = "require('plugins.kind')"}
--use {'folke/lsp-trouble.nvim', config = "require('plugins.trouble')"}
--use {'nvim-lua/popup.nvim'}
--use {'jose-elias-alvarez/null-ls.nvim'}
--use {'jose-elias-alvarez/nvim-lsp-ts-utils', after = {'nvim-treesitter'}}


--nvim-tree
use {'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons'}, config = "require('plugins.tree')" }

--Dart/Flutter
use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
use 'dart-lang/dart-vim-plugin'
use 'natebosch/vim-lsc'
use 'natebosch/vim-lsc-dart'

-- Git
--use {'lewis6991/gitsigns.nvim',
--  requires = { 'nvim-lua/plenary.nvim' },
--  config = "require('plugins.gitsigns')",
--  event = "BufRead"
--}
--se {'sindrets/diffview.nvim'}

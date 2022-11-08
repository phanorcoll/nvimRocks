local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter", config = "require('mrdupin.treesitter')", run = ":TSUpdate" })
  use({ "nvim-treesitter/nvim-treesitter-textobjects", after = { "nvim-treesitter" } })

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugin

  -- statusline written in Lua.
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  -- Theme
  use("EdenEast/nightfox.nvim")

  -- Notifications manager
  use({ "rcarriga/nvim-notify" })

  -- enable LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "onsails/lspkind-nvim",
  }

  use {
    "danymat/neogen",
    config = function()
      require('neogen').setup({ snippet_engine = "luasnip" })
    end,
    requires = "nvim-treesitter/nvim-treesitter",
  }

  -- snippet engine
  use({ "L3MON4D3/LuaSnip" })

  -- completion
  use({
    "hrsh7th/nvim-cmp", -- the completion plugin
    "hrsh7th/cmp-buffer", -- buffer completion
    "hrsh7th/cmp-cmdline", -- cmdline completion
    "saadparwaiz1/cmp_luasnip", -- snippet completion
    "hrsh7th/cmp-nvim-lsp", -- LSP completion
    "hrsh7th/cmp-nvim-lua",
  })
  use({ "David-Kunz/cmp-npm", config = "require('mrdupin.cmp-npm')" })

  use("ray-x/go.nvim")

end)

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


-- Install your plugins here
return packer.startup(function(use)


  -- List of plugins here
  -- needed for other plugins
  use "wbthomason/packer.nvim"                                                       -- Have packer manage itself
  use "nvim-lua/popup.nvim"                                                          -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"                                                        -- Useful lua functions used by lots of plugins

  use {'rcarriga/nvim-notify'}                                                       -- Notifications manager 

  -- Theme
  use 'EdenEast/nightfox.nvim'

  -- Autocompletion LSP cmp
  use {'hrsh7th/nvim-cmp'}                                                           -- the completion plugin
  use {'hrsh7th/cmp-buffer'}                                                         -- buffer completion
  use {'hrsh7th/cmp-path'}                                                           -- path completion
  use {'hrsh7th/cmp-cmdline'}                                                        -- cmdline completion
  use {'saadparwaiz1/cmp_luasnip'}                                                   -- snippet completion
  use {'hrsh7th/cmp-nvim-lsp'}                                                       -- LSP completion
  use {'hrsh7th/cmp-nvim-lua'}                                                       --

  -- snippets
  use {'L3MON4D3/LuaSnip'}                                                           -- snippet engine
  use {'rafamadriz/friendly-snippets'}                                               -- set of snippets for different languages

  -- LSP
  use {'neovim/nvim-lspconfig'}                                                      -- enable LSP
  use {'williamboman/nvim-lsp-installer'}                                            -- Language server installer



  -- Automatically set up your configuration after cloning packer.nvim
  -- This goes at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

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

-- Automatically run: PackerCompile
vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
    pattern = "plugins.lua",
    command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use)
  -- Packer
  use("wbthomason/packer.nvim")

  -- Common utilities
  use("nvim-lua/plenary.nvim")

  -- Icons
  use("nvim-tree/nvim-web-devicons")

  -- Colorschema
  use("rebelot/kanagawa.nvim")

  -- Statusline
  use({
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    config = function()
      require("mrdupin.configs.lualine")
    end,
    requires = { "nvim-web-devicons" },
  })

  -- Treesitter
  use({
      "nvim-treesitter/nvim-treesitter",
      run = function()
          require("nvim-treesitter.install").update({ with_sync = true })
      end,
      config = function()
          require("mrdupin.configs.treesitter")
      end,
  })

  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

   -- Telescope
  use({
      "nvim-telescope/telescope.nvim",
      tag = "0.1.1",
      requires = { { "nvim-lua/plenary.nvim" } },
  })

  -- LSP
  use({
      "neovim/nvim-lspconfig",
      config = function()
          require("mrdupin.configs.lsp")
      end,
  })

  use("onsails/lspkind-nvim")
  use({
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      tag = "v<CurrentMajor>.*",
  })

  -- cmp: Autocomplete
  use({
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      config = function()
          require("mrdupin.configs.cmp")
      end,
  })

  use("hrsh7th/cmp-nvim-lsp")

  use({ "hrsh7th/cmp-path", after = "nvim-cmp" })

  use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })

  -- LSP diagnostics, code actions, and more via Lua.
  use({
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
          require("mrdupin.configs.null-ls")
      end,
      requires = { "nvim-lua/plenary.nvim" },
  })

  
end)

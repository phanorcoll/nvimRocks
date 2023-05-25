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

  
end)

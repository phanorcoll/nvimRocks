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
    requires = { "nvim-tree/nvim-web-devicons" },
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

  use({
    "saadparwaiz1/cmp_luasnip",
    after = "nvim-cmp",
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

  -- Mason: Portable package manager
  use({
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  })

  use({
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mrdupin.configs.mason-lsp")
    end,
    after = "mason.nvim",
  })

  -- File manager
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    config = function()
      require("mrdupin.configs.neotree")
    end,
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  })

  -- Show colors
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" })
    end,
  })

  -- Terminal
  use({
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("mrdupin.configs.toggleterm")
    end,
  })

  -- Git
  -- use({
  --     "lewis6991/gitsigns.nvim",
  --     config = function()
  --         require("mrdupin.configs.gitsigns")
  --     end,
  -- })
  use {
    'tanvirtin/vgit.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require("mrdupin.configs.vgit")
    end,
  }

  -- Markdown Preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })

  -- Auto pairs
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("mrdupin.configs.autopairs")
    end,
  })

  -- Background Transparent
  use({
    "xiyaowong/nvim-transparent",
    config = function()
      require("transparent").setup({
        extra_groups = {
          "BufferLineTabClose",
          "BufferlineBufferSelected",
          "BufferLineFill",
          "BufferLineBackground",
          "BufferLineSeparator",
          "BufferLineIndicatorSelected",
        },
        exclude_groups = {},
      })
    end,
  })

  -- Easily comment code
  use({ "tpope/vim-commentary" })

  -- highlight and search todo commentes like TODO, HACK, BUG
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("mrdupin.configs.todo-comments")
    end,
  }

  -- A pretty list for showing diagnostics, references, telescope results, quickfix and location
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
      }
    end
  }

  -- copilot
  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("mrdupin.configs.copilot")
    end,
  }

  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
    config = function()
      require("copilot_cmp").setup({
        event = { "InsertEnter", "LspAttach" },
        fix_pairs = true,
      })
    end
  }

  -- Go debuging
  use({ "mfussenegger/nvim-dap" })
  use({
    "leoluz/nvim-dap-go",
    requires = { "mfussenegger/nvim-dap" },
    ft = { "go" },
    config = function()
      require("dap-go").setup()
    end,
  })

  -- Go extras
  use({
    "olexsmir/gopher.nvim",
    ft = { "go" },
    conifg = function()
      require("gopher").setup()
    end,
  })

  -- tmux integration
  use({ "christoomey/vim-tmux-navigator" })
end)

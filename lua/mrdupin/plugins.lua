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
	-- List of plugins here
	-- needed for other plugins
	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
		end,
	}) -- Speed up loading Lua modules in Neovim to improve startup time.
	use("nathom/filetype.nvim") -- speed up your neovim startup time
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins

	use({ "rcarriga/nvim-notify" }) -- Notifications manager

	-- Theme
	use("EdenEast/nightfox.nvim")

	-- General
	use({ "windwp/nvim-autopairs", config = "require('mrdupin.autopairs')" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "tpope/vim-commentary" }) -- Easily comment code
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = "require('mrdupin.nvimtree')",
	})
	use({ "romgrk/barbar.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
	use({ "mg979/vim-visual-multi" }) -- visual multiselector
	use({ "szw/vim-maximizer" }) -- Maximazes the active buffer
	use({
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup({})
		end,
	}) -- peeks lines of the buffer in non-obtrusive way
	-- Autocompletion LSP cmp
	use({ "hrsh7th/nvim-cmp" }) -- the completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completion
	use({ "hrnh7th/cmp-path" }) -- path completion
	use({ "hrsh7th/cmp-cmdline" }) -- cmdline completion
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completion
	use({ "hrsh7th/cmp-nvim-lsp" }) -- LSP completion
	use({ "hrsh7th/cmp-nvim-lua" }) --
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
	use({ "folke/todo-comments.nvim", config = "require('mrdupin.todo-comments')" }) -- highlight and search for todo comments like TODO, HACK, BUG
	use({ "David-Kunz/cmp-npm", after = "cmp-tabnine", config = "require('mrdupin.cmp-npm')" }) --
	use({
		"hoob3rt/lualine.nvim",
		config = "require('mrdupin.lualine')",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	}) -- statusline written in Lua.
	use({
		"folke/twilight.nvim",
		config = "require('mrdupin.twilight')",
	}) -- dims inactive portions of the code you're editing.
	use({ "glepnir/dashboard-nvim", config = "require('mrdupin.dashboard')" })
	use({
		"danymat/neogen",
		config = function()
			require("neogen").setup({})
		end,
		requires = "nvim-treesitter/nvim-treesitter",
		-- Uncomment next line if you want to follow only stable versions
		-- tag = "*"
	}) -- Annotation Toolkit, helps with documentins functions, classes, types
	use({ "kdheepak/lazygit.nvim" })
	use({ "norcalli/nvim-colorizer.lua", config = "require('colorizer').setup()" })
	use({ "lukas-reineke/indent-blankline.nvim", config = "require('mrdupin.indent')" }) -- adds indentation guides to all lines (including empty lines).
	use({ "mfussenegger/nvim-lint", config = "require('mrdupin.nvimlint')" }) -- An asynchronous linter plugin for Neovim (>= 0.6.0) complementary to the built-in Language Server Protocol support.
	use({ "iamcco/markdown-preview.nvim" }) -- Preview Markdown on browser
	use({
		"vuki656/package-info.nvim",
		requires = "MunifTanjim/nui.nvim",
		config = "require('mrdupin.package-info')",
	})

	-- snippets
	use({ "L3MON4D3/LuaSnip" }) -- snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- set of snippets for different languages

	-- LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer" }) -- Language server installer
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "onsails/lspkind-nvim" })
	use({ "stevearc/dressing.nvim", requires = "MunifTanjim/nui.nvim", config = "require('mrdupin.dressing')" })
	use({ "jose-elias-alvarez/nvim-lsp-ts-utils", after = { "nvim-treesitter" } })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", config = "require('mrdupin.telescope')" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
		end,
	})
	use({ "folke/lsp-trouble.nvim", config = "require('mrdupin.trouble')" }) -- A pretty list for showing diagnostics

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", config = "require('mrdupin.treesitter')", run = ":TSUpdate" })
	use({ "nvim-treesitter/nvim-treesitter-textobjects", after = { "nvim-treesitter" } })
	use({ "p00f/nvim-ts-rainbow" })
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Git
	use({ "lewis6991/gitsigns.nvim", config = "require('mrdupin.gitsigns')", event = "BufRead" })
	use({ "sindrets/diffview.nvim" })

	-- Go
	use("ray-x/go.nvim")

  -- Terreform
  use("hashivim/vim-terraform")

	-- Automatically set up your configuration after cloning packer.nvim
	-- This goes at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

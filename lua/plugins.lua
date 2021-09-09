return require('packer').startup(
  function()

    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Lsp and related plugin
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'folke/lsp-colors.nvim'

    -- Lsp for Go
    use {
      'crispgm/nvim-go',
      requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } }
    }

    -- auto completion
    -- use 'nvim-lua/completion-nvim'
    use 'hrsh7th/nvim-compe'

    -- Snipet support
    use 'sirver/UltiSnips'
    use 'honza/vim-snippets'

    -- Icons for Telescope - nvim-tree
    use 'kyazdani42/nvim-web-devicons'

    -- nvim-treesitter
    use {
    	'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'
    }
    use 'nvim-treesitter/nvim-treesitter-textObjects'

    -- Theme
    -- use 'navarasu/onedark.nvim'
    use 'folke/tokyonight.nvim'
    -- use 'shaunsingh/nord.nvim'
    use 'rakr/vim-one'

    -- Search/file browser
    use {
      'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } }
    }
    use 'nvim-telescope/telescope-symbols.nvim'
    -- use '/xiyaowong/telescope-emoji.nvim'
    use 'kyazdani42/nvim-tree.lua'

    --  Multi line selector
    use {
      'mg979/vim-visual-multi', branch= 'master'
    }

    -- Comment stuff out
    use 'tpope/vim-commentary'

    -- Maximize buffer
    use 'szw/vim-maximizer'

    -- Auto pair
    -- use 'jiangmiao/auto-pairs'
    use 'windwp/nvim-autopairs'

    -- Status bar
    use {
      'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Git integration -> Lazygit
    use 'kdheepak/lazygit.nvim'
    use 'mhinz/vim-signify'

    -- Start screen
    use 'glepnir/dashboard-nvim'

    -- Syntax highligh
    use 'mxw/vim-jsx'
    use 'pangloss/vim-javascript'

    -- Terraform
    use 'hashivim/vim-terraform'

    use "sbdchd/neoformat"

  end
)

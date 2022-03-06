require('colorscheme')
require('settings')
require('plugins')
require('keybindings')
require('plugins.lualine')
require('plugins.lint')

-- plugins config
require('plugins.cmp')

--Lsp
require('lsp.luaconf')
-- require('lsp.tsserver')
--
-- Runs PackerCompiler whenever plugins.lua is updated
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

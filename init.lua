require('impatient')
require('config')
require('colorscheme')
require('settings')
require('plugins')
require('keymappings')
require('plugins.lualine')
require('plugins.lint')

--Lsp
require('lsp.config')
require('lsp.bash')
require('lsp.css')
require('lsp.dart')
require('lsp.graphql')
require('lsp.html')
require('lsp.json')
require('lsp.tsserver')
require('lsp.terraform')
require('lsp.docker')
require('lsp.go')


-- Runs PackerCompiler whenever plugins.lua is updated
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

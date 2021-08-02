-- loads plugins
require('plugins')

-- loads Inital option settings (Global, Window and Buffer)
require('settings')

-- loads General key mappings
require('general_mappings')

-- Plugins configs
-- If key mapping is needed for plugins,they are inside each config file.
require('theme_conf') -- theme
require('lsp_conf') -- lsp
require('lsp_saga_conf') --  autocompletion
require('lualine_conf') -- status line
require('go_lsp_conf')
require('telescope_conf') -- telescope
require('nvim_tree_conf')
require('lazygit_conf')
require('dashboard_conf')
require('completion_conf')
require('terraform_conf')
require('autopair_conf')
require('lsp_colors_config')
require('docker_lsp_config')

-- validate if LSP is installed
local ok, _ = pcall(function() require('lsp_conf') end)

if not ok then
  print("No LSP")
end

-- Runs PackerCompiler whenever plugins.lua is updated
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

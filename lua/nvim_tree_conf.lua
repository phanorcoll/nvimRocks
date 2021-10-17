local map = vim.api.nvim_set_keymap
local g = vim.g

g.nvim_tree_ignore = {"node_modules",".cache"}
g.nvim_tree_special_files = {"README.md", "Makefile", "MAKEFILE"}
g.nvim_tree_icon_padding = '  '

options = {noremap = true}
map('n', '<S-e>', '<cmd>NvimTreeToggle<cr>', options)
map('n', '<leader>r', '<cmd>NvimTreeRefresh<cr>', options)

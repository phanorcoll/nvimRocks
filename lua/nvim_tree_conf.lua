local map = vim.api.nvim_set_keymap
local g = vim.g

g.nvim_tree_side = 'right'
g.nvim_tree_ignore = {".git","node_modules",".cache"}
g.nvim_tree_auto_open = 0
g.nvim_tree_special_files = {"README.md", "Makefile", "MAKEFILE"}

options = {noremap = true}
map('n', '<S-e>', '<cmd>NvimTreeToggle<cr>', options)
map('n', '<leader>r', '<cmd>NvimTreeRefresh<cr>', options)

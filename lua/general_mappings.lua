local utils = require('utils')
local map = vim.api.nvim_set_keymap

-- lead key
map('n', '<Space>', '', {})
vim.g.mapleader = ' ' -- sets global variable

options = {noremap = true}
map('n', '<leader><esc>', ':nohlsearch<cr>', options)
map('n', '<leader>t', ':vsplit | terminal<cr>', options)
map('t', '<esc>', '<C-\\><C-n>', options)

-- Move between buffers
map('n', '<leader>n', ':bnext<cr>', options)
map('n', '<leader>p', ':bprev<cr>', options)

-- Saving document in normal and insert mode
map('n', '<c-s>', '<cmd>w<cr>', {silent=true})
map('i', '<c-s>', '<esc><cmd>w<cr>', {silent=true})

-- Quit, close buffers, etc.
map('n', '<leader>q', '<cmd>qa<cr>', {silent=true})
map('n', '<leader>x', '<cmd>x!<cr>', {silent=true})

-- Window movement
map('n', '<c-h>', '<c-w>h', {})
map('n', '<c-j>', '<c-w>j', {})
map('n', '<c-k>', '<c-w>k', {})
map('n', '<c-l>', '<c-w>l', {})

-- Resize windows
map('n','<s-j>','<cmd>resize -2<cr>', options)
map('n','<s-k>','<cmd>resize +2<cr>', options)
map('n','<s-h>','<cmd>vertical resize -2<cr>', options)
map('n','<s-l>','<cmd>vertical resize +2<cr>', options)

-- Source $MYVIMRC
map('n','<leader>sv', '<cmd>source $MYVIMRC<cr>', options)

-- Breaking a bad habit
utils.map('n', '<Up>', [[:echoerr "Dont use arrow keys!!"<cr>]], {noremap = true})
utils.map('n', '<Down>', [[:echoerr "Dont use arrow keys!!"<cr>]], {noremap = true})
utils.map('n', '<Left>', [[:echoerr "Dont use arrow keys!!"<cr>]], {noremap = true})
utils.map('n', '<Right>', [[:echoerr "Dont use arrow keys!!"<cr>]], {noremap = true})

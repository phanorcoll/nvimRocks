local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- lead key
map('n', '<Space>', '', {})
vim.g.mapleader = ' ' -- sets global variable

-- Save file by CTRL-S
map("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
map("i", "<C-s>", "<ESC> :w<CR>", { noremap = true, silent = true })

-- Make work uppercase
map("n", "<C-u>", "viwU<ESC>", opts)
map("i", "<C-u>", "<ESC>viwUi", opts)

local function nkeymap(key, command)
  map('n', key, command, opts)
end

nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
nkeymap('gD', ":Lspsaga preview_definition<CR>")
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nkeymap('gr', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>")
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nkeymap('<leader>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>")
nkeymap('<leader>rn', "<cmd>lua require('lspsaga.rename').rename()<CR>")
vim.api.nvim_set_keymap("n", "K", ":Lspsaga hover_doc<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>k", ":Lspsaga signature_help<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[g", ":Lspsaga diagnostic_jump_prev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "]g", ":Lspsaga diagnostic_jump_next<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>cl", "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", { noremap = true, silent = true })

-- Resize windows
nkeymap('<s-j>','<cmd>resize -2<cr>')
nkeymap('<s-k>','<cmd>resize +2<cr>')
nkeymap('<s-h>','<cmd>vertical resize -2<cr>')
nkeymap('<s-l>','<cmd>vertical resize +2<cr>')

-- Buffers
nkeymap("<Tab>", ":BufferNext<CR>")
nkeymap("<S-Tab>", ":BufferPrevious<CR>")
nkeymap("<S-q>", ":BufferClose<CR>")

-- nvim-tree
nkeymap("<S-e>", "<cmd>NvimTreeToggle<CR>")
nkeymap('<leader>r', '<cmd>NvimTreeRefresh<cr>')
nkeymap('<leader>n', ':NvimTreeFindFile<CR>')

-- Better window movement
nkeymap("<C-h>", "<C-w>h")
nkeymap("<C-j>", "<C-w>j")
nkeymap("<C-k>", "<C-w>k")
nkeymap("<C-l>", "<C-w>l")


-- Telescope General
nkeymap('<leader>pf', '<cmd>lua require("telescope.builtin").find_files({prompt_title="Searching for a file?"})<cr>')
nkeymap('<leader>ps', '<cmd>lua require("telescope.builtin").live_grep({prompt_title="Search for a string"})<cr>')
nkeymap('<leader>pb', '<cmd>lua require("telescope.builtin").buffers({prompt_title="Search Open Files"})<cr>')
nkeymap('<leader>qf', '<cmd>lua require("telescope.builtin").quickfix({prompt_title="Fix the errors"})<cr>')
nkeymap('<leader>lf', '<cmd>lua require("telescope.builtin").loclist()<cr>')
nkeymap('<leader>of', '<cmd>lua require("telescope.builtin").oldfiles({prompt_title="Previous opened files"})<cr>')
nkeymap('<leader>/', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find({prompt_title="Search current buffer"})<cr>')
nkeymap("<Leader>pw", "<cmd>Telescope grep_string<CR><ESC>") -- finds word in project
nkeymap("<Leader>e", "<cmd>Telescope emoji<CR>") -- finds word in project
nkeymap("<Leader>h", '<cmd>TodoTelescope<CR>') -- finds word in project

-- Breaking a bad habit
nkeymap('<Up>', [[:echoerr "Dont use arrow keys!!"<cr>]])
nkeymap('<Down>', [[:echoerr "Dont use arrow keys!!"<cr>]])
nkeymap('<Left>', [[:echoerr "Dont use arrow keys!!"<cr>]])
nkeymap('<Right>', [[:echoerr "Dont use arrow keys!!"<cr>]])

local map = vim.api.nvim_set_keymap

-- terminal in split mode
map('n', '<leader>t', ':vsplit | terminal<cr>', {noremap = true})
map('t', '<esc>', '<C-\\><C-n>', {noremap = true})

-- Remove highlights
map("n", "<CR>", ":noh<CR><CR>", { noremap = true, silent = true })

-- Better window movement
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })

-- Resize windows
map('n','<s-j>','<cmd>resize -2<cr>', {noremap = true})
map('n','<s-k>','<cmd>resize +2<cr>', {noremap = true})
map('n','<s-h>','<cmd>vertical resize -2<cr>', {noremap = true})
map('n','<s-l>','<cmd>vertical resize +2<cr>', {noremap = true}) 

-- Save file by CTRL-S
map("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
map("i", "<C-s>", "<ESC> :w<CR>", { noremap = true, silent = true })

-- Make work uppercase
map("n", "<C-u>", "viwU<ESC>", { noremap = true })
map("i", "<C-u>", "<ESC>viwUi", { noremap = true })

-- Telescope General
map('n','<leader>pf', '<cmd>lua require("telescope.builtin").find_files({prompt_title="Searching for a file?"})<cr>', {noremap = true})
map('n','<leader>ps', '<cmd>lua require("telescope.builtin").live_grep()<cr>', {noremap = true})
map('n','<leader>pb', '<cmd>lua require("telescope.builtin").buffers({prompt_title="Open Files"})<cr>', {noremap = true})
map('n','<leader>qf', '<cmd>lua require("telescope.builtin").quickfix({prompt_title="Fix the errors"})<cr>', {noremap = true})
map('n','<leader>lf', '<cmd>lua require("telescope.builtin").loclist()<cr>', {noremap = true})
map('n','<leader>of', '<cmd>lua require("telescope.builtin").oldfiles({prompt_title="Previous opened files"})<cr>', {noremap = true})
map('n','<leader>/', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>', {noremap = true})
map("n", "<Leader>pw", "<cmd>Telescope grep_string<CR><ESC>", { noremap = true }) -- finds word in project
map("n", "<Leader>e", "<cmd>Telescope emoji<CR>", { noremap = true }) -- finds word in project
map("n", "<Leader>h", '<cmd>TodoTelescope<CR>', { noremap = true }) -- finds word in project


-- Telescope Git
map('n','<leader>g', '<cmd>lua require("telescope.builtin").git_bcommits({prompt_title="Commits on Open Files"})<cr>', {noremap = true})
map('n','<leader>gc', '<cmd>lua require("telescope.builtin").git_commits({prompt_title="Global Commits"})<cr>', {noremap = true})
map('n','<leader>gf', '<cmd>lua require("telescope.builtin").git_files({prompt_title="Search files in Repo"})<cr>', {noremap = true})
map('n','<leader>gb', '<cmd>lua require("telescope.builtin").git_branches({prompt_title="Branches in the Repo"})<cr>', {noremap = true})
map('n','<leader>gs', '<cmd>lua require("telescope.builtin").git_status({prompt_title="What\'s going on with the Repo"})<cr>', {noremap = true})
map('n','<leader>do', '<cmd>DiffviewOpen<cr>', {noremap = true})
map('n','<leader>dc', '<cmd>DiffviewClose<cr>', {noremap = true})
-- map("n", "<Leader>gla", "<CMD>lua require('plugins.telescope').my_git_commits()<CR>", { noremap = true, silent = true })
-- map("n", "<Leader>glc", "<CMD>lua require('plugins.telescope').my_git_bcommits()<CR>", { noremap = true, silent = true })

-- Buffers
map("n", "<Tab>", ":BufferNext<CR>", { noremap = true, silent = true })
map("n", "<S-Tab>", ":BufferPrevious<CR>", { noremap = true, silent = true })
map("n", "<S-q>", ":BufferClose<CR>", { noremap = true, silent = true })

-- Moving through buffers with barbar 
map("n", "<Space>1", ":BufferGoto 1<CR>", { silent = true })
map("n", "<Space>2", ":BufferGoto 2<CR>", { silent = true })
map("n", "<Space>3", ":BufferGoto 3<CR>", { silent = true })
map("n", "<Space>4", ":BufferGoto 4<CR>", { silent = true })
map("n", "<Space>5", ":BufferGoto 5<CR>", { silent = true })
map("n", "<Space>6", ":BufferGoto 6<CR>", { silent = true })
map("n", "<Space>7", ":BufferGoto 7<CR>", { silent = true })
map("n", "<Space>8", ":BufferGoto 8<CR>", { silent = true })
map("n", "<Space>9", ":BufferGoto 9<CR>", { silent = true })

-- Breaking a bad habit
map('n', '<Up>', [[:echoerr "Dont use arrow keys!!"<cr>]], {noremap = true})
map('n', '<Down>', [[:echoerr "Dont use arrow keys!!"<cr>]], {noremap = true})
map('n', '<Left>', [[:echoerr "Dont use arrow keys!!"<cr>]], {noremap = true})
map('n', '<Right>', [[:echoerr "Dont use arrow keys!!"<cr>]], {noremap = true})

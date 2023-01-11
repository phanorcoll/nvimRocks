local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- native file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, opt)

-- jk for ESC
vim.keymap.set("i","jk","<ESC>", opts)

-- Save file by CTRL-S
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)
vim.keymap.set("i", "<C-s>", "<ESC> :w<CR>", opts)

-- Move text up and down
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)

--format
vim.keymap.set("n","<leadeer>f", function() vim.lsp.bug.format() end)

-- makes a bash file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts)

-- Better window navigation
vim.keymap.set("n", "<S-h>", "<C-w>h", opts)
vim.keymap.set("n", "<S-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<S-l>", "<C-w>l", opts)

vim.keymap.set("n","<S-x>", ":bd<cr>", opts)

-- Resize with arrows
vim.keymap.set("n", "<S-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<S-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<S-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<S-Right>", ":vertical resize +2<CR>", opts)


-- Breaking a bad habit
vim.keymap.set("n", "<Up>", [[:echoerr "Dont use arrow keys!!"<cr>]], { noremap = true })
vim.keymap.set("n", "<Down>", [[:echoerr "Dont use arrow keys!!"<cr>]], { noremap = true })
vim.keymap.set("n", "<Left>", [[:echoerr "Dont use arrow keys!!"<cr>]], { noremap = true })
vim.keymap.set("n", "<Right>", [[:echoerr "Dont use arrow keys!!"<cr>]], { noremap = true })


local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal Mode --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Buffers
keymap("n", "<Tab>", ":BufferNext<CR>", opts)
keymap("n", "<S-Tab>", ":BufferPrevious<CR>", opts)
keymap("n", "<S-q>", ":BufferClose<CR>", opts)

-- Insert Mode --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual Mode --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block Mode --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Save file by CTRL-S
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("i", "<C-s>", "<ESC> :w<CR>", opts)

-- Telescope General
keymap(
	"n",
	"<leader>pf",
	'<cmd>lua require("telescope.builtin").find_files({prompt_title="Searching for a file?"})<cr>',
	opts
)
keymap("n", "<leader>ps", '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
keymap("n", "<leader>pb", '<cmd>lua require("telescope.builtin").buffers({prompt_title="Open Files"})<cr>', opts)
keymap("n", "<leader>qf", '<cmd>lua require("telescope.builtin").quickfix({prompt_title="Fix the errors"})<cr>', opts)
keymap("n", "<leader>lf", '<cmd>lua require("telescope.builtin").loclist()<cr>', opts)
keymap(
	"n",
	"<leader>of",
	'<cmd>lua require("telescope.builtin").oldfiles({prompt_title="Previous opened files"})<cr>',
	opts
)
keymap("n", "<leader>/", '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>', opts)
keymap("n", "<Leader>pw", "<cmd>Telescope grep_string<CR><ESC>", opts) -- finds word in project
keymap("n", "<Leader>h", "<cmd>TodoTelescope<CR>", opts) -- search for todo comments like TODO, HACK, BUG

-- Nvimtree
keymap("n", "<S-e>", ":NvimTreeToggle<cr>", opts)

-- Format
keymap("n", "<leader>f", ":Format<cr>", opts)

-- trouble
keymap("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)

-- Neogen - annotation for func, class, types
keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)

-- Trouble list issues in code
keymap("n", "<Leader>t", ":TroubleToggle<CR>", opts)

-- Breaking a bad habit
keymap("n", "<Up>", [[:echoerr "Dont use arrow keys!!"<cr>]], { noremap = true })
keymap("n", "<Down>", [[:echoerr "Dont use arrow keys!!"<cr>]], { noremap = true })
keymap("n", "<Left>", [[:echoerr "Dont use arrow keys!!"<cr>]], { noremap = true })
keymap("n", "<Right>", [[:echoerr "Dont use arrow keys!!"<cr>]], { noremap = true })

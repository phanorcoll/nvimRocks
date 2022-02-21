local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

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
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
nkeymap('<C-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')

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

-- Breaking a bad habit
nkeymap('<Up>', [[:echoerr "Dont use arrow keys!!"<cr>]])
nkeymap('<Down>', [[:echoerr "Dont use arrow keys!!"<cr>]])
nkeymap('<Left>', [[:echoerr "Dont use arrow keys!!"<cr>]])
nkeymap('<Right>', [[:echoerr "Dont use arrow keys!!"<cr>]])

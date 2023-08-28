local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end
return {
  -- Resize Windows
  map("n", "<C-Left>", "<C-w><"),
  map("n", "<C-Right>", "<C-w>>"),
  map("n", "<C-Up>", "<C-w>+"),
  map("n", "<C-Down>", "<C-w>-"),

  -- Save
  map("n", "<leader>w", "<CMD>update<CR>"),

  -- Quit
  map("n", "<leader>q", "<CMD>q<CR>"),
  map("n", "<leader>b", "<CMD>bd<CR>"),

  -- Windows
  map("n", "<leader>v", "<CMD>vsplit<CR>"),
  map("n", "<leader>h", "<CMD>split<CR>"),

  -- Exit insert mode
  map("i", "jk", "<ESC>")

}

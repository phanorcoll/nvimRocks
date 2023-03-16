vim.g.copilot_filetypes = {
  xml = false
}

-- vim.g.copilot_filetypes = {
--   ["*"] = false,
--   ["javascript"] = true,
--   ["typescript"] = true,
--   ["lua"] = false,
--   ["rust"] = true,
--   ["c"] = true,
--   ["c#"] = true,
--   ["c++"] = true,
--   ["go"] = true,
--   ["python"] = true,
-- }

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""


vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

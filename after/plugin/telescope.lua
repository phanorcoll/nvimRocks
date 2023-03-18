local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
  vim.notify("telescope.builtin not found!!", "error")
  return
end

require("telescope").load_extension "flutter"
require("telescope").load_extension "live_grep_args"

-- key mappings
vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- Search all files
vim.keymap.set('n', '<leader>pb', builtin.buffers, {}) -- Search open buffer
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {}) -- Search string in all files
vim.keymap.set('n', '<leader>pg', builtin.git_files, {}) -- Search only repo files
vim.keymap.set('n', '<leader>ph',
  '<cmd>lua require("telescope.builtin").oldfiles({prompt_title="Previous opened files"})<cr>', {}) -- Search only previous opened files
vim.keymap.set('n', '<leader>px', builtin.quickfix, {}) -- Search only repo files
vim.keymap.set('n', '<leader>pw', builtin.grep_string, {}) -- Search for the word where cursor is
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {}) -- Search for the word where cursor is
vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

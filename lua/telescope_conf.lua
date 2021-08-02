local map = vim.api.nvim_set_keymap

require'telescope'.setup{
    defaults={
        prompt_prefix="❓👉 ",
        selection_caret="👉 ",
        set_env = { ['COLORTERM'] = 'truecolor' },
        color_devicons = true,
        layout_strategy="horizontal",
        layout_config={
          prompt_position="bottom"
        }
    }
}
-- require'telescope.builtin'.symbols{ source = { 'emoji', 'kaomoji', 'gitmoji'}}
options = {noremap = true}

-- General operations
map('n','<leader>pf', '<cmd>lua require("telescope.builtin").find_files({prompt_title="What are you looking for?"})<cr>', options)
map('n','<leader>ps', '<cmd>lua require("telescope.builtin").live_grep()<cr>', options)
map('n','<leader>pb', '<cmd>lua require("telescope.builtin").buffers({prompt_title="Open Files"})<cr>', options)
map('n','<leader>qf', '<cmd>lua require("telescope.builtin").quickfix({prompt_title="Fix the errors"})<cr>', options)
map('n','<leader>lf', '<cmd>lua require("telescope.builtin").loclist()<cr>', options)
map('n','<leader>of', '<cmd>lua require("telescope.builtin").oldfiles({prompt_title="Previous opened files"})<cr>', options)
map('n','<leader>/', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>', options)

-- Git info
map('n','<leader>g', '<cmd>lua require("telescope.builtin").git_bcommits({prompt_title="Commits on Open Files"})<cr>', options)
map('n','<leader>gc', '<cmd>lua require("telescope.builtin").git_commits({prompt_title="Global Commits"})<cr>', options)
map('n','<leader>gf', '<cmd>lua require("telescope.builtin").git_files({prompt_title="Search files in Repo"})<cr>', options)
map('n','<leader>gb', '<cmd>lua require("telescope.builtin").git_branches({prompt_title="Branches in the Repo"})<cr>', options)
map('n','<leader>gs', '<cmd>lua require("telescope.builtin").git_status({prompt_title="What\'s going on with the Repo"})<cr>', options)

-- emoji list
map('n','<leader>e','<cmd>lua require"telescope.builtin".symbols{ sources = {"emoji", "kaomoji", "gitmoji"} }<cr>', options)


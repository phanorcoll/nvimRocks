vim.keymap.set('n', '<leader>hi', ':Telescope neovim-project history<CR>', { desc = 'Shows projects' })
vim.keymap.set('n', '<leader>di', ':Telescope neovim-project discover<CR>', { desc = 'Find project' })
return {
  "coffebar/neovim-project",
  opts = {
    projects = { -- define project roots
      "~/projects/*",
      "~/.config/*",
    },
  },
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim", tag = "0.1.0" },
    { "Shatur/neovim-session-manager" },
  },
  priority = 100,
}

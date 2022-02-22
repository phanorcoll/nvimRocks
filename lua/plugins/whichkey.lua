
local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
  s = {
    name = "Search",
    c = { '<cmd>Telescope colorscheme<CR>',                          'color schemes' },
    d = { '<cmd>lua require("plugins.telescope").edit_neovim()<CR>', 'dotfiles' },
    h = { '<cmd>Telescope oldfiles<CR>',                             'file history' },
    H = { '<cmd>Telescope command_history<CR>',                      'command history' },
    s = { '<cmd>Telescope search_history<CR>',                       'search history' },
  },

  f = {
    name = "File", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }, -- additional options for creating the keymap
    n = { "New File" }, -- just a label. don't create any mapping
    e = "Edit File", -- same as above
    b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
  },
}

local wk = require "which-key"
wk.register(mappings, opts)

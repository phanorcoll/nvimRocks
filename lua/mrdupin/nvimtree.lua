local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  vim.notify("nvim-tree not found!", "error")
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  vim.notify("nvim-tree.config not found!", "error")
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

-- empty setup using defaults
nvim_tree.setup({
  view = {
    side = "right",
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
  },
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  notify = {
    threshold = vim.log.levels.INFO,
  },
  actions = {
    open_file = {
      quit_on_open = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    }
  }
})

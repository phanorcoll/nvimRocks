local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  vim.notify("nvim-treesitter not found!!", "error")
  return
end
configs.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "lua", "rust", "bash", "css", "dart", "dockerfile", "gitignore", "go", "gomod", "gowork", "html",
    "javascript", "json", "make", "markdown", "solidity", "svelte", "tsx", "typescript", "yaml" },

  auto_install = false,
  indent = { enable = true, disable = { "yaml" } },

  rainbow = {
    enable = true,
    extended_mode = true,
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = true,
  },

  autopairs = {
    enable = true,
  },

  textobjects = {
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]]"] = "@function.outer",
        ["]m"] = "@class.outer",
      },
      goto_next_end = {
        ["]["] = "@function.outer",
        ["]M"] = "@class.outer",
      },
      goto_previous_start = {
        ["[["] = "@function.outer",
        ["[m"] = "@class.outer",
      },
      goto_previous_end = {
        ["[]"] = "@function.outer",
        ["[M"] = "@class.outer",
      },
    },
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
}

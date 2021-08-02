require'nvim-treesitter.configs'.setup {
  ensure_installed = {"bash", "javascript", "go", "docker"}
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true }
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    colors = {}, -- table of hex strings
    termcolors = {} -- table of colour name strings
  }
}

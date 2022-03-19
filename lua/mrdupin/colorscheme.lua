local status_ok, nightfox = pcall(require, "nightfox")
local theme_name = "nightfox"

if not status_ok then
  vim.notify("Theme " .. theme_name .. " not found!")
  return
end

nightfox.setup({
  options = {
    terminal_colors = true, -- Configure the colors used when opening :terminal
    transparent = true, -- Disable setting the background color
    styles = {
      comments = "italic", -- change style of comments to be italic
      keywords = "bold", -- change style of keywords to be bold
      functions = "italic,bold" -- styles can be a comma separated list
    },
  },
  dim_inactive = false,   -- Non focused panes set to alternative background
  pallets = {
    red = "#FF000", -- Override the red color for MAX POWER
    bg_alt = "#000000",
  },
  hlgroup = {
    TSPunctDelimiter = { fg = "${red}" }, -- Override a highlight group with the color red
    LspCodeLens = { bg = "#000000" },
  }
})

vim.cmd("colorscheme nightfox")

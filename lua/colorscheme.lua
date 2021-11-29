local nightfox = require('nightfox')

nightfox.setup({
	fox = "nordfox", -- change the colorscheme to use nordfox
  transparent = true, -- Disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening :terminal
  styles = {
    comments = "italic", -- change style of comments to be italic
    keywords = "bold", -- change style of keywords to be bold
    functions = "italic,bold" -- styles can be a comma separated list
  },
  colors = {
    red = "#FF000", -- Override the red color for MAX POWER
    bg_alt = "#000000",
  },
  hlgroup = {
    TSPunctDelimiter = { fg = "${red}" }, -- Override a highlight group with the color red
    LspCodeLens = { bg = "#000000" },
  }
})

nightfox.load()

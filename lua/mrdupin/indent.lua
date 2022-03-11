local blankline_status_ok, blankline = pcall(require, "indent_blankline")
if not blankline_status_ok then
	vim.notify("indent_blankline not found!!", "error")
	return
end

vim.opt.listchars = {
	space = "⋅",
	eol = "↴",
}

blankline.setup({
	char = "|",
	buftype_exclude = { "terminal", "telescope" },
	filetype_exclude = { "help", "dashboard", "packer", "NvimTree", "Trouble" },
	space_char_blankline = " ",
	show_current_context = true,
	show_end_of_line = true,
	use_treesitter = true,
})

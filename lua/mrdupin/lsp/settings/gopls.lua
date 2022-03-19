local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	vim.notify("lspconfig not found!!", "error")
	return
end
-- TODO: Make this file better, put everything related to Go here.
-- add keybindings for Go using gopsl
-- example <leader>cm for comments
lspconfig.gopls.setup({})
require("go").setup()
-- Run gofmt + goimport on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

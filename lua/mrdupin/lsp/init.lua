local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	vim.notify("lspconfig not found!!", "error")
	return
end

require("mrdupin.lsp.lsp-installer")
require("mrdupin.lsp.handlers").setup()
require("mrdupin.lsp.null-ls")
require("mrdupin.lsp.lspsaga")

-- TODO: move each lsp to its own lua file
lspconfig.gopls.setup({})
require("mrdupin.lsp.settings.gopls")
-- Docker
lspconfig.dockerls.setup({})

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
local inspect = require("vim.inspect")
if not status_ok then
	vim.notify("nvim-lsp-installer found!!", "error")
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("mrdupin.lsp.handlers").on_attach,
		capabilities = require("mrdupin.lsp.handlers").capabilities,
	}

	if server.name == "jsonls" then
		local jsonls_opts = require("mrdupin.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("mrdupin.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)

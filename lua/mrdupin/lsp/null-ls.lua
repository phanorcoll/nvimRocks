local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	vim.notify("null-ls not found!", "error")
	return
end

-- INFO: npm packages for tsserver and null-ls
-- npm install -g typescript typescript-language-server eslint prettier

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_action = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
    diagnostics.eslint,
    code_action.eslint,
		-- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.prettier,
		formatting.stylua,
	},
  -- on_attach = on_attach
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 2000)
            augroup END
            ]])
		end
	end,
})

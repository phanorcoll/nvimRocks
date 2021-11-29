-- local lsp_installer_servers = require'nvim-lsp-installer.servers'

-- local ok, terraformls = lsp_installer_servers.get_server("terraformls")
-- if ok then
--     if not terraformls:is_installed() then
--         terraformls:install()
--     end
-- end

local on_attach = function(client, bufnr)
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

require'lspconfig'.terraformls.setup({
  on_attach = on_attach
})

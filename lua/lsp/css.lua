local lsp_installer_servers = require'nvim-lsp-installer.servers'

local ok, cssls = lsp_installer_servers.get_server("cssls")
if ok then
    if not cssls:is_installed() then
        cssls:install()
    end
end

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

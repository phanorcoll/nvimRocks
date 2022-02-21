require('go').config.update_tool('quicktype', function(tool)
    tool.pkg_mgr = 'npm'
end)

-- setup nvim-go
require('go').setup{}

-- setup lsp client
-- HACK: make this better
require'lspconfig'.gopls.setup{}

local nvim_lsp = require('lspconfig')
-- setup nvim-go
require('go').setup{}

-- setup lsp client
nvim_lsp.gopls.setup{}

local lsp_installer_servers = require'nvim-lsp-installer.servers'

local ok, yamlls = lsp_installer_servers.get_server("yamlls")
if ok then
    if not yamlls:is_installed() then 
        yamlls:install()
    end 
end 

require('lspconfig').yamlls.setup{}

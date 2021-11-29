-- npm install -g dockerfile-language-server-nodejs
local lsp_installer_servers = require'nvim-lsp-installer.servers'

local ok, dockerls = lsp_installer_servers.get_server("dockerls")
if ok then
    if not dockerls:is_installed() then
        dockerls:install() 
    end 
end 

require'lspconfig'.terraformls.setup{}

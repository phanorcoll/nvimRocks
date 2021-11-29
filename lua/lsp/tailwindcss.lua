local lsp_installer_servers = require'nvim-lsp-installer.servers'

local ok, tailwindcssls = lsp_installer_servers.get_server("tailwindcss")
if ok then
    if not tailwindcssls:is_installed() then
        tailwindcssls:install()
    end
end

require'lspconfig'.tailwindcss.setup{}

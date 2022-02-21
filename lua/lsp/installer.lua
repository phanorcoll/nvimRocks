local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

lsp_installer.on_server_ready(function(server)
  local opts = {}

  -- options for LUA
  if server.name == "sumneko_lua" then
    opts = {
      settings = {
        Lua = {
          diagnostics = {
            globals = {'vim', 'use'}
          },
        }
      }
    }
  end

  server:setup(opts)
end)



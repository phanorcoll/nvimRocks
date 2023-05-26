-- nvim-cmp's documentation says we should set completeopt with the following values:
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

require('luasnip.loaders.from_vscode').lazy_load()

local status, cmp = pcall(require, "cmp")
if not status then
    return
end

local statusSnip, luasnip = pcall(require, 'luasnip')
if not statusSnip then
    return
end

local select_opts = {behavior = cmp.SelectBehavior.Select}
local lspkind = require("lspkind")
lspkind.init({
  symbol_map = {
    Copilot = "",
  },
})

cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    },
    sources = cmp.config.sources({
        { name = "copilot" }, -- Shows suggestions based on Copilot
        { name = "luasnip" }, -- Shows available snippets and expands them if they are chosen.
        { name = "nvim_lsp" }, -- Shows suggestions based on the response of a language server.
        { name = "path" }, -- Autocomplete file paths.
        { name = "buffer" }, -- Suggests words found in the current buffer.
    }),
    window = {
      completion = {
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        col_offset = -3,
        side_padding = 0,
      },
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 80 })(entry, vim_item)
        local strings = vim.split(kind.kind, "%s", { trimempty = true })
        kind.kind = " " .. (strings[1] or "x") .. " "
        kind.menu = "    (" .. (strings[2] or "xx") .. ")"

        return kind
      end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    }),
})

-- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
-- copilot
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {bg ="#6CC644", fg = "#000000"})
-- gray
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg='#808080' })
-- blue
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#569CD6' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })
-- light blue
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg='#9CDCFE' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { link='CmpItemKindVariable' })
-- pink
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg='#C586C0' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
-- front
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg='NONE', fg='#D4D4D4' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]])


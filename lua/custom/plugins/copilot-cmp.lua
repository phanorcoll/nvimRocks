return {
  "zbirenbaum/copilot-cmp",
  after = { "copilot.lua", "nvim-cmp" },
  config = function()
    require("copilot_cmp").setup({
      event = { "InsertEnter", "LspAttach" },
      fix_pairs = true,
    })
  end
}

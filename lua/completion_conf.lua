local map = vim.api.nvim_set_keymap
local g = vim.g
local o = vim.o
options = {noremap = true}

--nvim-compe config

o.completeopt = "menu,menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  allow_prefix_unmatch = false;
  documentation = {
      border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
      winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
      max_width = 120,
      min_width = 60,
      max_height = math.floor(vim.o.lines * 0.3),
      min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    vsnip = false;
    nvim_lsp = true;
    nvim_lua = false;
    spell = true;
    snippets_nvim = false;
    tags = true;
    ultisnips = true;
    luasnip = false;
  };
}



map('i',"<silent><expr> <CR>","compe#confirm(luaeval(\"require 'nvim-autopairs'.autopairs_cr()\"))",options)
map('n',"<expt><Tab>","pumvisible() ? <C-n> : <Tab>",options)
map('n',"<expt><S-Tab>","pumvisible() ? '<C-p>' : '<S-Tab>'",options)
-- map('i',"<silent><expr> <C-e>","compe#close('<C-e>')",options)
-- map('i',"<silent><expr> <C-f>","compe#scroll({ 'delta':+4 })",options)
-- map('i',"<silent><expr> <C-d>","compe#scroll({ 'delta':-4 })",options)

--


local o = vim.o -- For the globals options
local w = vim.wo -- For the window local options
local b = vim.bo -- For the buffer local options
local cmd = vim.cmd     -- execute Vim commands
local exec = vim.api.nvim_exec       -- execute Vimscript

vim.g.syntastic_always_populate_loc_list = 1
vim.g.syntastic_auto_loc_list = 1
vim.g.syntastic_check_on_open = 1
vim.g.syntastic_check_on_wq = 1
-- Global options
o.lazyredraw = true
o.splitbelow = true
o.splitright = true
o.encoding = [[utf-8]]
o.backspace = [[indent,eol,start]]
o.hidden = true
o.termguicolors = true
o.clipboard = [[unnamed,unnamedplus]]
o.scrolloff = 4
o.timeoutlen = 300
o.mouse = 'a'
o.swapfile = false
o.backup = false
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.updatetime = 250
o.shiftwidth = 2
o.shell = "/usr/bin/zsh"

-- Window local options
w.winfixwidth = true
w.cursorline = true
w.number = true
w.relativenumber = true
w.list = true
w.colorcolumn = [[80]]
w.wrap = false

-- Buffer local options
b.autoindent = true
b.expandtab = true
b.softtabstop = 2
b.shiftwidth = 2
b.tabstop = 2
b.smartindent = true
b.modeline = false
b.synmaxcol = 4000

-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-- remove whitespace on save
cmd([[au BufWritePre * :%s/\s\+$//e]])

-- don't auto commenting new lines
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])

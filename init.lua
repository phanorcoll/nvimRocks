require("mrdupin.options") -- Options for neovim
require("mrdupin.keymaps") -- All the keymaps
require("mrdupin.plugins") -- Packer config and list of plugins used
require("mrdupin.notify") -- Notificacion manager config
require("mrdupin.colorscheme") -- Theme configuration
require("mrdupin.cmp") -- LSP autocompletion
require("mrdupin.lsp") -- LSP autocompletion

-- WARNING: REMOVE this block
-- temporary configuration for terraform
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
vim.cmd([[let g:terraform_align=1]])

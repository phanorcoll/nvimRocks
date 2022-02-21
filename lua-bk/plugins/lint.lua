require('lint').linters_by_ft = {
  markdown = {'vale',}
}

vim.api.nvim_command [[au BufWritePost <buffer> lua require('lint').try_lint()]]


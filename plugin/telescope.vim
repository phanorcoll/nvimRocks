nnoremap <leader>ps <cmd>lua require('telescope.builtin').grep_string({search=vim.fn.input("Grep For >")})<CR>
nnoremap <leader>pf <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep({ prompt_prefix=🔍 })<cr>
nnoremap <leader>pb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>vh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>


highlight TelescopeSelection      guifg=#D79921 gui=bold " selected item

" Used for the prompt prefix
highlight TelescopePromptPrefix   guifg=red

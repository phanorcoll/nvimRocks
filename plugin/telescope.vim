lua << EOF
require('telescope').setup{
    defaults={
        layout_strategy = "horizontal",
        prompt_prefix="➜  ",
        selection_caret="➜ ",
        set_env = { ['COLORTERM'] = 'truecolor' },
        color_devicons = true,
        prompt_position = "bottom",
    }
}
EOF

" Key mappings
nnoremap <leader>ss <cmd>lua require('telescope.builtin').grep_string({search=vim.fn.input("Grep For >")})<CR>
nnoremap <leader>pf <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>ps <cmd>lua require('telescope.builtin').live_grep({ prompt_prefix=🔍 })<cr>
nnoremap <leader>pb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>vh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>vd <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>qf <cmd>lua require('telescope.builtin').quickfix()<cr>
nnoremap <leader>lf <cmd>lua require('telescope.builtin').loclist()<cr>
nnoremap <leader>pbc <cmd>lua require('telescope.builtin').git_bcommits()<cr>
nnoremap <leader>pgc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>pgf <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>pgb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>pgs <cmd>lua require('telescope.builtin').git_status()<cr>

" Color settings
highlight TelescopeSelection      guifg=#D79921 gui=bold " selected item

" Used for the prompt prefix
highlight TelescopePromptPrefix   guifg=#cccccc

" Sets the highlight for selected items within the picker.
highlight default link TelescopeSelection Visual

" "Normal" in the floating windows created by telescope.
highlight default link TelescopeNormal Normal

" Border highlight groups.
"   Use TelescopeBorder to override the default.
"   Otherwise set them specifically
highlight default link TelescopeBorder TelescopeNormal
highlight default link TelescopePromptBorder TelescopeBorder
highlight default link TelescopeResultsBorder TelescopeBorder
highlight default link TelescopePreviewBorder TelescopeBorder


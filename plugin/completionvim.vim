" completion-nvim - Enable TAB to trigger completion
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)
let g:completion_enable_snippet = 'UltiSnips'

" Enables completion on all buffers
autocmd BufEnter * lua require'completion'.on_attach()


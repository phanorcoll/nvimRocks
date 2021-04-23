" vim-test maps
map <silent> <leader>t :TestNearest<CR>
map <silent> <leader>f :TestFile<CR>
map <silent> <leader>T :TestSuite<CR>
map <silent> <leader>r :TestLast<CR>
map <silent> <leader>v :TestVisit<CR>

" neovim config
if has("nvim")
  " change cursor to bar in insert mode
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

  " disable mouse support, what am I a vimposer?
  set mouse-=a

  " run tests with :T
  let test#strategy = "neoterm"

  " vertical split instead of the default horizontal
  let g:neoterm_default_mod = "vertical"

  " pretty much essential: by default in terminal mode, you have to press ctrl-\-n to get into normal mode
  " ain't nobody got time for that
  tnoremap <Esc> <C-\><C-n>

  "makes it easier to switch between terminal splits
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l

  "mirror the alt split switching in non-terminal splits
  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l
endif

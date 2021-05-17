"General Remaps
let g:mapleader = " "
"inoremap <C-c> <esc>

" Use shift + hjkl to resize windows
nnoremap <S-j>    :resize -2<CR>
"nnoremap <S-k>    :resize +2<CR>
nnoremap <S-h>    :vertical resize -2<CR>
nnoremap <S-l>    :vertical resize +2<CR>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Commenting
"nnoremap <C-g> <Plug>(gcc)

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <silent><expr> <Tab>   pumvisible() ? "\<C-c>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Maximizer
nnoremap <C-o> :MaximizerToggle<CR>

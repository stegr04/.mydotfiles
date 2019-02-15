
" Open NERDTree by default
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Easily open|close NERDTree. The <Leader> here adheres to mapleader
" statements in .vimrc.
nnoremap <Leader>f :NERDTreeToggle<cr>

" Open NerdTree on the file you're editing. Helps when you need to quickly
" perform operations on the file with NERDTreeFind.
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" Automatically close NerdTree when you open a file.
let NERDTreeQuitOnOpen = 1

" Automatically close a tab if the only remaining window is NerdTree:
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Automatically delete the buffer of the file you just deleted with NERDTree
let NERDTreeAutoDeleteBuffer = 1

" Make it look nice and desable that Press ? for help msg
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


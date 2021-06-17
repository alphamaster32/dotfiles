" vi improved
set nocompatible
set termguicolors
set number
filetype plugin indent on
" plugins
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
" colorscheme
Plug 'morhetz/gruvbox'
" statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" styling
Plug 'Yggdroot/indentLine', {'for':'yaml'}
" code completion
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['javascript', 'vue']}
Plug 'fatih/vim-go', {'for': 'go'}
" nerdtree
Plug 'preservim/nerdtree'
call plug#end()
" set colorscheme
colorscheme gruvbox
" set airline theme
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
" set ctrlp igonred paths
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" coc modules
let g:coc_global_extensions = ['coc-vetur',]
" add coc settings and remaps
autocmd FileType javascript nmap <silent> gd <Plug>(coc-definition)
autocmd FileType javascript nmap <silent> gy <Plug>(coc-type-definition)
autocmd FileType javascript nmap <silent> gi <Plug>(coc-implementation)
autocmd FileType javascript nmap <silent> gr <Plug>(coc-references)
" add yaml identation
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" add yaml identation
let g:indentLine_char = '⦙'
" nerdtree mapping
nnoremap <C-g> :NERDTreeToggle<CR>
" vanilla configs
set ts=4 sw=4 expandtab
nnoremap <C-L> :nohl<CR><C-L>


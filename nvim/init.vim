" vi improved
set nocompatible
set termguicolors
set number
set ts=4 sw=4 expandtab
set incsearch
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set laststatus=2
set wildmenu
filetype plugin indent on
" plugins
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine', {'for':'yaml'}
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['javascript', 'vue']}
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'preservim/nerdtree'
call plug#end()
" set theme settings
colorscheme gruvbox
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif
" set ctrlp igonred paths
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" coc stuff
let g:coc_global_extensions = ['coc-vetur',]
autocmd FileType javascript nmap <silent> gd <Plug>(coc-definition)
autocmd FileType javascript nmap <silent> gy <Plug>(coc-type-definition)
autocmd FileType javascript nmap <silent> gi <Plug>(coc-implementation)
autocmd FileType javascript nmap <silent> gr <Plug>(coc-references)
" add yaml stuff
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '⦙'
" nerdtree mapping
nnoremap <C-g> :NERDTreeToggle<CR>
" remaps
nnoremap <C-L> :nohl<CR><C-L>


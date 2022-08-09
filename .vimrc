" vi improved
set nocompatible
"set syntax
syntax on
"other stuff
set termguicolors
set number
"expand tab converts tab to spaces
set ts=4 sw=4 expandtab
set incsearch
set hlsearch
set smartcase
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set laststatus=2
set wildmenu
set title
set encoding=utf-8
set colorcolumn=80
set ttyfast
"this will be set when we need a sign column for lsp and it replaces a number
"instead of adding a column
set signcolumn=number
"dont wrap long lines
set nowrap
"enable mouse
if has('mouse')
  if &term =~ 'xterm'
    set mouse=a
  else
    set mouse=nvi
  endif
endif

if !has('nvim')
    set ttimeout
    set ttimeoutlen=1
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
endif

filetype plugin indent on
"plugins
call plug#begin('~/.vim/plugged')
"infamous ctrlp plugin
Plug 'ctrlpvim/ctrlp.vim'
"prefered colorscheme
Plug 'chriskempson/base16-vim'
"light status bar
Plug 'itchyny/lightline.vim'
"to show indents in yaml files
Plug 'Yggdroot/indentLine', {'for':'yaml'}
"best go vim plugin
Plug 'fatih/vim-go', {'for': 'go'}
"syntax and tag support for rust
Plug 'rust-lang/rust.vim', {'for': 'rust'}
call plug#end()
"set theme settings and fail if it doesnt exsit
let base16colorspace=256
try | colorscheme base16-gruvbox-dark-hard | catch | endtry
"Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif
"set ctrlp igonred paths
let g:ctrlp_custom_ignore = 'node_modules\|target\|git'
"add yaml stuff
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '⦙'
"add vim-go stuff
let g:go_doc_keywordprg_enabled = 1
"tagbar mapping
nnoremap <C-g> :TagbarToggle<CR>
"remaps
nnoremap <C-L> :nohl<CR><C-L>
tnoremap <ESC> <C-\><C-n>

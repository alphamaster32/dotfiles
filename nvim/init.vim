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
set lazyredraw
set colorcolumn=80
set noshowmode
set ttyfast
set fillchars=vert:\ 
" respect the modeline
set modeline
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
Plug 'lervag/vimtex', {'for': 'tex'}
"editor config for javascript nonsense
"Plug 'editorconfig/editorconfig-vim'
call plug#end()
"set theme settings and fail if it doesnt exsit
try | colorscheme base16-gruvbox-dark-hard| catch | endtry
"Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif
"set ctrlp igonred paths
let g:ctrlp_custom_ignore = 'node_modules\|target\|git\|build'
"add yaml stuff
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '⦙'
"add vim-go stuff
let g:go_doc_keywordprg_enabled = 1
"remaps
nnoremap <C-L> :nohl<CR><C-L>
tnoremap <ESC> <C-\><C-n>
nnoremap <C-J> :RustFmt<CR>

" vi improved
set nocompatible
"set syntax
syntax on
"other stuff
set termguicolors
set number
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
set ttyfast
"this will be set when we need a sign column for lsp and it replaces a number
"instead of adding a column
set signcolumn=number
" dont wrap long lines
set nowrap
" show substitutions incrementally another cool neovim feature
if has("nvim")
  set inccommand=nosplit
endif
filetype plugin indent on
" plugins
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine', {'for':'yaml'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'preservim/nerdtree'
call plug#end()
" set theme settings and fail if it doesnt exsit
let base16colorspace=256
try | colorscheme base16-gruvbox-dark-hard | catch | endtry
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif
" set ctrlp igonred paths
let g:ctrlp_custom_ignore = 'node_modules\|target\|git'

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
" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'
" completion setting
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect
set updatetime=300
" LSP configuration
lua << END
local lspconfig = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- Forward to other plugins
  require'completion'.on_attach(client)
end

local servers = { "rust_analyzer" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
END

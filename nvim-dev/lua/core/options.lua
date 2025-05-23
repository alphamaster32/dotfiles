vim.wo.number = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.autoindent = true
vim.o.backspace = 'indent,eol,start'
vim.o.smarttab = true
vim.o.laststatus = 2
vim.o.wildmenu = true
vim.o.title = true
vim.o.encoding = 'utf-8'
vim.o.lazyredraw = true
vim.o.colorcolumn = '80'
vim.o.showmode = false
vim.o.ttyfast = true
vim.o.modeline = true
vim.o.signcolumn = 'number'
vim.o.wrap = false
vim.o.mouse = 'a'
vim.opt.timeoutlen = 300

vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.fillchars = {
  fold = ' ', -- remove folding chars
  vert = ' ', -- set vsplit chars
}

-- half space for persian
vim.api.nvim_set_hl(0, "Conceal", { link = "Normal" })
vim.fn.matchadd("Conceal", "\\%u200c", 10, -1, { conceal = "|" })
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nv"

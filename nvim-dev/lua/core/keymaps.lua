vim.keymap.set('n', '<C-L>', '<cmd> nohl <CR><C-L>')
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function(_)
        vim.keymap.set('n', '<C-J>', '<cmd> RustFmt <CR>')
  end,
})

vim.keymap.set('n', '<C-k>', function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)

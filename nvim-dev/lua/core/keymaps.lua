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

vim.api.nvim_set_keymap("i", "<leader>f", "<C-o>:set keymap=persian<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<leader>e", "<C-o>:set keymap=<CR>",
    { noremap = true, silent = true })

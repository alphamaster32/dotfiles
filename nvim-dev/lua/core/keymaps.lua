vim.keymap.set('n', '<C-L>', '<cmd> nohl <CR><C-L>')
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function(_)
        vim.keymap.set('n', '<C-J>', '<cmd> RustFmt <CR>')
  end,
})

local diagnostics_active = true
vim.keymap.set('n', '<C-k>', function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end)

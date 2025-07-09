--vim.g.mapleader = '\'
--vim.g.maplocalleader = '\'

vim.keymap.set('n', '<C-L>', '<cmd> nohl <CR><C-L>')
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')

vim.keymap.set('n', '<C-j>', function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)

--vim.keymap.set("i", "<leader><leader>f", "<C-o>:set keymap=persian<CR>",
    --{ noremap = true, silent = true })
--vim.keymap.set("i", "<leader><leader>e", "<C-o>:set keymap=<CR>",
    --{ noremap = true, silent = true })

vim.api.nvim_create_user_command("Persian", function()
  if vim.o.keymap == "persian" then
    vim.cmd("set keymap=")
    print("Keymap reset to default")
  else
    vim.cmd("set keymap=persian")
    print("Keymap set to Persian")
  end
end, {})


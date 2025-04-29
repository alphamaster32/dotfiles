vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

vim.keymap.set('n', '<C-L>', '<cmd> nohl <CR><C-L>')
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')

vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function(args)
        vim.keymap.set('n', '<C-J>', '<cmd>RustFmt<CR>', { buffer = args.buf })
    end,
})

vim.keymap.set('n', '<C-k>', function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)

vim.keymap.set("i", "<leader><leader>f", "<C-o>:set keymap=persian<CR>",
    { noremap = true, silent = true })
vim.keymap.set("i", "<leader><leader>e", "<C-o>:set keymap=<CR>",
    { noremap = true, silent = true })

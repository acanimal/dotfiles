--Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<space>', '<nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
vim.diagnostic.config({
  update_in_insert = true
})

vim.keymap.set('n', '//', '<cmd>nohl<cr>') -- Remove the search highlight


--Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<space>', '<nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "Diagnostic open float" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Diagnostic previous" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Diagnostic next" })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = "Diagnostic show local list" })
vim.diagnostic.config({
  update_in_insert = true
})

vim.keymap.set('n', '//', '<cmd>nohl<cr>', { desc = 'Remove highlight search mark' }) -- Remove the search highlight
-- Buffers movement
vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', { desc = "Buffer previous" })
vim.keymap.set('n', ']b', '<cmd>bnext<cr>', { desc = "Buffer next" })


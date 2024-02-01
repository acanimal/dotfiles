return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Find using grep" })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffers" })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find in help pages" })
    vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = "Find LSP references" })
    vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = "Find command" })
    vim.keymap.set('n', '<leader>fs', builtin.colorscheme, { desc = "List available colorscheme" })
    vim.keymap.set('n', '<leader>fd', builtin.git_status, { desc = "List git differences" })
  end
}

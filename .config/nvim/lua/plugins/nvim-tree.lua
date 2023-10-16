return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {},
  config = function()
    require("nvim-tree").setup()
    vim.keymap.set('n', '<leader>tt', '<cmd>NvimTreeToggle<cr>')
    vim.keymap.set('n', '<leader>tf', '<cmd>NvimTreeFindFile<cr>')
  end,
}

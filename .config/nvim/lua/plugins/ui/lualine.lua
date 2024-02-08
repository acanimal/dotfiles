return {
  "nvim-lualine/lualine.nvim", -- statusline
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  opts = {
    winbar = {
      lualine_a = { 'buffers' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'buffers' },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    }
  }
}

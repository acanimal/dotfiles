return {
  "nvim-lualine/lualine.nvim", -- statusline
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  opts = {
    options = {
      globalstatus = true,
      disabled_filetypes = {
        statusline = {},
        winbar = { 'NvimTree', 'dap-repl' }
      }
    },
    winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    }
  }
}

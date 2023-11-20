return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  opts = {
    options = {
      always_show_bufferline = false,
      offsets = {
        {
          filetype = "nvim-tree",
          text = "nvim-tree",
          highlight = "Directory",
          text_align = "left",
        }
      }
    }
  }
}

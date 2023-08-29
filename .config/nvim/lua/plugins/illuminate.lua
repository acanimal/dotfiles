return {
  "RRethy/vim-illuminate",
  config = function()
    require("illuminate").configure({
      -- avoid illuminate on nerdtree
      filetypes_denylist = {
        'nerdtree',
      }
    })
      vim.cmd("hi IlluminatedWordRead guibg=#6A6A6A")
  end
}

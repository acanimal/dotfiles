return {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  config = function()
    require('dashboard').setup {
      shortcut_type = 'number'
    }
  end,
}

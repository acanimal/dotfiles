return {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  config = function()
    local logo = [[
 _____                    __                      _   _     _            '
/__   \_   _ _ __   ___  / _\ ___  _ __ ___   ___| |_| |__ (_)_ __   __ _
  / /\/ | | | '_ \ / _ \ \ \ / _ \| '_ ` _ \ / _ \ __| '_ \| | '_ \ / _` |
 / /  | |_| | |_) |  __/ _\ \ (_) | | | | | |  __/ |_| | | | | | | | (_| |
 \/    \__, | .__/ \___| \__/\___/|_| |_| |_|\___|\__|_| |_|_|_| |_|\__, |
       |___/|_|                                                     |___/
      ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"

    require('dashboard').setup {
      theme = 'hyper',
      shortcut_type = 'number',
      config = {
        header = vim.split(logo, "\n")
      }
    }
  end,
}

return {
  "rest-nvim/rest.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  commit = "8b62563",
  config = function()
    require('rest-nvim').setup({
      -- Open request results in a horizontal split
      result_split_horizontal = false,
      -- Keep the http file buffer above|left when split horizontal|vertical
      result_split_in_place = false,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      -- Encode URL before making request
      encode_url = true,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        show_http_info = true,
        show_headers = true,
        -- executables or functions for formatting response body [optional]
        -- set them to false if you want to disable them
        formatters = {
          json = "jq",
          html = function(body)
            return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
          end
        },
      },
      -- Jump to request line on run
      jump_to_request = true,
      env_file = '.env',
      custom_dynamic_variables = {},
      yank_dry_run = true,
    })

    vim.keymap.set('n', '<leader>rr', '<Plug>RestNvim', { desc = 'Rest execute request' })
    vim.keymap.set('n', '<leader>rp', '<Plug>RestNvimPreview', { desc = 'Rest  preview curl' })
    vim.keymap.set('n', '<leader>rl', '<Plug>RestNvimLast', { desc = 'Rest repeat last request' })
  end
}

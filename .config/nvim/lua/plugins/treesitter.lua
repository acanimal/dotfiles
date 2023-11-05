return {
	'nvim-treesitter/nvim-treesitter',
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { "http", "json", "javascript", "lua", "tsx", "typescript" },
      highlight = {
        enable = true
      }
    })
  end
}


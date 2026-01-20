return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          cmd = { "lua-language-server", "--encoding=utf-8" },
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      },
    },
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    dependencies = {
      {
        "DrKJeff16/wezterm-types",
        lazy = true,
        version = false, -- Get the latest version
      },
    },
    opts = {
      library = {
        { path = "wezterm-types", words = { "wezterm" } },
      },
    },
  },
}

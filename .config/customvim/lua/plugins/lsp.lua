return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = { "ts_ls" }, -- installs typescript-language-server automatically
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-lspconfig.nvim", "ibhagwan/fzf-lua" },
    config = function()
      vim.lsp.config("ts_ls", {})
      vim.lsp.enable("ts_ls")

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("my_custom_autocmd_lsp_attach", { clear = true }),
        callback = function(args)
          local opts = { buffer = args.buf }
          local fzf = require("fzf-lua")

          vim.keymap.set("n", "gd", fzf.lsp_definitions, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gr", fzf.lsp_references, opts)
          vim.keymap.set("n", "gI", fzf.lsp_implementations, opts)
          vim.keymap.set("n", "gy", fzf.lsp_typedefs, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", fzf.lsp_code_actions, opts)
          vim.keymap.set("n", "<leader>ss", fzf.lsp_document_symbols, opts)
          vim.keymap.set("n", "<leader>sS", fzf.lsp_workspace_symbols, opts)
        end,
      })
    end,
  },
}

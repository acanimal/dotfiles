return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local ensure_installed = {
      "typescript", "tsx", "javascript",
      "lua", "vim", "vimdoc",
      "markdown", "markdown_inline",
      "json", "html", "css", "bash",
    }
    require("nvim-treesitter").install(ensure_installed)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = ensure_installed,
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}

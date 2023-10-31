return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  config = function ()
    -- restore the session for the current directory
    vim.api.nvim_set_keymap("n", "<leader>ss", [[<cmd>lua require("persistence").load()<cr>]], { desc = "restore the session for the current directory" })

    -- restore the last session
    vim.api.nvim_set_keymap("n", "<leader>sl", [[<cmd>lua require("persistence").load({ last = true })<cr>]], { desc = "restore the last session" })

    -- stop Persistence => session won't be saved on exit
    vim.api.nvim_set_keymap("n", "<leader>sd", [[<cmd>lua require("persistence").stop()<cr>]], { desc = "stop Persistence => session won't be saved on exit" })
  end
}


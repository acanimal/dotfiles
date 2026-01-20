return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- Se carga de forma perezosa para no ralentizar el inicio
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300 -- El tiempo de espera antes de que aparezca el menú
  end,
  opts = {
    -- Aquí puedes añadir configuraciones personalizadas más adelante
  },
}

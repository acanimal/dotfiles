return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Mantén tu configuración actual de 'sections' si la tienes
    -- Y añadimos la winbar para que aparezca en CADA ventana
    opts.winbar = {
      lualine_c = {
        {
          "filename",
          path = 1, -- 0: solo nombre, 1: ruta relativa
          file_status = true,
          symbols = { modified = " ●", readonly = " 󰌾", unnamed = "[No Name]" },
        },
      },
    }

    -- Esto replica la barra en las ventanas que no tienes enfocadas
    opts.inactive_winbar = {
      lualine_c = {
        { "filename", path = 1 },
      },
    }

    return opts
  end,
}

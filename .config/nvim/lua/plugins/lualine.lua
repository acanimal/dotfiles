return {
  "nvim-lualine/lualine.nvim", -- statusline
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
 	config = function()
		require("lualine").setup{
			options = {
				theme = "tokyonight"
        -- thene = "kanagawa"
			}
		}
	end,
}


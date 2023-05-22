return {
    "williamboman/mason.nvim",
		config = function()
			require('mason').setup()
		end,
    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
}


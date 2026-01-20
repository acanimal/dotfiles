return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		-- Global Search & Files
		{ "<leader>,", "<cmd>FzfLua buffers<cr>", desc = "Switch Buffer" },
		{ "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Grep (Root Dir)" },
		{ "<leader>:", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
		{ "<leader><space>", "<cmd>FzfLua files<cr>", desc = "Find Files (Root Dir)" },

		-- Files (f group)
		{ "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
		{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
		{ "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent" },

		-- Git (g group)
		{ "<leader>gc", "<cmd>FzfLua git_commits<cr>", desc = "Commits" },
		{ "<leader>gs", "<cmd>FzfLua git_status<cr>", desc = "Status" },

		-- Search (s group)
		{ "<leader>sb", "<cmd>FzfLua grep_curbuf<cr>", desc = "Buffer Search" },
		{ "<leader>sc", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
		{ "<leader>sd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Document Diagnostics" },
		{ "<leader>sD", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace Diagnostics" },
		{ "<leader>sg", "<cmd>FzfLua live_grep<cr>", desc = "Grep (Root Dir)" },
		{ "<leader>sh", "<cmd>FzfLua help_tags<cr>", desc = "Help Pages" },
		{ "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Key Maps" },
		{ "<leader>sR", "<cmd>FzfLua resume<cr>", desc = "Resume last search" },
		{ "<leader>sw", "<cmd>FzfLua grep_cword<cr>", desc = "Search Word under cursor" },
	},
	opts = {
		-- Clean floating window UI (LazyVim style)
		winopts = {
			height = 0.85,
			width = 0.80,
			preview = {
				horizontal = "right:50%",
			},
		},
		keymap = {
			-- Open search in quickfix window
			fzf = {
				["ctrl-q"] = "select-all+accept",
			},
		},
	},
}

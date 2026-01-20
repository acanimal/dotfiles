local map = vim.keymap
local opts = { noremap = true, silent = true }

-- Resize windows using Option (Alt) + hjkl
map.set("n", "<C-A-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map.set("n", "<C-A-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map.set("n", "<C-A-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map.set("n", "<C-A-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })

-- Move Lines
map.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Line Down" })
map.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Selection Down" })
map.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Line Up" })
map.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Selection Up" })

-- Buffers (just re-define again for better which-key description
map.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Clear search highlights with <Esc>
map.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear search highlights" })

-- Exit terminal mode easily with Esc
map.set("t", "<Esc>", [[<C-\><C-n>]], opts)
map.set({ "n", "t" }, "<C-/>", "<cmd>lua ToggleTerminal()<CR>", { desc = "Toggle Terminal" })

-- Open Explorer as a fixed lateral bar in the folder we started neovim
map.set("n", "<leader>fe", "<cmd>Lexplore<CR>", { desc = "Project View (Current File)" })

--
-- Helper functions
--

-- Toggle terminal
local term_buf = nil
local term_win = nil

function ToggleTerminal()
	if term_win and vim.api.nvim_win_is_valid(term_win) then
		vim.api.nvim_win_close(term_win, true)
		term_win = nil
	else
		vim.cmd("botright split")
		vim.cmd("resize 15")
		if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
			vim.api.nvim_win_set_buf(0, term_buf)
		else
			vim.cmd("terminal")
			term_buf = vim.api.nvim_get_current_buf()
		end
		term_win = vim.api.nvim_get_current_win()
		vim.cmd("startinsert")
	end
end

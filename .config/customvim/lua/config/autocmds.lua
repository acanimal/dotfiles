local function augroup(name)
	return vim.api.nvim_create_augroup("my_custom_autocmd_" .. name, { clear = true })
end

-- Briefly highlight the text when copying (yanking)
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Go to last location when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Close specific windows with <q>. Makes it easier to close help, man pages, and quickfix windows
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"query",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- Resize splits if window got resized (e.g. terminal window resize)
vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = augroup("resize_splits"),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- Automatically removes extra spaces at the end of lines on save
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup("trim_whitespace"),
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- Show a message when Neovim is fully loaded
vim.api.nvim_create_autocmd("User", {
	group = augroup("very_lazy_notification"),
	pattern = "VeryLazy",
	callback = function()
		vim.api.nvim_echo({ { "Neovim is ready 🚀", "SuccessMsg" } }, true, {})
	end,
})

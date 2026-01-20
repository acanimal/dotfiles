-----------------------------------------------------------
-- Netrw Configuration (Native File Explorer)
-----------------------------------------------------------
vim.g.netrw_banner = 0 -- Hide the help banner at the top
vim.g.netrw_liststyle = 3 -- Tree view (Neo-tree style)
vim.g.netrw_browse_split = 0 -- Open in same window
vim.g.netrw_altv = 1 -- Open vertical splits to the right
vim.g.netrw_winsize = 25 -- Sidebar width (25% of the screen)
vim.g.netrw_keepdir = 0 -- Keep the current directory synced with the file

--
-- netrw configuration
--
vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		vim.keymap.set("n", "l", "<CR>", { remap = true, buffer = true })
		vim.keymap.set("n", "h", "<CR>", { remap = true, buffer = true })
		vim.keymap.set("n", "v", "<cmd>vsplit<CR><CR>", { remap = true, buffer = true })
	end,
})

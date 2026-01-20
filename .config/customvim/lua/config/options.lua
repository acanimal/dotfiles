-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

-------------------------------------------------------------------------------
-- Editing and Formatting
-------------------------------------------------------------------------------
opt.autowrite = true -- Enable auto write when changing buffers
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2 -- Size of an indent
opt.tabstop = 2 -- Number of spaces tabs count for
opt.smartindent = true -- Insert indents automatically
opt.shiftround = true -- Round indent to multiple of shiftwidth
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.formatoptions = "jcroqlnt" -- Editing behavior: handle comments, wrapping, etc.
opt.conceallevel = 0 -- Show formatting characters (like markdown)

-------------------------------------------------------------------------------
-- User Interface
-------------------------------------------------------------------------------
opt.cursorline = true -- Enable highlighting of the current line
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.termguicolors = true -- True color support (24-bit)
opt.signcolumn = "yes" -- Always show the signcolumn (prevents layout shift)
-- opt.laststatus = 3              -- Global statusline (one bar at the bottom)
-- opt.showmode = true 		-- Don't show mode (INSERT, etc) as it's in statusline
-- opt.list = false                 -- Show some invisible characters
opt.wrap = true -- Enable line wrap
opt.linebreak = true -- Wrap lines at convenient points (if wrap is enabled)
opt.pumblend = 10 -- Popup menu transparency
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.completeopt = "menu,menuone,noselect"

-------------------------------------------------------------------------------
-- Windows and Navigation
-------------------------------------------------------------------------------
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.scrolloff = 4 -- Lines of context above/below cursor
opt.sidescrolloff = 8 -- Columns of context to the sides
opt.splitkeep = "screen" -- Keep text on the same screen line when splitting
opt.winminwidth = 5 -- Minimum window width

-------------------------------------------------------------------------------
-- Search and Clipboard
-------------------------------------------------------------------------------
opt.ignorecase = true -- Ignore case in search patterns
opt.smartcase = true -- Don't ignore case with capitals
opt.inccommand = "nosplit" -- Preview incremental substitute in real-time
opt.clipboard = "unnamedplus"

-------------------------------------------------------------------------------
-- Code Folding
-------------------------------------------------------------------------------
opt.foldmethod = "indent" -- Fold based on indentation levels
opt.foldlevel = 99 -- Start with all folds open
opt.foldtext = "" -- Use default Neovim fold text
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

-------------------------------------------------------------------------------
-- System and Persistence
-------------------------------------------------------------------------------
opt.undofile = true -- Save undo history to a file
opt.undolevels = 10000 -- Maximum number of changes that can be undone
opt.updatetime = 200 -- Save swap file and trigger CursorHold (ms)
opt.timeoutlen = 300 -- Time to wait for a mapped sequence (ms)
opt.confirm = true -- Confirm to save changes before exiting
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.spelllang = { "en" } -- Set spell check language

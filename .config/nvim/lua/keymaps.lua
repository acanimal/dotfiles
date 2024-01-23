local map = vim.keymap

--Remap space as leader key
map.set({ 'n', 'v' }, '<space>', '<nop>', { silent = true })

-- better up/down
map.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
map.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- windows
map.set("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map.set("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
map.set("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
map.set("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- tabs
map.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Clear search with <esc>
map.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
map.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
map.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- https://github.com/mhinz/vim-galore?tab=readme-ov-file#saner-command-line-history
map.set("c", "<down>", function()
  if vim.fn.wildmenumode() == 1 then return "<c-n>" end
  return "<down>"
end, { expr = true })
map.set("c", "<up>", function()
  if vim.fn.wildmenumode() == 1 then return "<c-p>" end
  return "<up>"
end, { expr = true })

-- Add undo break-points
map.set("i", ",", ",<c-g>u")
map.set("i", ".", ".<c-g>u")
map.set("i", ";", ";<c-g>u")

-- Location and quickfix lists
map.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
map.set("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
map.set("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })

-- Diagnostics
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- highlights under cursor
map.set("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

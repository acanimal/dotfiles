local function augroup(name)
  return vim.api.nvim_create_augroup("acanimal_" .. name, { clear = true })
end

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Highlight text on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup('YankHighlight'),
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = '700' }
  end,
  desc = 'Highlight yanked text',
})

require('options')
require('keymaps')

--
-- install lazy.vim if not installed
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--
-- Install plugins
--
require('lazy').setup({
  { import = 'plugins' },
  { import = 'plugins.coding' },
  { import = 'plugins.editor' },
  { import = 'plugins.treesitter' },
  { import = 'plugins.ui' }
})

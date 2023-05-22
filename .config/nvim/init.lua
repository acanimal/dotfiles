-- Force show always welcome message 
vim.cmd('intro')

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
-- install plugins
--
require('lazy').setup('plugins')

--require("lazy").setup({
--	-- the colorscheme should be available when starting Neovim
--  {
--    "folke/tokyonight.nvim",
--    lazy = false, -- make sure we load this during startup if it is your main colorscheme
--    priority = 1000, -- make sure to load this before all the other start plugins
--    config = function()
--      -- load the colorscheme here
	--      vim.cmd([[colorscheme tokyonight]])
--    end,
--  },
--  "folke/which-key.nvim",
--	{
--		"nvim-lualine/lualine.nvim", -- statusline
--		config = function()
--			require("lualine").setup{
--				options = {
--					theme = "tokyonight"
--				}
--			}
--		end,
--	},
--  "nvim-tree/nvim-web-devicons" -- If you want to have icons in your statusline choose one of these	
--})


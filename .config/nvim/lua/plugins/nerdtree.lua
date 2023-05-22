return {
  'preservim/nerdtree',
	dependencies = {
    'ryanoasis/vim-devicons',
  },
	config = function()
    vim.keymap.set('n', '<leader>tt', '<cmd>NERDTreeToggle<cr>')
  end
}


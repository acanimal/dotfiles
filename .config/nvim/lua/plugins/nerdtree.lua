return {
  'preservim/nerdtree',
	dependencies = {
    'ryanoasis/vim-devicons',
  },
	config = function()
    vim.keymap.set('n', '<leader>tt', '<cmd>NERDTreeToggle<cr>')
    vim.keymap.set('n', '<leader>tf', '<cmd>NERDTreeFind<cr>')
  end
}


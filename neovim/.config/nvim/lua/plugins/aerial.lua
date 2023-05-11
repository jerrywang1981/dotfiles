local vim = vim
return {
	"stevearc/aerial.nvim",
	cmd = "AerialToggle",
	init = function()
    vim.keymap.set('n', '<space>0', '<cmd>AerialToggle!<CR>', { desc = "Toggle Aerial"})
	end,
  config = function()
    require('aerial').setup({})
  end
}


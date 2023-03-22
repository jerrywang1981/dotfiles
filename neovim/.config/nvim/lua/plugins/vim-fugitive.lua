local vim = vim

return {
	"tpope/vim-fugitive",
	config = function()
		vim.api.nvim_command([[ autocmd BufReadPost fugitive://* set bufhidden=delete ]])
	end,
}

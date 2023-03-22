local vim = vim
return {
	"mbbill/undotree",
	cmd = { "UndotreeToggle" },
	init = function()
		vim.api.nvim_set_keymap("n", "<space>7", "<cmd>UndotreeToggle<CR>", { silent = true })
	end,
	config = function()
		vim.g.undotree_DiffAutoOpen = 1
		vim.g.undotree_SetFocusWhenToggle = 1
		vim.g.undotree_ShortIndicators = 1
		vim.g.undotree_WindowLayout = 2
		vim.g.undotree_DiffpanelHeight = 8
		vim.g.undotree_SplitWidth = 24
	end,
}

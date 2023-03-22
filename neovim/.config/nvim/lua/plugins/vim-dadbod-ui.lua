local vim = vim
return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = "tpope/vim-dadbod",
  cmd='DBUI',
	config = function()
    vim.g.db_ui_execute_on_save = 0
	end,
}


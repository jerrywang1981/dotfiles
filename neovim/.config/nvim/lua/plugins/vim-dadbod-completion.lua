local vim = vim
return {
	"kristijanhusak/vim-dadbod-completion",
  cmd='DBUI',
	dependencies = {"kristijanhusak/vim-dadbod-ui", "hrsh7th/nvim-cmp"},
	config = function()
    vim.cmd [[ autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })]]
	end,
}



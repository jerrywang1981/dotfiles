local vim = vim

return {
	"airblade/vim-rooter",
	config = function()
		vim.g.rooter_silent_chdir = 1
	end,
}

local vim = vim
return {
	"kassio/neoterm",
	opt = true,
	cmd = { "Ttoggle" },
	init = function()
		vim.api.nvim_set_keymap(
			"n",
			"<space>4",
			":<c-u>vertical botright Ttoggle<cr><C-w>l",
			{ noremap = true, silent = true }
		)
	end,
	config = function()
		vim.g.neoterm_autoscroll = 1
		vim.api.nvim_set_keymap("t", "<esc>", "<c-\\><c-n>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("t", "<c-v><esc>", "<esc>", { noremap = true, silent = true })
	end,
}
local vim = vim

return {
	"voldikss/vim-floaterm",
	keys = "<leader>ft",
	-- cmd = {"FloatermToggle"},
	init = function()
		vim.g.floaterm_keymap_new = "<leader>fc"
		vim.g.floaterm_keymap_prev = "<leader>fp"
		vim.g.floaterm_keymap_next = "<leader>fn"
		vim.g.floaterm_keymap_toggle = "<leader>ft"
	end,
}

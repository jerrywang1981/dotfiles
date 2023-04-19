local vim = vim

return {
	"voldikss/vim-floaterm",
	keys = "<space>4",
	-- cmd = {"FloatermToggle"},
	init = function()
		vim.g.floaterm_keymap_new = "<leader>fc"
		vim.g.floaterm_keymap_prev = "<leader>fp"
		vim.g.floaterm_keymap_next = "<leader>fn"
		vim.g.floaterm_keymap_toggle = "<space>4"
		vim.g.floaterm_wintype = "vsplit"
	end,
	config = function()
		vim.keymap.set({"n", "v"}, "<leader>sl", ":FloatermSend<cr>", { silent = true, noremap = true })
	end,
}

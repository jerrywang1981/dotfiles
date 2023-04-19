local vim = vim

vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"<localleader>=",
	"<cmd>lua vim.lsp.buf.format()<CR>",
	{ noremap = true, silent = true }
)

local vim = vim

local bufnr = vim.api.nvim_get_current_buf()
vim.api.nvim_buf_set_keymap(
	bufnr,
	"n",
	"<localleader>=",
	"<cmd>lua vim.lsp.buf.format()<CR>",
	{ noremap = true, silent = true }
)

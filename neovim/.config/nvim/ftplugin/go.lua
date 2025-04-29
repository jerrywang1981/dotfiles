local vim = vim

local ok = pcall(require, "dap-go")

if ok then
vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"<localleader>td",
	"<cmd>lua require('dap-go').debug_test()<CR>",
	{ noremap = true, silent = true, desc="debug test case" }
)
end


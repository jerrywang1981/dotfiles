local vim = vim
local enabled = vim.version().minor < 9 and true or false

return {
	"editorconfig/editorconfig-vim",
	enabled = enabled,
	config = function()
		vim.g.EditorConfig_exclude_patterns = { "fugitive://.*", "scp://.*" }
	end,
}

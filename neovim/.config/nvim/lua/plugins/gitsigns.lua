return {
	"lewis6991/gitsigns.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("gitsigns").setup({
			keymaps = {},
			-- current_line_blame = true
		})
	end,
}
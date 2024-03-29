return {
	"jose-elias-alvarez/null-ls.nvim",
  enabled = false,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
				-- null_ls.builtins.completion.spell,
			},
      default_timeout = -1,
		})
	end,
}

local vim = vim

local version = vim.version()
local minor = version.minor
-- local tag = string.format("v0.%s.0", minor)
local tag = "v0.8.0"

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
  tag = tag,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"javascript",
				"css",
				"json",
				"http",
				"yaml",
				"typescript",
				"html",
				-- "org",
				"css",
				-- "lua",
				"go",
				-- "graphql",
				"java",
				-- "javascript",
				-- "css",
				-- "python",
				-- "php",
				-- "c",
				-- "cpp",
				-- "json",
				-- "yaml",
				-- "typescript",
				-- "jsdoc",
				-- "vue",
				-- "html",
				-- "regex",
				-- "query",
				"bash",
				"toml",
				-- "css",
			},
			-- ignore_install = { "markdown", "markdown_inline" },
			highlight = {
				enable = true,
				disable = { "elm", "bash" },
				-- additional_vim_regex_highlighting = { "org" },
			},
			indent = {
				enable = true,
			},

			autopairs = { enable = true },

			context_commentstring = {
				enable = true,
			},
		})
		vim.api.nvim_exec(
			[[
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
]],
			true
		)
	end,
}

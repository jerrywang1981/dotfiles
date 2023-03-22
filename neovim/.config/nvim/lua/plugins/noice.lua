return {
	"folke/noice.nvim",
	enabled = false,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("noice").setup({
			-- add any options here
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			cmdline = {},
			presets = {
				bottom_search = false,
				command_palette = false,
			},
			routes = {
				{
					view = "cmdline",
					filter = { event = "msg_showmode" },
				},
			},
		})

		require("telescope").load_extension("noice")
	end,
}

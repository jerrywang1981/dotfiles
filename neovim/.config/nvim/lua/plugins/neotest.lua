local vim = vim

return {
	"nvim-neotest/neotest",
	-- keys = "<leader>tt",
	keys = {
		{ "<leader>tt", "<cmd>lua require('neotest').run.run()<cr>", desc = "run nearest test" },
		{ "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "toggle test summary panel" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		-- "antoinemadec/FixCursorHold.nvim",
		"nvim-neotest/neotest-go",
		"nvim-neotest/neotest-vim-test",
		"vim-test/vim-test",
	},
	init = function()
		-- vim.api.nvim_set_keymap("n", "<leader>tt", '<cmd>lua require("neotest").run.run()<cr>', { noremap = true, silent = true })
	end,
	config = function()
		--[[
    --
		local neotest_ns = vim.api.nvim_create_namespace("neotest")
		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
					return message
				end,
			},
		}, neotest_ns)

    --]]

		require("neotest").setup({
			adapters = {
				require("neotest-go"),
				require("neotest-vim-test")({
					ignore_file_types = { "python", "vim", "lua", "go" },
				}),
			},
		})

		vim.api.nvim_set_keymap(
			"n",
			"<leader>tT",
			'<cmd>require("neotest").run.run(vim.fn.expand("%"))',
			{ noremap = true, silent = true, desc = "run current test file" }
		)

		vim.api.nvim_set_keymap(
			"n",
			"<leader>to",
			'<cmd>lua require("neotest").output_panel.toggle()<cr>',
			{ noremap = true, silent = true, desc = "toggle test output pannel" }
		)

		-- vim.keymap.set("n", "<leader>tt", "<cmd>Test", { noremap = true, silent = true })
		-- vim.cmd [[ nmap <leader>tt :lua require("neotest").run.run() ]]
	end,
}

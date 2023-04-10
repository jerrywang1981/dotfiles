local vim = vim

return {
	"nvim-telescope/telescope.nvim",
  tag = '0.1.1',
	dependencies = {
		-- { "nvim-lua/popup.nvim" },
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		local builtin = require("telescope.builtin")
		local utils = require("telescope.utils")

		vim.keymap.set("n", "<c-p>", function()
      local cwd = vim.loop.cwd()
			local in_worktree = utils.get_os_command_output({ "git", "rev-parse", "--is-inside-work-tree" }, cwd)
			local in_bare = utils.get_os_command_output({ "git", "rev-parse", "--is-bare-repository" }, cwd)
			if in_worktree[1] ~= "true" and in_bare[1] ~= "true" then
				return builtin.find_files({ previewer = false })
			else
				return builtin.git_files({ previewer = false })
			end
		end, { noremap = true, silent = true })

		vim.keymap.set("n", "<leader>fh", function()
			builtin.oldfiles()
		end, { noremap = true, silent = true })

		vim.keymap.set("n", "<leader>fs", function()
			builtin.live_grep()
		end, { noremap = true, silent = true })

		vim.keymap.set("n", "<leader>fS", function()
			builtin.current_buffer_fuzzy_find()
		end, { noremap = true, silent = true })

		vim.keymap.set("n", "<leader>fb", function()
			builtin.buffers()
		end, { noremap = true, silent = true })

		require("telescope").setup({
			defaults = {},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
        --[[
        --
        bookmarks = {
          selected_browser = "chrome",
          url_open_command = "xdg-open",
        },
        --]]
			},
		})
	end,
}

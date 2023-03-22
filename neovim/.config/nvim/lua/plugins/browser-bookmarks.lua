local vim = vim
return {
	"dhruvmanila/browser-bookmarks.nvim",
  enabled=false,
	dependencies = { "telescope.nvim" },
	config = function()
		require("telescope").load_extension("bookmarks")
	end,
}

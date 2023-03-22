return {
	url = "git@github.ibm.com:jianjunw/toolbox.nvim.git",
  enabled = true,
	dependencies = { "dhruvasagar/vim-open-url" },
	config = function()
		require("toolbox").setup()
	end,
}

return {
	"theHamsta/nvim-dap-virtual-text",
	dependencies = "nvim-dap",
	config = function()
		require("nvim-dap-virtual-text").setup()
	end,
}

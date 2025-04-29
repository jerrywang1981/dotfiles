return {
	"theHamsta/nvim-dap-virtual-text",
	enabled = jit.os ~= "Windows",
	dependencies = "nvim-dap",
	config = function()
		require("nvim-dap-virtual-text").setup()
	end,
}

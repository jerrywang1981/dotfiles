return {
	"leoluz/nvim-dap-go",
	enabled = jit.os ~= "Windows",
	dependencies = "nvim-dap",
	config = function()
		require("dap-go").setup()
	end,
}

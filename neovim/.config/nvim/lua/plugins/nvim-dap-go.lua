return {
	"leoluz/nvim-dap-go",
	dependencies = "nvim-dap",
	config = function()
    require('dap-go').setup()
	end,
}


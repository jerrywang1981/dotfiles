local vim = vim

return {
	"Pocco81/DAPInstall.nvim",
	branch = "dev",
	cmd = "DIList",
	dependencies = { "mfussenegger/nvim-dap", "nvim-dap" },
	config = function()
		local dap_install = require("dap-install")

		dap_install.setup({
			installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
		})

		dap_install.config("jsnode", {
			configurations = {
				{
					name = "Launch",
					type = "node2",
					request = "launch",
					program = "${file}",
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
					protocol = "inspector",
					console = "integratedTerminal",
				},
				{
					-- For this to work you need to make sure the node process is started with the `--inspect` flag.
					name = "Attach to process",
					type = "node2",
					request = "attach",
					processId = require("dap.utils").pick_process,
				},
			},
		})
	end,
}

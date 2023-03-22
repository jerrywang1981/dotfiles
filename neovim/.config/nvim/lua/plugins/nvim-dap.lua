local vim = vim

return {
	"mfussenegger/nvim-dap",
	dependencies = { "telescope.nvim", "nvim-telescope/telescope-dap.nvim" },
	config = function()
		local dap = require("dap")
		require("telescope").load_extension("dap")

		-- au FileType dap-repl lua require('dap.ext.autocompl').attach()
		local group = vim.api.nvim_create_augroup("DAPReplGrp", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			pattern = { "dap-repl" },
			callback = function()
				require("dap.ext.autocompl").attach()
			end,
		})

		vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "🟢", texthl = "", linehl = "", numhl = "" })

		--[[
    -- F5 continue
    -- F10 step over
    -- F11 step out
    -- F12 step into
    --]]
		vim.api.nvim_set_keymap(
			"n",
			"<f5>",
			[[<cmd>lua require'dap'.continue()<CR>]],
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<f10>",
			[[<cmd>lua require'dap'.step_over()<CR>]],
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<f11>",
			[[<cmd>lua require'dap'.step_out()<CR>]],
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<f12>",
			[[<cmd>lua require'dap'.step_into()<CR>]],
			{ noremap = true, silent = true }
		)

		vim.api.nvim_set_keymap(
			"n",
			"<leader>db",
			[[<cmd>lua require'dap'.toggle_breakpoint()<CR>]],
			{ noremap = true, silent = true }
		)

		vim.api.nvim_set_keymap(
			"n",
			"<leader>dro",
			[[<cmd>lua require'dap'.repl.toggle({}, 'vsplit')<CR>]],
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>drc",
			[[<cmd>lua require'dap'.run_to_cursor()<CR>]],
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>drl",
			[[<cmd>lua require'dap'.run_last()<CR>]],
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>duh",
			[[<cmd>lua require'dap.ui.widgets'.hover()<CR>]],
			{ noremap = true, silent = true }
		)
		-- vim.api.nvim_set_keymap('n', '<leader>dhv', [[<cmd>lua require'dap.ui.variables'.virtual_hover()<CR>]], { noremap = true, silent = true })

		-- vim.api.nvim_set_keymap('n', '<leader>dB', [[<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]], { noremap = true, silent = true })
		-- vim.api.nvim_set_keymap('n', '<leader>da', [[<cmd>lua require'jw.dap_config'.attach()<CR>]], { noremap = true, silent = true })
		-- vim.api.nvim_set_keymap('n', '<leader>di', [[<cmd>lua require'dap.ui.variables'.hover(function () return vim.fn.expand("<cexpr>") end)<CR>]], { noremap = true, silent = true })

		dap.configurations.java = {
			{
				type = "java",
				request = "attach",
				name = "Debug (Attach) - Remote",
				hostName = "127.0.0.1",
				port = 5005,
			},
		}

		dap.adapters.node2 = {
			type = "executable",
			command = "node",
			args = { os.getenv("HOME") .. "/repo/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
		}
		dap.configurations.javascript = {
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
		}

		--[[
dap.adapters.go = function(callback, config)
    local handle
    local pid_or_err
    local port = 38697
    handle, pid_or_err =
      vim.loop.spawn(
      "dlv",
      {
        args = {"dap", "-l", "127.0.0.1:" .. port},
        detached = true
      },
      function(code)
        handle:close()
        print("Delve exited with exit code: " .. code)
      end
    )
     ----should we wait for delve to start???
    --vim.defer_fn(
    --function()
      --dap.repl.open()
      --callback({type = "server", host = "127.0.0.1", port = port})
    --end,
    --100)

      callback({type = "server", host = "127.0.0.1", port = port})
  end
  -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${file}"
  }
}



dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/repo/vscode-node-debug2/out/src/nodeDebug.js'},
}

dap.configurations.javascript = {
  {
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
}

local function attach()
  print("attaching")
  dap.run({
      type = 'node2',
      request = 'attach',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      skipFiles = {'<node_internals>/**/*.js'},
      })
end

  --]]
	end,
}

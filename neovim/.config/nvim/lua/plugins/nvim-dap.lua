local vim = vim

return {
  "mfussenegger/nvim-dap",
  enabled = jit.os ~= "Windows",
  -- enabled = false,
  -- dependencies = { "telescope.nvim", "nvim-telescope/telescope-dap.nvim" },
  config = function()
    local dap = require("dap")
    -- require("telescope").load_extension("dap")

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

    vim.keymap.set("n", "<F5>", function()
      require("dap").continue()
    end, { desc = "Start debugger" })
    vim.keymap.set("n", "<F10>", function()
      require("dap").step_over()
    end, { desc = "Step over" })
    vim.keymap.set("n", "<F11>", function()
      require("dap").step_into()
    end, { desc = "Step into" })
    vim.keymap.set("n", "<F12>", function()
      require("dap").step_out()
    end, { desc = "Step out" })

    vim.keymap.set("n", "<Leader>db", function()
      require("dap").toggle_breakpoint()
    end, { desc = "Toggle breakpoint" })

    vim.keymap.set("n", "<Leader>dB", function()
      require("dap").set_breakpoint(vim.fn.input("Condition:"))
    end, { desc = "Set condition breakpoint" })

    vim.keymap.set("n", "<Leader>dp", function()
      require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end, { desc = "Set log point" })

    vim.keymap.set("n", "<Leader>dro", function()
      require("dap").repl.open()
    end, { desc = "Open Debugger Repl" })

    vim.keymap.set("n", "<Leader>drl", function()
      require("dap").run_last()
    end, { desc = "Run last debugger" })

    vim.keymap.set("n", "<Leader>drc", function()
      require("dap").run_to_cursor()
    end, { desc = "Run to the cursor" })

    vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
      require("dap.ui.widgets").hover()
    end, { desc = "Show debug info" })
    -- vim.keymap.set({'n', 'v'}, '<Leader>dv', function()
    --   require('dap.ui.widgets').preview()
    -- end)
    vim.keymap.set("n", "<Leader>df", function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float(widgets.frames)
    end, { desc = "Open debugger frames" })

    vim.keymap.set("n", "<Leader>ds", function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float(widgets.scopes)
    end, { desc = "Open debugger scopes" })

    vim.keymap.set("n", "<Leader>de", function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float(widgets.expression)
    end, { desc = "Open debugger expression" })

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

    local function get_spring_boot_runner(profile, debug)
      local debug_param = ""
      if debug then
        debug_param =
          ' -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005" '
      end

      local profile_param = ""
      if profile ~= "" then
        profile_param = " -Dspring-boot.run.profiles=" .. profile .. " "
      end

      return "mvn spring-boot:run -Dmaven.test.skip=true" .. profile_param .. debug_param
    end

    local function run_spring_boot(debug)
      local profile = vim.fn.input("Input profile: ")
      vim.cmd("term " .. get_spring_boot_runner(profile, debug))
    end

    --[[
    -- F7 Debug Springboot
    -- F8 Springboot
    --]]

    vim.keymap.set("n", "<F7>", function()
      run_spring_boot(true)
    end)

    vim.keymap.set("n", "<F8>", function()
      run_spring_boot()
    end)
  end,
}

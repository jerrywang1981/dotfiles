local vim = vim
-- local path = require("lspconfig/util").path

local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then
  vim.notify("JDTLS not found, install it first")
  return
end

local get_os_config = function()
  if vim.fn.has("osx") == 1 then
    return "config_mac"
  elseif vim.fn.has("unix") == 1 then
    return "config_linux"
  else
    return "config_win"
  end
end

local function get_jdtls()
  -- Get the Mason Registry to gain access to downloaded binaries
  local mason_registry = require("mason-registry")
  -- Find the JDTLS package in the Mason Regsitry
  local jdt = mason_registry.get_package("jdtls")
  -- Find the full path to the directory where Mason has downloaded the JDTLS binaries
  local jdtls_path = jdt:get_install_path()

  -- local f_dir = table.concat({ vim.fn.stdpath("config"), "f" }, "/")
  -- local jdtls_path = table.concat({ f_dir, "jdtls" }, "/")

  -- Obtain the path to the jar which runs the language server
  local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
  -- Declare white operating system we are using, windows use win, macos use mac
  -- local SYSTEM = "linux"
  -- Obtain the path to configuration files for your specific operating system
  -- local config = jdtls_path .. "/config_" .. SYSTEM
  local config = jdtls_path .. "/" .. get_os_config()
  -- Obtain the path to the Lomboc jar
  local lombok = jdtls_path .. "/lombok.jar"
  -- local lombok = f_dir .. "/lombok.jar"
  return launcher, config, lombok
end

local function get_bundles()
  -- Get the Mason Registry to gain access to downloaded binaries
  local mason_registry = require("mason-registry")
  -- Find the Java Debug Adapter package in the Mason Registry
  local java_debug = mason_registry.get_package("java-debug-adapter")
  -- Obtain the full path to the directory where Mason has downloaded the Java Debug Adapter binaries
  local java_debug_path = java_debug:get_install_path()

  local f_dir = table.concat({ vim.fn.stdpath("config"), "f" }, "/")
  local dep_java_file = table.concat({ f_dir, "com.microsoft.jdtls.ext.core-0.24.1.jar" }, "/")

  local bundles = {
    vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", 1),
    vim.fn.glob(dep_java_file, 1),
  }

  local function get_java_test_bundles(java_test_path)
    local jars = {
      "junit-jupiter-api_*.jar",
      "junit-jupiter-engine_*.jar",
      "junit-jupiter-migrationsupport_*.jar",
      "junit-jupiter-params_*.jar",
      "junit-platform-commons_*.jar",
      "junit-platform-engine_*.jar",
      "junit-platform-launcher_*.jar",
      "junit-platform-runner_*.jar",
      "junit-platform-suite-api_*.jar",
      "junit-platform-suite-commons_*.jar",
      "junit-platform-suite-engine_*.jar",
      "junit-vintage-engine_*.jar",
      "org.apiguardian.api_*.jar",
      "org.eclipse.jdt.junit4.runtime_*.jar",
      "org.eclipse.jdt.junit5.runtime_*.jar",
      "org.opentest4j_*.jar",
      "com.microsoft.java.test.plugin-*.jar",
    }
    local _bundles = {}
    for _, v in ipairs(jars) do
      vim.list_extend(_bundles, vim.split(vim.fn.glob(java_test_path .. "/extension/server/" .. v, 1), "\n"))
    end
    return _bundles
  end

  -- Find the Java Test package in the Mason Registry
  local java_test = mason_registry.get_package("java-test")
  -- Obtain the full path to the directory where Mason has downloaded the Java Test binaries
  local java_test_path = java_test:get_install_path()
  -- Add all of the Jars for running tests in debug mode to the bundles list
  -- vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar", 1), "\n"))
  vim.list_extend(bundles, get_java_test_bundles(java_test_path))

  return bundles
end

local function get_workspace()
  -- Get the home directory of your operating system
  local home = jit.os == "Windows" and os.getenv("USERPROFILE") or os.getenv("HOME")
  -- Declare a directory where you would like to store project information
  local workspace_path = home .. "/workspace/"
  -- Determine the project name
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  -- Create the workspace directory by concatenating the designated workspace path and the project name
  local workspace_dir = workspace_path .. project_name
  return workspace_dir
end

-- Get the paths to the jdtls jar, operating specific configuration directory, and lombok jar
local launcher, os_config, lombok = get_jdtls()

-- Get the path you specified to hold project information
local workspace_dir = get_workspace()

-- Get the bundles list with the jars to the debug adapter, and testing adapters
local bundles = get_bundles()

local f_dir = table.concat({ vim.fn.stdpath("config"), "f" }, "/")
local install_dir = table.concat({ f_dir, "jdtls" }, "/")
-- local jar_file_name = table.concat({ install_dir, "plugins", "org.eclipse.equinox.launcher_1.6.0.v20200915-1508.jar" }, "/")
-- local lombok_file = table.concat({ f_dir, "lombok.jar" }, "/")
-- local debug_java_file = table.concat({ f_dir, "com.microsoft.java.debug.plugin-0.35.0.jar" }, "/")
local dep_java_file = table.concat({ f_dir, "com.microsoft.jdtls.ext.core-0.24.1.jar" }, "/")

local root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })
-- vim.print(#root_dir)
if root_dir == "" then
  return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
-- local workspace_dir = table.concat({ vim.loop.os_homedir(), "workspace", project_name }, "/")

local on_attach = function(client, bufnr)
  if jit.os ~= "Windows" then
    require("jdtls").setup_dap({ hotcodereplace = "auto" })
  end
  require("jdtls.setup").add_commands()
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "<c-]>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  -- buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  -- buf_set_keymap("n", "gri", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- buf_set_keymap("n", "<localleader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  -- buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- buf_set_keymap("n", "grn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  -- buf_set_keymap("n", "grr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  -- buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  -- buf_set_keymap("n", "gra", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- buf_set_keymap("n", "<localleader>=", "<cmd>lua vim.lsp.buf.format({async=true})<CR>", opts)

  if vim.version().major == 0 and vim.version().minor < 10 then
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  end

  if vim.version().major == 0 and vim.version().minor < 11 then
    buf_set_keymap("n", "grn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "grr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "gri", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "gra", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "gO", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
  end
  buf_set_keymap("n", "<space>d", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  -- require("java-deps").attach(client, bufnr, root_dir)

  -- Set a Vim motion to <Space> + <Shift>J + o to organize imports in normal mode
  vim.keymap.set(
    "n",
    "<leader>Jo",
    "<Cmd> lua require('jdtls').organize_imports()<CR>",
    { buffer = true, desc = "[J]ava [O]rganize Imports" }
  )
  -- Set a Vim motion to <Space> + <Shift>J + v to extract the code under the cursor to a variable
  vim.keymap.set(
    "n",
    "<leader>Jv",
    "<Cmd> lua require('jdtls').extract_variable()<CR>",
    { buffer = true, desc = "[J]ava Extract [V]ariable" }
  )
  -- Set a Vim motion to <Space> + <Shift>J + v to extract the code selected in visual mode to a variable
  vim.keymap.set(
    "v",
    "<leader>Jv",
    "<Esc><Cmd> lua require('jdtls').extract_variable(true)<CR>",
    { buffer = true, desc = "[J]ava Extract [V]ariable" }
  )
  -- Set a Vim motion to <Space> + <Shift>J + <Shift>C to extract the code under the cursor to a static variable
  vim.keymap.set(
    "n",
    "<leader>Jc",
    "<Cmd> lua require('jdtls').extract_constant()<CR>",
    { buffer = true, desc = "[J]ava Extract [C]onstant" }
  )
  -- Set a Vim motion to <Space> + <Shift>J + <Shift>C to extract the code selected in visual mode to a static variable
  vim.keymap.set(
    "v",
    "<leader>Jc",
    "<Esc><Cmd> lua require('jdtls').extract_constant(true)<CR>",
    { buffer = true, desc = "[J]ava Extract [C]onstant" }
  )
  vim.keymap.set(
    "v",
    "<leader>Jm",
    "<Esc><Cmd> lua require('jdtls').extract_method(true)<CR>",
    { buffer = true, desc = "[J]ava Extract [M]ethod" }
  )
  -- Set a Vim motion to <Space> + <Shift>J + t to run the test method currently under the cursor
  vim.keymap.set(
    "n",
    "<leader>Jt",
    "<Cmd> lua require('jdtls').test_nearest_method()<CR>",
    { buffer = true, desc = "[J]ava [T]est Method" }
  )
  -- Set a Vim motion to <Space> + <Shift>J + t to run the test method that is currently selected in visual mode
  vim.keymap.set(
    "v",
    "<leader>Jt",
    "<Esc><Cmd> lua require('jdtls').test_nearest_method(true)<CR>",
    { buffer = true, desc = "[J]ava [T]est Method" }
  )
  -- Set a Vim motion to <Space> + <Shift>J + <Shift>T to run an entire test suite (class)
  vim.keymap.set(
    "n",
    "<leader>JT",
    "<Cmd> lua require('jdtls').test_class()<CR>",
    { buffer = true, desc = "[J]ava [T]est Class" }
  )
  -- Set a Vim motion to <Space> + <Shift>J + u to update the project configuration
  -- vim.keymap.set("n", "<leader>Ju", "<Cmd> JdtUpdateConfig<CR>", { desc = "[J]ava [U]pdate Config" })

  local create_command = vim.api.nvim_buf_create_user_command
  create_command(bufnr, "JavaProjects", require("java-deps").toggle_outline, {
    nargs = 0,
  })
  --[[
  require("lsp_signature").on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    floating_window_above_cur_line = false,
    padding = "",
    handler_opts = {
      border = "rounded",
    },
  }, bufnr)
  --]]
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
-- extendedClientCapabilities.progressReportProvider = false

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
-- https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    -- 'java', -- or '/path/to/java11_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    -- "/usr/lib/jvm/java-11/bin/java",
    jit.os == "Windows" and "C:\\Program Files\\Semeru\\jre-17.0.14.7-openj9\\bin\\java.exe"
      or "/home/jerry/.sdkman/candidates/java/21.0.6-ms/bin/java",
    -- "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "-javaagent:" .. lombok, --lombok_file,
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    -- 💀
    -- '-jar', install_dir .. "/plugins/org.eclipse.equinox.launcher_1.6.0.v20200915-1508.jar",
    "-jar",
    launcher,
    -- jar_file_name,
    -- '-jar', '/path/to/jdtls_install_location/plugins/org.eclipse.equinox.launcher_VERSION_NUMBER.jar',
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
    -- Must point to the                                                     Change this to
    -- eclipse.jdt.ls installation                                           the actual version

    -- 💀
    "-configuration",
    os_config,
    --'/path/to/jdtls_install_location/config_SYSTEM',
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
    -- Must point to the                      Change to one of `linux`, `win` or `mac`
    -- eclipse.jdt.ls installation            Depending on your system.

    -- 💀
    -- See `data directory configuration` section in the README
    "-data",
    workspace_dir,
    --'/path/to/unique/per/project/workspace/folder'
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  -- root_dir = root_dir,
  root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      project = {
        encoding = "UTF-8",
      },
      inlayHints = {
        parameterNames = { enabled = "ALL" },
      },
      import = {
        gradle = { enabled = true },
        maven = { enabled = true },
        exclusions = {
          "**/node_modules/**",
          "**/.metadata/**",
          "**/archetype-resources/**",
          "**/META-INF/maven/**",
          "**/.git/**",
        },
      },
      format = {
        enabled = true,
        -- settings = {
        --   url = table.concat({ f_dir, "intellij-java-google-style.xml" }, "/"),
        --   profile = "GoogleStyle",
        -- },
      },
      -- saveActions = {
      -- 	organizeImports = true,
      -- },
      -- signatureHelp = { enabled = true },
      signatureHelp = {
        enabled = true,
        description = {
          enabled = true,
        },
      },
      -- Use the fernflower decompiler when using the javap command to decompile byte code back to java code
      contentProvider = {
        preferred = "fernflower",
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      completion = {
        favoriteStaticMembers = {
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
        },
        importOrder = {
          "java",
          "javax",
          "com",
          "org",
        },
      },
      configuration = {
        runtimes = {
          {
            name = "JavaSE-11",
            path = jit.os == "Windows" and "C:\\Program Files\\Semeru\\jre-17.0.14.7-openj9"
              or "/usr/lib/jvm/java-11-openjdk-amd64",
          },
          {
            name = "JavaSE-17",
            path = jit.os == "Windows" and "C:\\Program Files\\Semeru\\jre-17.0.14.7-openj9"
              or "/usr/lib/jvm/java-17-openjdk-amd64",
          },
        },
      },
    }, -- end of java
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = bundles,
    -- bundles = {
    --   vim.fn.glob(debug_java_file),
    --   vim.fn.glob(dep_java_file),
    --   -- vim.fn.glob(debug_java_file)
    -- },
    extendedClientCapabilities = extendedClientCapabilities,
  },

  on_attach = on_attach,
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require("jdtls").start_or_attach(config)

vim.lsp.inlay_hint.enable(true)

vim.keymap.set("n", "<leader>th", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay hint" })
-- vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({async=true})]])

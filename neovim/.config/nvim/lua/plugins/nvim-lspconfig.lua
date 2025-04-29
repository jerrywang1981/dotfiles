local vim = vim
return {
  "neovim/nvim-lspconfig",
  enabled = false,
  dependencies = {
    "nvim-lua/lsp-status.nvim",
    -- "saghen/blink.cmp",
    "hrsh7th/nvim-cmp",
  },
  opts = {
    inlay_hints = { enable = true },
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            hint = { enable = true },
          },
        },
      },
    },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local lsp_status = require("lsp-status")
    local log = require("vim.lsp.log")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    -- local capabilities = require("blink.cmp").get_lsp_capabilities()

    local configs = require("lspconfig/configs")
    local util = require("lspconfig/util")

    --[=[
    --
    configs.cjls = {
      default_config = {
        cmd = { "LSPServer" },
        filetypes = { "cangjie" },
        root_dir = util.path.dirname,
      },
      docs = {
        description = [[
]],
        default_config = {
          root_dir = [[root_pattern(".git")]],
        },
      },
    }

    lspconfig.cjls.setup({})

    --]=]

    local on_attach = function(client, bufnr)
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
      -- buf_set_keymap("n", "<localleader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
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
      -- moved to trouble.lua
      buf_set_keymap("n", "<space>d", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
      -- buf_set_keymap("n", "<localleader>=", "<cmd>lua vim.lsp.buf.format({timeout_ms=2000})<CR>", opts)
      -- Set some keybinds conditional on server capabilities

      -- Set autocommands conditional on server_capabilities
      if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_exec(
          [[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
          false
        )
      end
    end

    lsp_status.config({
      status_symbol = "V",
    })

    lsp_status.register_progress()

    local on_attach_vim = function(client, bufnr)
      on_attach(client, bufnr)
    end

    local on_attach_vim_go = function(client, bufnr)
      on_attach_vim(client, bufnr)
      -- vim.api.nvim_command([[autocmd BufWritePre *.go lua require'utils'.organize_imports_format()]])
    end

    local on_attach_vim_h = function(client, bufnr)
      on_attach_vim(client, bufnr)
    end

    --[[
-- npm install -g typescript typescript-language-server
-- npm install -g vscode-html-languageserver-bin
-- npm install -g vls
-- npm install -g vscode-css-languageserver-bin
-- npm install -g bash-language-server
-- npm install -g vscode-json-languageserver
-- npm install -g vim-language-server
-- npm install -g sql-language-server
-- npm install -g diagnostic-languageserver
--
--
-- yarn global add typescript typescript-language-server vscode-html-languageserver-bin vls vscode-css-languageserver-bin bash-language-server vscode-json-languageserver vim-language-server sql-language-server
--]]

    local servers = {
      -- "tsserver",
      -- "vuels",
      -- "cssls",
      -- "html",
      -- "jsonls",
      -- 'jdtls',
      -- "bashls",
      -- 'eslint',
      -- "gopls",
      -- "emmet_ls",
      -- "tailwindcss",
      -- "metals",
      -- 'vimls',
      -- "sqlls",
      -- "pylsp",
      -- "lua_ls",
      -- "rust_analyzer",
      --"cjls",
    }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({
        on_attach = on_attach_vim,
        capabilities = capabilities,
        flags = {
          debounce_text_change = 150,
        },
      })
    end

    --[[
    lspconfig["cjls"].setup({
      on_attach = on_attach_vim,
      --capabilities = capabilities,
      flags = {
        debounce_text_change = 150,
      },
      handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
          -- Disable virtual_text
          virtual_text = true,
        }),

        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
          -- Use a sharp border with `FloatBorder` highlights
          border = "single",
          -- add the title in hover float window
          title = "hover",
        }),
      },
    })
    --]]

    --[[
    lspconfig["ts_ls"].setup({
      on_attach = on_attach_vim,
      capabilities = capabilities,
      flags = {
        debounce_text_change = 150,
      },
      settings = {
        typescript = {
          inlayHints = {
            -- taken from https://github.com/typescript-language-server/typescript-language-server#workspacedidchangeconfiguration
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = true, -- false
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = true, -- false
          },
        },
        javascript = {
          inlayHints = {
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          },
        },
      },
    })
    --

    vim.diagnostic.config({
      virtual_text = {
        spacing = 0,
        source = true,
        current_line = true,
      },
    })
    --]]
    -- vim.cmd([[ autocmd CursorHold * lua vim.diagnostic.open_float() ]])
    -- vim.api.nvim_command([[autocmd BufWritePre *.js,*.lua lua vim.lsp.buf.format({bufnr=nil, timeout_ms=1000})]])
  end,
}

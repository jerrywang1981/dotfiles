local vim = vim

local capabilities = {
  textDocument = {
    semanticTokens = {
      multilineTokenSupport = true,
    },
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    },
  },
}

local ok, cmp = pcall(require, "blink.cmp")
if ok then
  capabilities = cmp.get_lsp_capabilities(capabilities)
end

vim.lsp.config("*", {
  capabilities = capabilities,
  -- capabilities = {
  --   textDocument = {
  --     semanticTokens = {
  --       multilineTokenSupport = true,
  --     },
  --   },
  -- },
  root_markers = { ".git" },
  -- on_attach = on_attach,
  flags = {
    debounce_text_change = 150,
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(args.buf, ...)
    end
    local opts = { noremap = true, silent = true }

    buf_set_keymap("n", "<leader>flws", "<Cmd>lua require('fzf-lua').lsp_live_workspace_symbols()<CR>", {
      noremap = true,
      silent = true,
      desc = "[f]zf [l]sp [w]orkspace [s]ymbols",
    })
    buf_set_keymap("n", "<leader>fldw", "<Cmd>lua require('fzf-lua').diagnostics_workspace()<CR>", {
      noremap = true,
      silent = true,
      desc = "[f]zf [l]sp [d]iagnostics [w]orkspace",
    })
    buf_set_keymap("n", "<leader>fldd", "<Cmd>lua require('fzf-lua').diagnostics_document()<CR>", {
      noremap = true,
      silent = true,
      desc = "[f]zf [l]sp [d]iagnostics [d]ocument",
    })

    if client:supports_method("textDocument/declaration") then
      buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    end

    if client:supports_method("textDocument/definition") then
      buf_set_keymap("n", "<c-]>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    end

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

    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
    end

    -- folding
    if client and client:supports_method("textDocument/foldingRange") then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
    end

    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true)

      vim.keymap.set("n", "<leader>TH", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, { desc = "[T]oggle Inlay [H]int" })
    end

    local function client_supports_method(cl, method, bufnr)
      if vim.fn.has("nvim-0.11") == 1 then
        return cl:supports_method(method, bufnr)
      else
        return cl.supports_method(method, { bufnr = bufnr })
      end
    end

    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, args.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

      -- When cursor stops moving: Highlights all instances of the symbol under the cursor
      -- When cursor moves: Clears the highlighting
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = args.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = args.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      -- When LSP detaches: Clears the highlighting
      vim.api.nvim_create_autocmd("LspDetach", {
        group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
        end,
      })
    end
  end,
})

vim.diagnostic.config({
  virtual_text = {
    spacing = 0,
    source = true,
    current_line = true,
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})

vim.cmd([[ autocmd CursorHold * lua vim.diagnostic.open_float() ]])

vim.lsp.enable({ "bash", "ts", "css", "emmet", "sql", "html", "json", "vue", "go", "python", "lua", "php" })

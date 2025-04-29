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
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(args.buf, ...)
    end
    local opts = { noremap = true, silent = true }

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

    -- moved to trouble.lua
    buf_set_keymap("n", "<space>d", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end

    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true)

      vim.keymap.set("n", "<leader>th", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, { desc = "Toggle Inlay hint" })
    end
  end,
})

vim.diagnostic.config({
  virtual_text = {
    spacing = 0,
    source = true,
    current_line = true,
  },
})

vim.cmd([[ autocmd CursorHold * lua vim.diagnostic.open_float() ]])

vim.lsp.enable({ "bash", "ts", "css", "emmet", "sql", "html", "json", "vue", "go", "python", "lua", "php" })

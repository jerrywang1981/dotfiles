local vim = vim
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettierd", "prettier", stop_after_first = true },
        angular = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        rust = { "rustfmt", lsp_format = "fallback" },
        -- java = { "google-java-format" },
        python = { "isort", "black" },
        -- xml = { "xmlformat" },
      },
      default_format_opts = {
        lsp_format = "fallback",
        -- lsp_format = "never",
        async = true,
        timeout_ms = 2000,
      },
      -- format_on_save = {
      --   lsp_format = "fallback",
      --   async = true,
      --   timeout_ms = 2000,
      -- },
      format_after_save = {
        lsp_format = "fallback",
        async = true,
        timeout_ms = 2000,
      },
      log_level = vim.log.levels.ERROR,
      notify_on_error = true,
      notify_no_formatters = true,
    })

    vim.keymap.set({ "n", "v" }, "<leader>=", function()
      conform.format({
        lsp_format = "fallback",
        async = true,
        timeout_ms = 2000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}

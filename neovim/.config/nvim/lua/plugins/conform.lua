local vim = vim
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "ConformInfo" },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettierd", "prettier", stop_after_first = true },
        vue = { "prettierd", "prettier", stop_after_first = true },
        angular = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        svelte = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettierd", "prettier", stop_after_first = true },
        htmlangular = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        rust = { "rustfmt", lsp_format = "fallback" },
        -- java = { "google-java-format" },
        python = { "isort", "black" },
        xml = { "xmlformat" },
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
      -- format_after_save = {
      --   lsp_format = "fallback",
      --   async = true,
      --   timeout_ms = 2000,
      -- },

      format_after_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 1000, async = true, lsp_format = "fallback" }
      end,

      log_level = vim.log.levels.ERROR,
      notify_on_error = true,
      notify_no_formatters = true,
    })

    require("conform").formatters.xmlformat = {
      prepend_args = { "--blanks" },
    }

    vim.keymap.set({ "n", "v" }, "<leader>=", function()
      conform.format({
        lsp_format = "fallback",
        async = true,
        timeout_ms = 2000,
      })
    end, { desc = "Format file or range (in visual mode)" })

    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_format = "fallback", range = range })
    end, { range = true })

    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
      -- delete key map if any
      vim.keymap.del({ "n", "v" }, "<leader>=")
    end, {
      desc = "Disable format-after-save",
      bang = true,
    })

    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false

      vim.keymap.set({ "n", "v" }, "<leader>=", function()
        conform.format({
          lsp_format = "fallback",
          async = true,
          timeout_ms = 2000,
        })
      end, { desc = "Format file or range (in visual mode)" })
    end, {
      desc = "Re-enable format-after-save",
    })
  end,
}

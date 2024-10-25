local vim = vim
return {
  "mfussenegger/nvim-lint",
  enabled = true,
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")

    -- require("lint.linters.checkstyle").config_file =
    -- print(string.format("%s/%s/%s", vim.fn.stdpath("config"), "f", "google_checks.xml"))

    -- lint.linters_by_ft = {
    -- 	markdown = { "vale" },
    -- 	javascript = { "eslint" },
    -- }

    -- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    -- 	callback = function()
    -- 		require("lint").try_lint()
    -- 	end,
    -- })

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      -- java = { "checkstyle" },
      svelte = { "eslint_d" },
      kotlin = { "ktlint" },
      python = { "pylint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}

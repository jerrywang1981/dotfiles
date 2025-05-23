local vim = vim

return {
  "rest-nvim/rest.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  -- dependencies = {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     opts.ensure_installed = opts.ensure_installed or {}
  --     table.insert(opts.ensure_installed, "http")
  --   end,
  -- },
  ft = "http",
  tag = "v1.2.1",
  config = function()
    require("rest-nvim").setup({
      -- Open request results in a horizontal split
      result_split_horizontal = false,
      -- Keep the http file buffer above|left when split horizontal|vertical
      result_split_in_place = true,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      -- Encode URL before making request
      encode_url = true,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        show_http_info = true,
        show_headers = true,
        -- executables or functions for formatting response body [optional]
        -- set them to false if you want to disable them
        formatters = {
          json = "jq",
          html = function(body)
            return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
          end,
        },
      },
      -- Jump to request line on run
      jump_to_request = false,
      env_file = ".env",
      custom_dynamic_variables = {},
      yank_dry_run = true,
    })

    local group = vim.api.nvim_create_augroup("RestNvimGrp", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      pattern = { "http" },
      callback = function()
        vim.api.nvim_buf_set_keymap(0, "n", "<leader>sr", "<Plug>RestNvim", { noremap = true, silent = true })
      end,
    })
  end,
}

return {
  "ray-x/lsp_signature.nvim",
  enabled = false,
  config = function()
    require("lsp_signature").setup({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      floating_window_above_cur_line = false,
      padding = "",
      handler_opts = {
        border = "rounded",
      },
    })
  end,
}

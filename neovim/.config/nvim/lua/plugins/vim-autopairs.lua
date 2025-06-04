return {
  "windwp/nvim-autopairs",
  -- enabled = false,
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true,
    })
  end,
}

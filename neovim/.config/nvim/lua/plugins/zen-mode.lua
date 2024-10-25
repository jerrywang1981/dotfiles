return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  enabled = false,
  config = function()
    require("zen-mode").setup()
  end,
}

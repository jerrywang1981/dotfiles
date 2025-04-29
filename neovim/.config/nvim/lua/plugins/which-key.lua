return {
  "folke/which-key.nvim",
  dependencies = {
    { "echasnovski/mini.icons", version = "*" },
  },
  config = function()
    require("which-key").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      delay = 1000,
    })
  end,
}

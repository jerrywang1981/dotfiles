local vim = vim

return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.ai").setup()
    -- require("mini.comment").setup()
    -- require("mini.pairs").setup()

    require("mini.animate").setup()
  end,
}

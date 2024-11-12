local vim = vim
local enabled = vim.version().minor < 10 and true or false
return {
  "numToStr/Comment.nvim",
  enabled = enabled,
  config = function()
    require("Comment").setup()
  end,
}

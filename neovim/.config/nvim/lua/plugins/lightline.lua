local vim = vim

return {
  "itchyny/lightline.vim",
  enabled = false,
  dependencies = {
    "mengelbrecht/lightline-bufferline",
  },
  config = function()
    vim.g["lightline"] = {
      colorscheme = "wombat",
      active = {
        left = { { "mode", "paste" }, { "gitbranch", "readonly", "modified", "jerry", "filename" } },
      },
      tabline = {
        left = { { "buffers" } },
        right = { { "close" } },
      },
      component = {
        jerry = "Jerry Wang",
      },
      component_function = {
        gitbranch = "FugitiveHead",
      },
      component_expand = {
        buffers = "lightline#bufferline#buffers",
      },
      component_type = {
        buffers = "tabsel",
      },
    }
  end,
}

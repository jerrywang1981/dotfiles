local vim = vim
return {
  "mattn/emmet-vim",
  ft = { "html", "css" },
  enabled = false,
  config = function()
    vim.g.user_emmet_install_global = 0
    vim.api.nvim_command("autocmd FileType html,css EmmetInstall")
  end,
}

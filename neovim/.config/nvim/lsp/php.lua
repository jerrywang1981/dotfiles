local vim = vim

return {
  cmd = { "intelephense", "--stdio" },
  filetypes = { "php" },
  root_markers = { "composer.json", ".git" },
}

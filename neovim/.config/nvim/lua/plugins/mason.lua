return {
  "williamboman/mason.nvim",
  enabled = true,
  config = function()
    require("mason").setup({
      ui = {
        check_outdated_packages_on_open = false,
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
  end,
}

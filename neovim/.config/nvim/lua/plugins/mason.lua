return {
  "williamboman/mason.nvim",
  enabled = true,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
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
    require("mason-lspconfig").setup({
      ensure_installed = { "jdtls", "ts_ls" },
    })
  end,
}

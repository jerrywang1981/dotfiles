return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
	cmd = { "NvimTreeToggle" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
	init = function()
		vim.api.nvim_set_keymap("n", "<space>1", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
	end,
  config = function()
    require("nvim-tree").setup {
			disable_netrw = true,
      filters = {
        dotfiles = true,
        git_clean = false,
        no_buffer = false,
        custom = {},
        exclude = {},
      },
    }
  end,
}

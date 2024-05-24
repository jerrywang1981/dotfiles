local vim = vim
return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      vim.api.nvim_command("colorscheme nightfox")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.o.background = "dark"
      -- vim.api.nvim_command("colorscheme tokyonight")
    end,
  },

  "alvan/vim-closetag",
  "milisims/nvim-luaref",
  -- "nanotee/luv-vimdocs",
  "tpope/vim-surround",
  "tpope/vim-unimpaired",
  "tpope/vim-repeat",
  "wellle/targets.vim",
  "kshenoy/vim-signature",
  "mfussenegger/nvim-jdtls",
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },
  "junegunn/fzf.vim",
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({})
    end,
  },
  {
    "honza/dockerfile.vim",
    opt = true,
    ft = { "Dockerfile" },
  },
  {
    "junegunn/gv.vim",
    opt = true,
    cmd = { "GV" },
  },
  {
    "elzr/vim-json",
    opt = true,
    ft = { "json" },
    config = function()
      vim.g.vim_json_syntax_conceal = 0
    end,
  },
  {
    "echasnovski/mini.ai",
    version = "*",
    enabled = false,
    config = function()
      require("mini.ai").setup()
    end,
  },
  --[=====[



	use({
		"stevearc/aerial.nvim",
		setup = [[
      vim.api.nvim_set_keymap('n', '<space>o', '<cmd>AerialToggle<CR>',{ noremap = true, silent = true })
    ]],
		config = config("aerial"),
	})












	-- lazy loading


	use({
		"iamcco/markdown-preview.nvim",
		opt = true,
		run = "cd app && yarn install",
		cmd = "MarkdownPreview",
		config = [[
        vim.g.mkdp_auto_close = 1
    ]],
	})






	--]=====]
}

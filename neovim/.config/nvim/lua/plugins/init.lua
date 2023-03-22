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
		"kyazdani42/nvim-web-devicons",
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
	--[=====[



	use({
		"stevearc/aerial.nvim",
		setup = [[
      vim.api.nvim_set_keymap('n', '<space>o', '<cmd>AerialToggle<CR>',{ noremap = true, silent = true })
    ]],
		config = config("aerial"),
	})

	use({
		"mbbill/undotree",
		opt = true,
		cmd = { "UndotreeToggle" },
		setup = [[
          vim.api.nvim_set_keymap('n', '<space>5', '<cmd>UndotreeToggle<CR>', { silent=true })
        ]],
		config = [=[
          vim.g.undotree_DiffAutoOpen = 1
          vim.g.undotree_SetFocusWhenToggle = 1
          vim.g.undotree_ShortIndicators = 1
          vim.g.undotree_WindowLayout = 2
          vim.g.undotree_DiffpanelHeight = 8
          vim.g.undotree_SplitWidth = 24
        ]=],
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

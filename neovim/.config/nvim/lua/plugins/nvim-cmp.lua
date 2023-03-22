local vim = vim
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/cmp-emoji",
		"hrsh7th/vim-vsnip",
		"hrsh7th/cmp-path",
	},
	config = function()
		vim.o.completeopt = "menuone,noselect"
		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				expand = function(args)
					-- For `vsnip` user.
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				-- -- For vsnip user.
				{ name = "vsnip" },
				{ name = "buffer" },
				{ name = "calc" },
				-- { name = 'cmdline' },
				{ name = "emoji" },
				{ name = "path" },
			},

			view = {
				-- entries = 'native'
				-- entries = 'wildmenu'
			},
		})

		---[[
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})
		--]]
	end,
}

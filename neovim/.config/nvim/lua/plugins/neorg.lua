return {
	{
		"nvim-neorg/neorg",
    enabled = false,
		build = ":Neorg sync-parsers",
		opts = {
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
				["core.norg.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							work = "~/notes/work",
							home = "~/notes/home",
						},
						default_workspace = "work",
					},
				},
			},
		},
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
}

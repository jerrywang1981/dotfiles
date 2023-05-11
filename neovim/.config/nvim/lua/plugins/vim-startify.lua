local vim = vim

return {

	"mhinz/vim-startify",
	config = function()
		vim.g.startify_change_to_vcs_root = 1
		vim.g.startify_change_to_dir = 0
		vim.g.startify_files_number = 5
		vim.g.startify_enable_special = 0
		vim.g.startify_lists = { { type = "files", header = { "   MRU" } } }
		local ascii = {
			[[       _                       __          __                  ]],
			[[      | |                      \ \        / /                  ]],
			[[      | | ___ _ __ _ __ _   _   \ \  /\  / /_ _ _ __   __ _    ]],
			[[  _   | |/ _ \ |__| |__| | | |   \ \/  \/ / _| | |_ \ / _` |   ]],
			[[ | |__| |  __/ |  | |  | |_| |    \  /\  / (_| | | | | (_| |   ]],
			[[  \____/ \___|_|  |_|   \__| |     \/  \/ \__|_|_| |_|\__| |   ]],
			[[                         __/ |                         __/ | * @jerrywang1981 github  ]],
			[[                        |___/                         |___/  * https://jerrywang1981.github.io  ]],
			[[                                                             * jerrywang1981@outlook.com ]],
      [[ ]],
      [[ ]],
      [[        .--- . .-. .-. -.--  .-- .- -. --. ]],
		}
		vim.g.startify_custom_header = vim.fn["startify#center"](ascii)
		local footer = {
			"春风杨柳万千条, 六亿神州尽舜尧",
			"红雨随心翻作浪, 青山着意化为桥",
			"天连五岭银锄落, 地动三河铁臂摇",
			"借问瘟君欲何往, 纸船明烛照天烧",
			"                               七律二首 送瘟神",
		}
		vim.g.startify_custom_footer = vim.fn["startify#center"](footer)
	end,
}

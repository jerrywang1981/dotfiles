local vim = vim

return {

  "mhinz/vim-startify",
  config = function()
    vim.g.startify_change_to_vcs_root = 1
    vim.g.startify_change_to_dir = 0
    vim.g.startify_files_number = 10
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
    local footer2 = {
      "定风波·莫听穿林打叶声",
      "--苏东坡",
      "",
      "",
      "莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
      "料峭春风吹酒醒，微冷，山头斜照却相迎。回首向来萧瑟处，归去，也无风雨也无晴。",
    }
    local flag = {
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⢤⣀⠀⠀⠀⠀⠀⠀                                                                                                      ",
      "⠀⠀⠀⠀⠀⠀⠀⢀⣠⣀⣠⡄⠀⠹⣷⣄⠀⠀⠀⠀                                                  定风波·莫听穿林打叶声                               ",
      "⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⠟⠀⠀⠹⣿⣷⡀⠀⠀                                                                --苏东坡                              ",
      "⠀⠀⠀⠀⠰⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⢿⣿⣧⠀⠀                                                                                                      ",
      "⠀⠀⠀⠀⠀⠘⠿⠋⠻⣿⣿⣷⡀⠀⠀⢸⣿⣿⠀⠀                                                                                                      ",
      "⠀⠀⠀⣠⡄⠀⠀⠀⠀⠙⣿⣿⣿⣄⠀⣾⣿⣿⠀⠀                                            莫听穿林打叶声，何妨吟啸且徐行。                          ",
      "⠀⠀⠀⢿⣿⣦⡀⠀⠀⠀⠈⢿⣿⣿⣾⣿⣿⡏⠀⠀                                            竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。                    ",
      "⠀⠀⣰⣾⣿⣿⣿⣶⣤⣤⣄⣤⣿⣿⣿⣿⡟⠀⠀⠀                                            料峭春风吹酒醒，微冷，山头斜照却相迎。                    ",
      "⠀⠀⠘⠛⠃⠈⠛⠿⣿⣿⣿⣿⣿⠿⣿⣿⣿⠄⠀⠀                                            回首向来萧瑟处，归去，也无风雨也无晴。                    ",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠈⠋⠁⠀⠀⠀                                                                                                      ",
    }
    vim.g.startify_custom_footer = vim.fn["startify#center"](footer)
  end,
}

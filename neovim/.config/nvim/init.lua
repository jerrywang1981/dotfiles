--[[

       _                       __          __
      | |                      \ \        / /
      | | ___ _ __ _ __ _   _   \ \  /\  / /_ _ _ __   __ _
  _   | |/ _ \ |__| |__| | | |   \ \/  \/ / _| | |_ \ / _` |
 | |__| |  __/ |  | |  | |_| |    \  /\  / (_| | | | | (_| |
  \____/ \___|_|  |_|   \__| |     \/  \/ \__|_|_| |_|\__| |
                         __/ |                         __/ | * @jerrywang1981 github  ',
                        |___/                         |___/  * https://jerrywang1981.github.io  ',
                                                             * wangjianjun@gmail.com ',

--]]

local vim = vim
local uv = vim.loop

vim.lsp.set_log_level(0)

vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.api.nvim_set_keymap("", [[\]], [[,]], { noremap = true, silent = true })

local config_dir = vim.fn.stdpath("config")

--[[
local scan_dir = function(folder)
	local files = {}
	local data, err = uv.fs_scandir(folder)
	if err then
		return files
	end
	local name, type = uv.fs_scandir_next(data)
	while name do
		if type == "file" and string.match(name, "^.+(%..+)$") == ".vim" then
			table.insert(files, name)
		end
		name, type = uv.fs_scandir_next(data)
	end
	table.sort(files)
	return files
end

local files = scan_dir(config_dir)
table.foreach(files, function(_, v)
	vim.cmd(string.format("source %s/%s", config_dir, v))
end)
--]]

vim.cmd(string.format("source %s/%s", config_dir, "start.vim"))

require("option")
require("keymapping")
require("plugins")
require("autocmd")

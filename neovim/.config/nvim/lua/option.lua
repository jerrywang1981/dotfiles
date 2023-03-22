local opt = require("utils").opt
-- local vim = vim
-- https://oroques.dev/notes/neovim-init/
-- local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

--[[ local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end
--]]
--[[
--global options
--]]
opt("o", "updatetime", 500)
opt("o", "showtabline", 2)
-- opt('o', 'laststatus',  3)
opt("o", "showmatch", true)
opt("o", "showmode", false)
opt("o", "mouse", "a")
opt("o", "selection", "exclusive")
opt("o", "ignorecase", true)
opt("o", "incsearch", true)
opt("o", "hlsearch", true)
opt("o", "history", 2000)
opt("o", "visualbell", true)
opt("o", "hidden", true)
opt("o", "backup", false)
opt("o", "writebackup", true)
opt("o", "termguicolors", true)
opt("o", "encoding", "utf-8")
opt("o", "scrolloff", 5)

--[[
--window options
--]]
opt("w", "relativenumber", true)
opt("w", "number", true)
opt("w", "wrap", false)
opt("w", "foldmethod", "indent")
opt("w", "foldlevel", 99)
opt("w", "cursorline", true)
opt("w", "cursorcolumn", true)
opt("w", "signcolumn", "yes")
opt("w", "colorcolumn", "80")

--[[
--buffer options
--]]

opt("b", "swapfile", false)
opt("b", "autoindent", true)
opt("b", "cindent", true)

opt("b", "tabstop", 2)
opt("b", "softtabstop", 2)
opt("b", "shiftwidth", 2)
opt("b", "expandtab", true)

opt("b", "fileformat", "unix")
opt("b", "fileencoding", "utf-8")
opt("b", "autoread", true)
opt("b", "fixendofline", true)

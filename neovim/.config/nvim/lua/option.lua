local vim = vim

vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.selection = 'exclusive'
vim.o.encoding = 'utf-8'

vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.timeout = true
vim.o.termguicolors = true
vim.o.showmatch = true
vim.o.incsearch = true
vim.o.visualbell = true
vim.o.hidden = true
vim.o.writebackup = true
vim.o.showmode = false
vim.o.backup = false

vim.o.showtabline = 2
vim.o.scrolloff = 5
vim.o.updatetime = 500
vim.o.timeoutlen = 1000
vim.o.history = 2000

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.wo.cursorcolumn = true
vim.wo.wrap = true

vim.wo.signcolumn = 'yes'
vim.wo.foldmethod = 'indent'
vim.wo.colorcolumn = '80'

vim.wo.foldlevel = 99

vim.bo.swapfile = false
vim.bo.autoindent = true
vim.bo.cindent = true
vim.bo.expandtab = true
vim.bo.autoread = true
vim.bo.fixendofline = true

vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2

vim.bo.fileformat = 'unix'
vim.bo.fileencoding = 'utf-8'

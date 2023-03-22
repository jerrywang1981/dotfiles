local vim = vim
vim.cmd [[ autocmd! TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500} ]]
vim.cmd([[ autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR> ]])
vim.cmd([[ autocmd BufWritePre * %s/\s\+$//e ]])
vim.cmd([[ autocmd! VimLeave * lua os.remove(vim.lsp.get_log_path()) ]])

local vim = vim
-- vim.cmd [[ autocmd! TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500} ]]
vim.cmd([[ autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR> ]])
vim.cmd([[ autocmd BufWritePre * %s/\s\+$//e ]])
vim.cmd([[ autocmd! VimLeave * lua os.remove(vim.lsp.get_log_path()) ]])

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({higroup="IncSearch", timeout=500})
  end,
  group = highlight_group,
  pattern = '*',
})

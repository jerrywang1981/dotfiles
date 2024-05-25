autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" autocmd BufWritePre * %s/\s\+$//e
autocmd! VimLeave * lua os.remove(vim.lsp.get_log_path())
autocmd! TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}

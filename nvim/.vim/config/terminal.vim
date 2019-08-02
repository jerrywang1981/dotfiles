if !has('nvim')
    set ttymouse=xterm2
endif

tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

if has('nvim')
  set inccommand=nosplit
  " tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'
  tnoremap <expr> ® '<C-\><C-N>"'.nr2char(getchar()).'pi'
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif
"
" option key + 4
nnoremap <silent> ¢ :vertical botright Ttoggle<cr><C-w>l
nnoremap <silent> <leader><leader>4 :vertical botright Ttoggle<cr><C-w>l

" tnoremap <silent> <leader>o <C-\><C-n>:Ttoggle<cr>
" tnoremap <silent> <leader><space> <C-\><C-n>:Ttoggle<cr>
tnoremap <silent> ¢ <C-\><C-n>:Ttoggle<cr>

nnoremap <silent> <c-s>l :TREPLSendLine<CR>
vnoremap <silent> <c-s>s :TREPLSendSelection<CR>

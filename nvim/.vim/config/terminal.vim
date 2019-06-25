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

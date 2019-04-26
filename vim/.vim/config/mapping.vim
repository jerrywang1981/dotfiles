nmap <Leader>ev :e $MYVIMRC<cr>
nmap <Leader>sv :so $MYVIMRC<cr>

map <up> <Nop>
map <down> <Nop>
map <left> <Nop>
map <right> <Nop>
imap <up> <Nop>
imap <down> <Nop>
imap <left> <Nop>
imap <right> <Nop>
inoremap <c-h> <Left>
inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-l> <Right>
vmap <up> <Nop>
vmap <down> <Nop>
vmap <left> <Nop>
vmap <right> <Nop>

nmap go o<esc>k
nmap gO O<esc>j

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" option key + 1
" nmap <silent> ¡ :Lex<CR>
nmap <silent> ¡ :Defx<CR>
" option key + 4
" nmap ¢ :vert belowright sb zsh
" quickly toggle terminal
" nnoremap <silent> <leader>o :vertical botright Ttoggle<cr><C-w>l
" nnoremap <silent> <leader>O :horizontal rightbelow Ttoggle<cr><C-w>j
" nnoremap <silent> <leader><space> :vertical botright Ttoggle<cr><C-w>l
" option key + 4
nnoremap <silent> ¢ :vertical botright Ttoggle<cr><C-w>l
" option key + 0
nnoremap <silent> º :Goyo<cr>

" tnoremap <silent> <leader>o <C-\><C-n>:Ttoggle<cr>
" tnoremap <silent> <leader><space> <C-\><C-n>:Ttoggle<cr>
tnoremap <silent> ¢ <C-\><C-n>:Ttoggle<cr>

nnoremap <silent> <c-s>l :TREPLSendLine<CR>
vnoremap <silent> <c-s>s :TREPLSendSelection<CR>

" nmap <D-1> :NERDTreeToggle<CR>

" vim-workspace
" nnoremap <leader>s :ToggleWorkspace<CR>

" leaderF mapping
noremap <c-n> :Leaderf --nameOnly mru<cr>
" option key + f
noremap ƒ :LeaderfFunction!<cr>
" option key + b
" noremap ∫ :Leaderf! --nameOnly buffer<cr>
" option key + t
noremap † :Leaderf --nameOnly tag<cr>
" noremap <Leader>c :Leaderf rg<cr>
" option key + s
noremap ß :Leaderf rg --stayOpen --recall<CR>


" airline mapping
" let g:airline_theme="molokai"
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
" let g:airline#extensions#tabline#show_tab_nr = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline_extensions#tabline#show_buffers = 1
" let g:airline#extensions#whitespace#enabled = 0
" let g:airline#extensions#whitespace#symbol = '!'

" if !exists('g:airline_symbols')
  " let g:airline_symbols = {}
" endif
"
" let g:airline_left_sep = '⮀'
" let g:airline_left_alt_sep = '⮁'
" let g:airline_right_sep = '⮂'
" let g:airline_right_alt_sep = '⮃'
" let g:airline_symbols.branch = '⭠'
" let g:airline_symbols.readonly = '⭤'
" let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
" let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" nmap <leader>1 <Plug>AirlineSelectTab1
" nmap <leader>2 <Plug>AirlineSelectTab2
" nmap <leader>3 <Plug>AirlineSelectTab3
" nmap <leader>4 <Plug>AirlineSelectTab4
" nmap <leader>5 <Plug>AirlineSelectTab5
" nmap <leader>6 <Plug>AirlineSelectTab6
" nmap <leader>7 <Plug>AirlineSelectTab7
" nmap <leader>8 <Plug>AirlineSelectTab8
" nmap <leader>9 <Plug>AirlineSelectTab9
" to switch buffer
nnoremap <C-tab> :bn<CR>
nnoremap <C-s-tab> :bp<CR>

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Ex command mapping
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>


noremap <Leader>n nzz
noremap <Leader>N Nzz

" write to the file
" noremap <Leader>w :w<cr>
"
" nnoremap <leader>r :REPLToggle<Cr>



" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)



function! s:config_fuzzyall(...) abort
  return extend(copy({
  \   'converters': [
  \     incsearch#config#fuzzy#converter(),
  \     incsearch#config#fuzzyspell#converter()
  \   ],
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))



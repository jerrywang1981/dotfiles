filetype plugin indent on   " enable loading indent file for filetype
syntax on                   " syntax highlighting

set path+=**
" set clipboard+=unnamedplus  " use the clipboards of vim and win
"set guioptions+=a               " Visual selection automatically copied to the clipboard
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
set backspace=indent,eol,start
" set omnifunc=syntaxcomplete#Complete
set selectmode=mouse,key
set whichwrap+=<,>,h,l
set diffopt+=vertical
set completeopt=menuone,noinsert,noselect,fuzzy
set shortmess+=c


silent !mkdir -p ~/.config/nvim/tmp/backup
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.

let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

if !has('gui_running')
  set t_Co=256
  set t_ut=
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/venv/*,*/node_modules/*

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" abbreviate

iab jw Jerry Wang <jerrywang1981@outlook.com>
iab jwc  .--- . .-. .-. -.--  .-- .- -. --.

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

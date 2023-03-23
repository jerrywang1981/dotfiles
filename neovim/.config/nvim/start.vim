filetype plugin indent on   " enable loading indent file for filetype
syntax on                   " syntax highlighting

set path+=**
" set clipboard+=unnamedplus  " use the clipboards of vim and win
set go+=a               " Visual selection automatically copied to the clipboard
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete
set selectmode=mouse,key
set whichwrap+=<,>,h,l
set diffopt+=vertical
set completeopt=menuone,noinsert,noselect
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

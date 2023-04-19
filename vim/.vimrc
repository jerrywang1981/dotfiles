"
"       _                       __          __
"      | |                      \ \        / /
"      | | ___ _ __ _ __ _   _   \ \  /\  / /_ _ _ __   __ _
"  _   | |/ _ \ |__| |__| | | |   \ \/  \/ / _| | |_ \ / _` |
" | |__| |  __/ |  | |  | |_| |    \  /\  / (_| | | | | (_| |
"  \____/ \___|_|  |_|   \__| |     \/  \/ \__|_|_| |_|\__| |
"                         __/ |                         __/ | * @jerrywang1981 github  ',
"                        |___/                         |___/  * https://jerrywang1981.github.io  ',
"                                                             * wangjianjun@gmail.com ',
"
"

let g:mapleader = ","
let g:maplocalleader = ","

packadd! matchit

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug
let g:plug_timeout=240
let g:plug_threads=8

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'wellle/targets.vim'
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-rooter'

Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'

Plug 'elzr/vim-json', { 'for': 'json'  }
Plug 'honza/dockerfile.vim', { 'for': 'Dockerfile' }

Plug 'preservim/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim', { 'on': 'GV' }
"Plug 'kassio/neoterm', { 'on': 'Ttoggle' }
Plug 'voldikss/vim-floaterm'
Plug 'mbbill/undotree'
Plug 'junegunn/goyo.vim'
" Track the engine.
Plug 'SirVer/ultisnips'
"
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'"

Plug 'neoclide/coc.nvim', {'branch': 'release'}


"Plug 'vimwiki/vimwiki'
" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

filetype plugin indent on   " enable loading indent file for filetype
syntax on                   " syntax highlighting

set path+=**
set clipboard+=unnamedplus  " use the clipboards of vim and win
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
set shortmess+=cF
set showcmd
set belloff=all
set complete-=i
set display=lastline
set nofsync
set history=10000
set nojoinspaces
set sidescroll=1
set smarttab
set nostartofline
set tabpagemax=50
set sessionoptions+=unix,slash
set sessionoptions-=options
set viminfo+=!
set mouse=a
set wildmenu
set selection=exclusive
set encoding=utf-8

set hlsearch
set ignorecase
set smartcase
set timeout
set termguicolors
set showmatch
set incsearch
set visualbell
set hidden
set writebackup
set noshowmode
set nobackup

set showtabline=2
set scrolloff=5
set updatetime=500
set timeoutlen=1000
set history=2000
set splitright

set number
set relativenumber
set cursorline
set cursorcolumn
set wrap

set signcolumn=yes
set foldmethod=indent
set colorcolumn=80

set foldlevel=99

set noswapfile
set autoindent
set cindent
set expandtab
set autoread
set fixendofline

set tabstop=2
set softtabstop=2
set shiftwidth=2

set fileformat=unix
set fileencoding=utf-8
set laststatus=2


"silent !mkdir -p ~/.config/nvim/tmp/backup
"set backupdir=~/.config/nvim/tmp/backup,.
"set directory=~/.config/nvim/tmp/backup,.

let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

if !has('gui_running')
  set t_Co=256
  set t_ut=
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/venv/*,*/node_modules/*

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

if has("persistent_undo")
   let target_path = expand('~/.undo_dir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

if has("wildignore") == 1 && has("popupwin") == 1
  set wildoptions=pum
endif

set background=dark
colorscheme PaperColor


tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'



"-------------------------key mappings---------------------------------

nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <c-l> :nohlsearch<cr>

noremap <up> <Nop>
noremap <down> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>
inoremap <up> <Nop>
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
inoremap <c-h> <left>
inoremap <c-l> <right>
noremap <c-left> :vert resize -5<cr>
noremap <c-right> :vert resize +5<cr>
noremap <c-up> :resize +5<cr>
noremap <c-down> :resize -5<cr>
inoremap jk <esc>
inoremap kj <esc>

nnoremap Y y$
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
xnoremap * y/\V<C-R>"<CR>
xnoremap # y?\V<C-R>"<CR>
nnoremap & :&&<CR>


" nerdtree
map <silent> <space>1 :NERDTreeToggle<cr>


" vim-fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'modified', 'jerry', 'filename' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers']  ],
      \   'right': [ ['close']  ]
      \ },
      \ 'component': {
      \   'jerry': ' Jerry Wang'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

" vim-startify

let g:startify_change_to_vcs_root=1
let g:startify_change_to_dir=0
let g:startify_files_number=5
let g:startify_enable_special=0
let g:startify_lists = [
      \ { 'type' : 'files', 'header' : [ "   MRU" ] },
      \ ]

let g:startify_custom_header =
      \ startify#center([
			\ '       _                       __          __                  ',
			\ '      | |                      \ \        / /                  ',
			\ '      | | ___ _ __ _ __ _   _   \ \  /\  / /_ _ _ __   __ _    ',
			\ '  _   | |/ _ \ |__| |__| | | |   \ \/  \/ / _| | |_ \ / _` |   ',
			\ ' | |__| |  __/ |  | |  | |_| |    \  /\  / (_| | | | | (_| |   ',
			\ '  \____/ \___|_|  |_|   \__| |     \/  \/ \__|_|_| |_|\__| |   ',
			\ '                         __/ |                         __/ | * @jerrywang1981 github  ',
			\ '                        |___/                         |___/  * https://jerrywang1981.github.io  ',
			\ '                                                             * jerrywang1981@outlook.com ',
      \ ])


let g:startify_custom_footer = startify#center([
			\ '春风杨柳万千条, 六亿神州尽舜尧',
			\ '红雨随心翻作浪, 青山着意化为桥',
			\ '天连五岭银锄落, 地动三河铁臂摇',
			\ '借问瘟君欲何往, 纸船明烛照天烧',
			\ '                               七律二首 送瘟神',
      \ ])


" lightline-bufferline
let g:lightline#bufferline#show_number = 3
let g:lightline#bufferline#ordinal_number_map = {
      \ 0: '₀', 1: '₁', 2: '₂', 3: '₃', 4: '₄',
      \ 5: '₅', 6: '₆', 7: '₇', 8: '₈', 9: '₉' }
let g:lightline#bufferline#enable_devicons = 1

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" vim-highlightedyank
let g:highlightedyank_highlight_duration = 500

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
au FileType gitcommit let b:EditorConfig_disable = 1

" emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" vim-rooter
let g:rooter_silent_chdir = 1

" nerdcommenter
let g:NERDCreateDefaultMappings = 0

map gcc <plug>NERDCommenterToggle

" fzf

function <SID>CtrlP()
  let l:j1 = system("git -C " . getcwd() . " rev-parse --is-inside-work-tree")
  let l:j2 = system("git -C " . getcwd() . " rev-parse --is-bare-repository")
  if l:j1 !~ "true" && l:j2 !~ "true"
    :Files
  else
    :GFiles
  endif
endfunction


nnoremap <silent> <C-p> :call <SID>CtrlP()<CR>
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fh :History<CR>
nnoremap <silent> <leader>fs :Rg<CR>
nnoremap <silent> <leader>fS :Rg <c-r><c-w><CR>

let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_preview_window = []
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true  }  }

" neoterm
" let g:neoterm_default_mod = 'belowright'
" nnoremap <silent> <space>4 :<c-u>Ttoggle<cr><C-w>j

" vim-floaterm
let g:floaterm_wintype = 'vsplit'
let g:floaterm_keymap_new = "<leader>fc"
let g:floaterm_keymap_prev = "<leader>fp"
let g:floaterm_keymap_next = "<leader>fn"
let g:floaterm_keymap_toggle = "<leader>ft"
let g:floaterm_wintype = "vsplit"

nnoremap <silent> <leader>sl :FloatermSend<cr>
vnoremap <silent> <leader>sl :FloatermSend<cr>

" vimwiki
"let g:vimwiki_list = [{'path': '~/.vim/vimwiki/',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]
"let g:vimwiki_global_ext = 0


"undotree
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
nnoremap <silent> <space>7 :<c-u>UndotreeToggle<cr>


"autopairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutToggle=''
let g:AutoPairsShortcutFastWrap=''
let g:AutoPairsShortcutJump=''
let g:AutoPairsMapCh=''
let g:AutoPairsShortcutBackInsert=''

"ultisnip
let g:UltiSnipsEditSplit="vertical"


" coc


" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> <c-]> <Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <space>a  <Plug>(coc-codeaction-selected)
nmap <space>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
"nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
"nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
"nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
"nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
"xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
"nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
"nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>ce  :<C-u>CocList extensions<cr>
" Show commands
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

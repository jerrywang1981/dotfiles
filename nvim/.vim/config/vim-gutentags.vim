" -------------- gtags ----------

let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/Users/jerry/.globalrc'
let g:gutentags_define_advanced_commands = 1
set tags=./.tags;,.tags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_modules = []
if executable('ctags')
  let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
  let g:gutentags_modules += ['gtags_cscope']
endif
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
" let g:gutentags_exclude_project_root = ['node_modules']
"
" let g:gutentags_exclude_filetypes = ['javascript']
let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_plus_switch = 1
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
"
let g:gutentags_plus_nomap = 1
noremap <silent> \gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> \gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> \gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> \gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> \ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> \gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> \gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> \gd :GscopeFind d <C-R><C-W><cr>
noremap <silent> \ga :GscopeFind a <C-R><C-W><cr>

" noremap <silent> \gs :GscopeFind s <C-R><C-W><cr>
" noremap <silent> \gd :GscopeFind g <C-R><C-W><cr>
" noremap <silent> \gr :GscopeFind c <C-R><C-W><cr>


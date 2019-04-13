filetype plugin indent on   " enable loading indent file for filetype
runtime macros/matchit.vim
syntax on                   " syntax highlighting
let g:solarized_termcolors=256
let mapleader=','
noremap \ ,
let maplocalleader=','

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'tomtom/tlib_vim'
Plug 'davidhalter/jedi-vim'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'thaerkh/vim-workspace'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'
" Plug 'vim-scripts/winmanager'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-projectionist'
Plug 'isRuslan/vim-es6'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" Plug 'suan/vim-instant-markdown'
Plug 'mxw/vim-jsx'
" Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-syntastic/syntastic'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'ianks/vim-tsx'
Plug 'tpope/vim-git'
Plug 'sjl/gundo.vim'
Plug 'fs111/pydoc.vim'
Plug 'alfredodeza/pytest.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'mattn/emmet-vim'
Plug 'honza/vim-snippets'
Plug 'elzr/vim-json'
Plug 'othree/html5.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'ap/vim-css-color'
Plug 'cakebaker/scss-syntax.vim'
Plug 'jmcantrell/vim-virtualenv'
Plug 'wellle/targets.vim'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'editorconfig/editorconfig-vim'
Plug 'posva/vim-vue'
" Plug 'tyru/caw.vim'
" Plug 'Shougo/context_filetype.vim'
" Plug 'digitaltoad/vim-pug'
Plug 'skywind3000/asyncrun.vim'
Plug 'kassio/neoterm'
Plug 'lifepillar/vim-solarized8'
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'morhetz/gruvbox'
" Plug 'tomasr/molokai'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
call plug#end()



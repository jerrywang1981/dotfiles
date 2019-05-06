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
Plug 'tomtom/tlib_vim'
Plug 'davidhalter/jedi-vim'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'thaerkh/vim-workspace'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdcommenter'
" Plug 'MattesGroeger/vim-bookmarks'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-projectionist'
Plug 'isRuslan/vim-es6'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'mxw/vim-jsx'
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
Plug 'skywind3000/asyncrun.vim'
Plug 'kassio/neoterm'
Plug 'lifepillar/vim-solarized8'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'machakann/vim-highlightedyank'
Plug 'vim-scripts/YankRing.vim'
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'andys8/vscode-jest-snippets'
Plug 'wincent/terminus'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'luochen1990/rainbow'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'fatih/vim-go'
Plug 'Valloric/ListToggle'
Plug 'neoclide/coc-imselect'
Plug 'majutsushi/tagbar'
Plug 'lambdalisue/suda.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
call plug#end()



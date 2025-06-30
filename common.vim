"" General
filetype plugin indent on  " help :filetype-overview
syntax on
set nocompatible  " Vi Improved, not vi

" File related
set autoread
set autowrite
set belloff=all
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gb2313,gb18030,gbk,cp936,latin1
set fileformats=unix,dos
set nobackup
set noswapfile
set updatetime=250
set wildignore+=.git,node_modules,dist,.idea,*.pyc,.pytest_cache,__pycache__,.coverage

" Read related
set completeopt=menu,menuone,noselect
set hidden
set hlsearch
set incsearch
set laststatus=2
set number
set scrolloff=6
set wildmenu
set wrap

" Write related
set autoindent
set backspace=2
set clipboard=unnamedplus  " Use system clipboard
set expandtab
set matchtime=2
set showmatch
set smartindent
set smarttab


" enable vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
if has("win32")
  set rtp+=~/vimfiles/vundle
  call vundle#begin('~/vimfiles/modules')
else
  set rtp+=~/.vim/vundle
  call vundle#begin('~/.vim/modules')
endif

" plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'elzr/vim-json'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'mattn/emmet-vim'
Plugin 'powerline/powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/dbext.vim'
Plugin 'wakatime/vim-wakatime'

call vundle#end()

" FileType On
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
syntax on

" Load powerline plugin
set encoding=utf-8
set laststatus=2
if has("unix")
  set t_Co=256
  set rtp+=~/.vim/modules/powerline/powerline/bindings/vim
elseif has("win32")
  set langmenu=en_US
  let $LANG='en_US'
  set rtp+=~\vimfiles\modules\powerline\powerline\bindings\vim
  if has("gui_win32") || has("gui_win32s")
    set guifont=Fira\ Code\ Retina:h10
    set guioptions-=m
    set guioptions-=T
    set renderoptions=type:directx
  endif
endif

"Set desert as default color scheme
set background=light
colorscheme desert

" Autocmd to markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Some text settings
set nu
set sw=4
set ts=4
set expandtab
set hlsearch
set incsearch
set wildmenu
set smartindent

" Match parentheses, 1matchtime = 1/10s
set showmatch
set matchtime=5

" No backup and swap file
set nobackup
set noswapfile

" Some editing settings
set backspace=2

" Disable annoying bell
set noeb vb t_vb=
autocmd GUIEnter * set vb t_vb=

" Set shift width to 2
au FileType sh,html,vim,javascript setl shiftwidth=2
au FileType sh,html,vim,javascript setl tabstop=2

" Mappings
let mapleader="\<Space>"
map <Leader>/   <Esc>*:vimgrep /<C-R>// **/*<CR>
nmap <Leader>a  :w!<CR>:!python %<CR>
nmap <Leader>e  :NERDTreeToggle<CR>
nmap <Leader>d  :w!<CR>:bd<CR>
nmap <Leader>r  :! bash %<CR>
nmap <Leader>sp :set paste!<CR>
nmap <Leader>u :set ff=unix<CR>
nmap <Leader>v  :tabedit $MYVIMRC<CR>
nmap <F5>       :source $MYVIMRC<CR>
nmap <Leader>w  :w !sudo tee %<CR>
vmap <Leader>r  :w !sh<CR>

noremap p "*p
noremap y "*y
noremap yy "*yy
nmap <A-h> :tabprevious<CR>
nmap <A-l> :tabnext<CR>
nmap <A-k> :bprevious<CR>
nmap <A-j> :bnext<CR>
vmap <C-/> :Commentary<CR>

" Mappings inspired by @sheerun
nnoremap <CR> G
nnoremap <BS> gg

" Mappings for Tabular
vmap <Leader>= :Tab /=<CR>
vmap <Leader>T :Tab /=><CR>

" Mappings for vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" Dbext settings
let g:dbext_default_SQLITE_bin = 'sqlite3'
let g:dbext_default_profile_sqlite = 'type=SQLITE:dbname=~/sqlite.db'
" #--dbext:profile=sqlite
let g:dbext_default_MYSQL_bin = 'mysql'
let g:dbext_default_profile_mysql= 'type=MYSQL:user=lirian:dbname=db'
" #--dbext:profile=mysql

" csv.vim
let b:csv_headerline=0
let g:csv_delim='|'
hi CSVColumnEven ctermbg=0
hi CSVColumnOdd  ctermbg=0

" emmet settings
let g:user_emmet_install_global = 0
let g:powerline_no_python_error = 1
autocmd FileType html,css EmmetInstall

" add trailing space to line up to 150 length
" :%s/$/\=repeat(" ", 150-virtcol("$"))

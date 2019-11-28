""" Section I. Preparation
"" Plugins

set rtp+=~/.vim/vundle,~/.fzf

call vundle#begin('~/.vim/modules')
Plugin 'VundleVim/Vundle.vim'

Plugin 'elzr/vim-json'
Plugin 'ervandew/supertab'
Plugin 'junegunn/fzf.vim'
Plugin 'mattn/emmet-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/dbext.vim'
Plugin 'wakatime/vim-wakatime'
Plugin 'whatyouhide/vim-gotham'

call vundle#end()

"" General
filetype plugin indent on  " help :filetype-overview
syntax on
set nocompatible  " Vi Improved, not vi

" File related
set encoding=utf-8
set nobackup
set noswapfile
set belloff=all

" Read related
set hlsearch
set incsearch
set number
set wildmenu
set laststatus=2

" Write related
set autoindent
set backspace=2
set clipboard=unnamed  " Use system clipboard
set expandtab
set matchtime=2
set showmatch
set smartindent
set smarttab


""" Section II. Appearance
" AirlineTheme gotham256
colorscheme gotham256

if has("unix")
  set t_Co=256
endif

if has("win32")
  let $LANG='en_US'
endif

if has("gui_win32")
  set guifont=Fira\ Code\ Retina:h10
  set guioptions=
  set langmenu=en_US
  set shell=~/.lki/scripts/cmdsh.bat
  set shellcmdflag=/c
  autocmd GUIEnter * simalt ~x  " Maximize Screen When Start
endif

if has("win32unix")
  set termguicolors
  let g:airline_powerline_fonts=0
else
  let g:airline_powerline_fonts=1
endif


""" Section III. Keymap

let mapleader="\<Space>"
map <Leader>/   <Esc>*:vimgrep /<C-R>// **/*<CR>

nmap <A-1>     :NERDTreeToggle<CR>
nmap <A-F12> :call ToggleTerminal()<CR>
nmap <A-h> :tabprevious<CR>
nmap <A-j> :bnext<CR>
nmap <A-k> :bprevious<CR>
nmap <A-l> :tabnext<CR>
nmap <A-r> :AsyncRun<Space>
nmap <A-s> :set<Space>
nmap <A-w> :bdelete<CR>
nmap <F5>       :source $MYVIMRC<CR>
nmap <Leader>sp :set paste!<CR>
nmap <Leader>u  :set ff=unix<CR>:w<CR>
nmap <Leader>v  :tabedit $MYVIMRC<CR>
nmap gd    :call GoInto()<CR>
tmap <A-F12> <C-W>:call ToggleTerminal()<CR>
tmap <A-w> :bdelete<CR>
vmap <Leader>s  :sort<CR>
vmap V <Plug>(expand_region_shrink)
vmap v <Plug>(expand_region_expand)


""" Section IV. Plugins

let NERDTreeMinimalUI = 1
let b:csv_headerline=0
let g:airline#extensions#tabline#enabled=1
let g:asyncrun_open = 20
let g:csv_delim='|'
let g:dbext_default_MYSQL_bin = 'mysql'
let g:dbext_default_SQLITE_bin = 'sqlite3'
let g:dbext_default_profile_mysql= 'type=MYSQL:user=lirian:dbname=db'
let g:dbext_default_profile_sqlite = 'type=SQLITE:dbname=~/sqlite.db'
let g:user_emmet_install_global = 0


""" Section V. Filetypes
autocmd BufNewFile,BufRead *.md setl filetype=markdown
autocmd FileType html,css,js,tsx EmmetInstall
autocmd FileType sh,html,vim,javascript setl shiftwidth=2 tabstop=2


""" Section X. Functions

func! ToggleTerminal()  " inspired by pakutoma/toggle-terminal
  let terminalBuffer = get(filter(range(1, bufnr("$")), "getbufvar(v:val, '&buftype') == 'terminal'"), 0, -1)
  if terminalBuffer == -1 || bufloaded(terminalBuffer) != 1
    execute "belowright term ++close ++kill=term"
  else
    let terminalWindow = bufwinnr(terminalBuffer)
    if terminalWindow == -1
      execute "belowright sbuffer ".terminalBuffer
    else
      execute terminalWindow." wincmd w"
      hide
    endif
  endif
endfunc

func! GoInto()
  if exists("b:NERDTree")
    normal cdCD
  else
    normal <C-]>
  endif
endfunc


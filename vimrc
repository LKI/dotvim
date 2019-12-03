""" Section I. Preparation
"" Plugins

set rtp+=~/.vim/vundle

call vundle#begin('~/.vim/modules')
Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'elzr/vim-json'
Plugin 'ervandew/supertab'
Plugin 'mattn/emmet-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/dbext.vim'
Plugin 'wakatime/vim-wakatime'
Plugin 'whatyouhide/vim-gotham'
Plugin 'xuyuanp/nerdtree-git-plugin'

call vundle#end()

"" General
filetype plugin indent on  " help :filetype-overview
syntax on
set nocompatible  " Vi Improved, not vi

" File related
set belloff=all
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gb2313,gb18030,gbk,cp936,latin1
set nobackup
set noswapfile
set termencoding=utf-8
set wildignore+=*/.git,*/.git/*,*/node_modules,node_modules/*,*/dist,*/dist/*,*.pyc
set updatetime=250

" Read related
set hlsearch
set incsearch
set number
set relativenumber
set wildmenu
set laststatus=2

" Write related
set autoindent
set backspace=2
set clipboard=unnamed  " Use system clipboard
set expandtab
set matchtime=2
set shiftwidth=4
set showmatch
set smartindent
set smarttab
set tabstop=4


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
  set autowrite
  set guifont=Fira_Code_Retina:h10
  set guioptions=c
  set langmenu=en_US
  set shell=~/.lki/scripts/cmdsh.bat
  set shellcmdflag=/c
  autocmd GUIEnter * set lines=39 columns=128
  if eval("@%") == ""
    cd ~/.lki
    autocmd VimEnter * edit $MYVIMRC
  endif

  nnoremap <silent> <A-F12> :call ToggleTerminal()<CR>
  tnoremap <silent> <A-F12> <C-W>:call ToggleTerminal()<CR>
endif

if has("win32unix")
  set termguicolors
endif


""" Section III. Keymap

let mapleader="\<Space>"
nnoremap <A-r> :AsyncRun<Space>
nnoremap <A-s> :set<Space>
nnoremap <silent> <A-!> :NERDTreeToggle $CODE<CR>
nnoremap <silent> <A-1> :NERDTreeToggle<CR>
nnoremap <silent> <A-h> :tabprevious<CR>
nnoremap <silent> <A-j> :bnext<CR>
nnoremap <silent> <A-k> :bprevious<CR>
nnoremap <silent> <A-l> :tabnext<CR>
nnoremap <silent> <A-w> :bdelete<CR>
nnoremap <silent> <F5> :source $MYVIMRC<CR>
nnoremap <silent> <Leader>b  :Gblame<CR>
nnoremap <silent> <Leader>eh  :edit C:\Windows\System32\drivers\etc\hosts<CR>
nnoremap <silent> <Leader>ep  :edit ~/.profile<CR>
nnoremap <silent> <Leader>es  :edit ~/.ssh/config<CR>
nnoremap <silent> <Leader>ev  :edit $MYVIMRC<CR>
nnoremap <silent> <Leader>q  :wq<CR>
nnoremap <silent> <Leader>sp :set paste!<CR>
nnoremap <silent> <Leader>u  :set ff=unix<CR>:w<CR>
nnoremap <silent> <Leader>w  :w<CR>
nnoremap <silent> gd :call GoInto()<CR>
nnoremap <silent> j gj
nnoremap <silent> k gk
noremap <silent> <Leader>c :Commentary<CR>
noremap <silent> <Leader>l :=<CR>
tnoremap <silent> <A-j> <C-W>:bnext!<CR>
tnoremap <silent> <A-k> <C-W>:bprevious!<CR>
tnoremap <silent> <A-w> :bdelete<CR>
vnoremap <silent> <Leader>st  :sort<CR>
vnoremap <silent> V <Plug>(expand_region_shrink)
vnoremap <silent> v <Plug>(expand_region_expand)


""" Section IV. Plugins

" Plugin 'scrooloose/nerdtree'
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeChDirMode = 2
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeRemoveFileCmd = 'rm '
let NERDTreeRespectWildIgnore = 1
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeWinSize = 50
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let b:csv_headerline = 0
let g:csv_delim='|'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:asyncrun_open = 20

let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_map = '<C-n>'
let g:ctrlp_max_depth = 20
let g:ctrlp_max_files = 65535
let g:ctrlp_open_new_file = 't'
let g:ctrlp_show_hidden = 1

let g:dbext_default_MYSQL_bin = 'mysql'
let g:dbext_default_SQLITE_bin = 'sqlite3'
let g:dbext_default_profile_mysql= 'type=MYSQL:user=lirian:dbname=db'
let g:dbext_default_profile_sqlite = 'type=SQLITE:dbname=~/sqlite.db'

" Plugin 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css,js,tsx ++once EmmetInstall


""" Section V. Filetypes
autocmd BufNewFile,BufRead *vimrc ++once setl filetype=vim
autocmd BufNewFile,BufRead *.md ++once setl filetype=markdown
autocmd FileType sh,html,vim,javascript ++once setl shiftwidth=2 tabstop=2


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


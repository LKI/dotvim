" enable vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/vundle
set rtp+=~/.fzf
call vundle#begin('~/.vim/modules')

" plugins
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'elzr/vim-json'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'junegunn/fzf.vim'
Plugin 'mattn/emmet-vim'
Plugin 'plasticboy/vim-markdown'
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

" Load GUI options
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
    set shell=~/.lki/scripts/gitbash.bat
    set shellcmdflag=-c
    au GUIEnter * simalt ~x
  endif
endif

"Set desert as default color scheme
set background=light
colorscheme desert

" Autocmd to markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Some text settings
set nu
set expandtab
set hlsearch
set incsearch
set wildmenu
set smartindent

" Use system clipboard
set clipboard=unnamed

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
nmap <Leader>d  :w!<CR>:bd<CR>
nmap <Leader>r  :! bash %<CR>
nmap <Leader>sp :set paste!<CR>
nmap <Leader>u  :set ff=unix<CR>
nmap <Leader>v  :tabedit $MYVIMRC<CR>
nmap <F5>       :source $MYVIMRC<CR>
nmap <Leader>w  :w !sudo tee %<CR>
vmap <Leader>r  :w !sh<CR>
vmap <Leader>s  :sort<CR>

nmap <A-h> :tabprevious<CR>
nmap <A-j> :bnext<CR>
nmap <A-r> :AsyncRun<Space>
nmap <A-k> :bprevious<CR>
nmap <A-l> :tabnext<CR>
nmap <A-w> :bdelete<CR>
vmap <C-/> :Commentary<CR>

" Helper Windows
nmap <Leader>e :NERDTreeToggle<CR>
nmap <A-1>     :NERDTreeToggle<CR>

let g:asyncrun_open = 20
let NERDTreeMinimalUI = 1

" inspired by pakutoma/toggle-terminal
nmap <A-F12> :call ToggleTerminal()<CR>
tmap <A-F12> <C-W>:call ToggleTerminal()<CR>
func! ToggleTerminal()
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

nmap gd :call GoInto()<CR>
func! GoInto()
  if exists("b:NERDTree")
    normal cdCD
  else
    normal <C-]>
  endif
endfunc

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

" playgrounds
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

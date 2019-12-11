""" Section I. Preparation
"" Plugins

call plug#begin('~/.vim/modules')

Plug 'elzr/vim-json'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'skywind3000/asyncrun.vim'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'wakatime/vim-wakatime'
Plug 'whatyouhide/vim-gotham'
Plug 'xuyuanp/nerdtree-git-plugin'

call plug#end()

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
set hidden
set hlsearch
set incsearch
set laststatus=2
set number
set relativenumber
set wildmenu

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
  set termguicolors
endif

if has("win32")
  let $LANG='en_US'

  if has("gui_win32")
    set autowrite
    set guifont=Fira_Code_Retina:h10
    set guioptions=c
    set langmenu=en_US
    set renderoptions=type:directx
    autocmd GUIEnter * set lines=39 columns=128
    if eval("@%") == ""
      cd ~/.vim
      autocmd VimEnter * edit ~/.vim/vimrc
      autocmd VimEnter * set filetype=vim
    endif
    nnoremap <silent> <A-F12> :call ToggleTerminal()<CR>
    tnoremap <silent> <A-F12> <C-W>:call ToggleTerminal()<CR>
    nnoremap <silent> <C-N> :call LoadFZF()<CR>
    nnoremap <silent> <C-F> :call ToggleRg()<CR>
    tnoremap <silent> <C-F> <C-W>:call ToggleRg()<CR>
    tnoremap <silent> <S-F12> <C-W>N
    nnoremap <silent> <S-F12> i
  else
    set termguicolors
  endif
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
nnoremap <silent> <F5> :source ~/.vim/vimrc<CR>
nnoremap <silent> <Leader>b  :Gblame<CR>
nnoremap <silent> <Leader>eh  :edit C:\Windows\System32\drivers\etc\hosts<CR>
nnoremap <silent> <Leader>ep  :edit ~/.profile<CR>
nnoremap <silent> <Leader>es  :edit ~/.ssh/config<CR>
nnoremap <silent> <Leader>ev  :edit ~/.vim/vimrc<CR>
nnoremap <silent> <Leader>q  :wq<CR>
nnoremap <silent> <Leader>sp :set paste!<CR>
nnoremap <silent> <Leader>u  :set ff=unix<CR>:w<CR>
nnoremap <silent> <Leader>w  :w<CR>
nnoremap <silent> gd :call GoInto()<CR>
nnoremap <silent> j gj
nnoremap <silent> k gk
noremap <silent> <Leader>c :Commentary<CR>
noremap <silent> <Leader>l :=<CR>
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

" Plugin 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css,js,tsx ++once EmmetInstall


""" Section V. Autocmds
augroup setFileType
  autocmd!
  autocmd BufNewFile,BufRead *vimrc ++once setl filetype=vim
  autocmd BufNewFile,BufRead *.md ++once setl filetype=markdown
augroup END

augroup setIndent
  autocmd!
  autocmd FileType sh,html,vim,javascript ++once setl shiftwidth=2 tabstop=2
augroup END

augroup ignoreBuffer  " inspired by https://vi.stackexchange.com/questions/16708/
  autocmd!
  autocmd TerminalOpen * set nobuflisted
augroup END


""" Section X. Functions

func! ToggleTerminal()  " inspired by pakutoma/toggle-terminal
  " let terminalBuffer = get(filter(range(1, bufnr("$")), "getbufvar(v:val, '&buftype') == 'terminal'"), 0, -1)
  let terminalBuffer = get(filter(range(1, bufnr("$")), "bufname(v:val) == 'terminalBuffer'"), 0, -1)
  if terminalBuffer == -1 || bufloaded(terminalBuffer) != 1
    let [shell, shellcmdflag] = [&shell, &shellcmdflag]
    set shell=$CodeEnv/Git/usr/bin/bash.exe shellcmdflag="-l -i"
    execute "belowright term ++close ++kill=term ++type=conpty"
    let [&shell, &shellcmdflag] = [shell, shellcmdflag]
    file terminalBuffer
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

func! LoadFZF()
  let fzfBuffer = get(filter(range(1, bufnr("$")), "bufname(v:val) == 'fzfBuffer'"), 0, -1)
  if fzfBuffer == -1 || bufloaded(fzfBuffer) != 1
    execute "FZF"
    file fzfBuffer
  else
    let fzfWindow = bufwinnr(fzfBuffer)
    if fzfWindow == -1
      execute "belowright sbuffer ".fzfBuffer
    else
      execute fzfWindow." wincmd w"
      hide
    endif
  endif
endfunc

func! ToggleRg()
  let rgBuffer = get(filter(range(1, bufnr("$")), "bufname(v:val) == 'rgBuffer'"), 0, -1)
  if rgBuffer == -1 || bufloaded(rgBuffer) != 1
    execute "Rg"
    file rgBuffer
  else
    let rgWindow = bufwinnr(rgBuffer)
    if rgWindow == -1
      execute "belowright sbuffer ".rgBuffer
    else
      execute rgWindow." wincmd w"
      hide
    endif
  endif
endfunc


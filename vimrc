""" Section I. Preparation
"" Plugins

call plug#begin('~/.vim/modules')

" Basic
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Git
Plug 'rhysd/committia.vim'
Plug 'tpope/vim-fugitive'

" Display
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'whatyouhide/vim-gotham'

" Editor
Plug 'skywind3000/asyncrun.vim'
Plug 'wakatime/vim-wakatime'

" Jumpping
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'

" Language Servers
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" FileTypes
Plug 'sheerun/vim-polyglot'
Plug 'jaxbot/semantic-highlight.vim'
" -> TypeScript
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
" -> Golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" -> Markdown
" Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" -> Python
Plug 'psf/black', { 'for': 'python', 'branch': 'stable' }
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
Plug 'LKI/vim-pipenv', { 'for': 'python' }

" Others
" Plug 'github/copilot.vim'

call plug#end()

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
set termencoding=utf-8
set updatetime=250
set wildignore+=.git,node_modules,dist,.idea,*.pyc,.pytest_cache,__pycache__,.coverage

" Read related
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
set clipboard=unnamed  " Use system clipboard
set expandtab
set matchtime=2
set showmatch
set smartindent
set smarttab


""" Section II. Appearance
" AirlineTheme gotham256
if filereadable(expand('$HOME/.vim/modules/vim-gotham/colors/gotham.vim'))
  colorscheme gotham256
endif

if has('unix')
  set t_Co=256
endif

" GVim settings
if has('gui_running')
  set guifont=Fira\ Code:h12:w7
  set guioptions=c
  set langmenu=en_US
  autocmd GUIEnter * set lines=69 columns=250
endif

if has('win32')
  let $LANG='en_US'

  if has('gui_win32')
    set renderoptions=type:directx,renmode:0
    let g:netrw_gx='start'
    let g:netrw_browsex_viewer='start'
  else
    set termguicolors
  endif
endif


""" Section III. Keymap

let mapleader="\<Space>"

nnoremap <A-r> :AsyncRun<Space>
nnoremap <A-s> :set<Space>
nnoremap <F10> :Goyo<CR>
nnoremap <Leader>gco  :Git checkout -b<Space>
nnoremap <silent> <A-!> :NERDTreeToggle $CODE<CR>
nnoremap <silent> <A-1> :NERDTreeToggle<CR>
nnoremap <silent> <A-9> :call TogGitLog()<CR>
nnoremap <silent> <A-S-a> :Git blame --date=short<CR>
nnoremap <silent> <A-S-l> :call Reformat()<CR>
nnoremap <silent> <A-S-n> :cnext<CR>
nnoremap <silent> <A-S-p> :cprevious<CR>
nnoremap <silent> <A-f> :Ag<CR>
nnoremap <silent> <A-h> :tabprevious<CR>
nnoremap <silent> <A-j> :bprevious<CR>
nnoremap <silent> <A-k> :bnext<CR>
nnoremap <silent> <A-l> :tabnext<CR>
nnoremap <silent> <A-n> :FZF<CR>
nnoremap <silent> <A-o> :Files<CR>
nnoremap <silent> <A-w> :call BufferClose()<CR>
nnoremap <silent> <F5>  :call RunFile()<CR>
nnoremap <silent> <Leader>b  :Git blame<CR>
nnoremap <silent> <Leader>eg  :edit ~/.lki/.gitconfig<CR>
nnoremap <silent> <Leader>eh  :edit C:\Windows\System32\drivers\etc\hosts<CR>
nnoremap <silent> <Leader>ep  :edit ~/.lki/.profile<CR>
nnoremap <silent> <Leader>es  :edit ~/.ssh/config<CR>
nnoremap <silent> <Leader>ev  :edit ~/.vim/vimrc<CR>
nnoremap <silent> <Leader>gca  :Git commit -a<CR>
nnoremap <silent> <Leader>gcm  :Git commit -a --amend --no-edit<CR>
nnoremap <silent> <Leader>gf   :Git fetch o<CR>
nnoremap <silent> <Leader>gld  :Git load<CR>
nnoremap <silent> <Leader>glg  :silent Git log --all --graph --pretty=format:'%h - (%cr)%d %s <%an>' --abbrev-commit<CR>:setlocal filetype=gitlog<CR>
nnoremap <silent> <Leader>go   :call GoIntoUrl()<CR>
nnoremap <silent> <Leader>gpd  :Git pd<CR>
nnoremap <silent> <Leader>gpf  :Git push -f<CR>
nnoremap <silent> <Leader>gpl  :Git pull --rebase<CR>
nnoremap <silent> <Leader>gps  :Git push<CR>
nnoremap <silent> <Leader>grd  :Git rebase o/HEAD<CR>
nnoremap <silent> <Leader>gst  :w<CR>:Git<CR>
nnoremap <silent> <Leader>gsv  :w<CR>:AsyncRun git add . && git save<CR>
nnoremap <silent> <Leader>gwp  :Git commit --all --message 'WIP' --allow-empty --no-verify<CR>
nnoremap <silent> <Leader>kaf  :AsyncRun -raw kubectl apply -f %<CR>
nnoremap <silent> <Leader>n    :NERDTreeFind<CR>
nnoremap <silent> <Leader>q    :wq<CR>
nnoremap <silent> <Leader>sp   :set paste!<CR>
nnoremap <silent> <Leader>sv   :wincmd v<CR>:setl nobuflisted<CR>:bnext<CR>
nnoremap <silent> <Leader>u    :set ff=unix<CR>:w<CR>
nnoremap <silent> <Leader>v    :Pipenv<CR>
nnoremap <silent> <Leader>w    :w<CR>
nnoremap <silent> gd :call GoInto()<CR>
nnoremap <silent> j gj
nnoremap <silent> k gk
noremap <silent> <Leader>c :Commentary<CR>
noremap <silent> <Leader>l :=<CR>
tnoremap <silent> <A-w>      <C-W>:bdelete!<CR>
tnoremap <silent> <S-Insert> <C-W>"*
xnoremap <silent> <A-f> "zy:Ag<Space><C-r>z<CR>
xnoremap <silent> <Leader>r    "zy:AsyncRun -r <C-r>z<CR>
xnoremap <silent> <Leader>st  :sort<CR>

" Resize splits quickly by Alt+Shift+(-/=)
" ref: https://vim.fandom.com/wiki/Resize_splits_more_quickly
nnoremap <silent> <A-+>      :execute 'resize ' . (winheight(0) * 3/2)<CR>
nnoremap <silent> <A-_>      :execute 'resize ' . (winheight(0) * 2/3)<CR>
tnoremap <silent> <A-+> <C-W>:execute 'resize ' . (winheight(0) * 3/2)<CR>
tnoremap <silent> <A-_> <C-W>:execute 'resize ' . (winheight(0) * 2/3)<CR>


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
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

let b:csv_headerline = 0
let g:csv_delim='|'

" let g:fzf_layout = { 'down': '30%' }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
let g:fzf_preview_window = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:asyncrun_open = 10
let g:vim_markdown_new_list_item_indent = 2

let g:lsp_fold_enabled = 0
let g:lsp_settings = {
\   'pyls-all': {
\     'workspace_config': {
\       'pyls': {
\         'configurationSources': ['flake8']
\       }
\     }
\   },
\}

" Plugin 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key = '<C-Tab>'
autocmd FileType html,css,js,jsx,ts,tsx EmmetInstall

let g:goyo_width = '80%'
let g:goyo_height = '85%'

let g:wakatime_CLIPath=expand('$HOME/.wakatime/wakatime-cli')
if has('win32')
  for p in split($PATH, ';')
    if filereadable(p . '/black.exe')
      let g:black_virtualenv = fnamemodify(join(split(p, '\'), '/'), ':h')
      break
    endif
  endfor
endif

let g:black_fast = 1
let g:black_linelength = 120
let $PYTHONNUNBUFFERED=1

" Vim insert mode cursor
" https://github.com/microsoft/terminal/issues/68#issuecomment-418438517
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"


""" Section V. Autocmds
augroup setFileType
  autocmd!
  autocmd BufNewFile,BufRead *vimrc setl filetype=vim
  autocmd BufNewFile,BufRead *.md setl filetype=markdown
augroup END

augroup setIndent
  autocmd!
  autocmd FileType sh,html,vim,js,jsx,md,ts,tsx setl shiftwidth=2 tabstop=2
augroup END

augroup mapping
  autocmd!
  autocmd FileType gitcommit nnoremap <buffer> <silent> <A-w> :w<CR>:bdelete<CR>
  autocmd FileType fugitiveblame nnoremap <buffer> <silent> <A-S-a> :bdelete<CR>
augroup END

augroup ignoreBuffer  " inspired by https://vi.stackexchange.com/questions/16708/
  autocmd!
  autocmd FileType qf setl nobuflisted
augroup END

""" Section VI. Language Servers

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
nnoremap <silent> <A-0>  :LspDocumentDiagnostics<CR>
nnoremap <silent> <A-CR> :LspCodeAction<CR>
nnoremap <silent> <F1>   :LspHover<CR>
nnoremap <silent> <F2>   :LspNextError<CR>
nnoremap <silent> <F3>   :LspNextWarning<CR>
nnoremap <silent> <F7>   :LspReferences<CR>


""" Section X. Functions

func! TogableMap(key, name, ...)
  let cmd = a:name
  if len(a:000)
    let cmd = cmd.'", "'.join(a:000, '", "')
  endif
  execute 'nnoremap <silent> '.a:key.'      :call Togable("'.cmd.'")<CR>'
  execute 'tnoremap <silent> '.a:key.' <C-W>:call Togable("'.cmd.'")<CR>'
endfunc

func! Togable(name, ...)  " inspired by pakutoma/toggle-terminal
  let cmd = get(a:, 1, a:name)
  let pos = get(a:, 2, 'botright')
  let bufName = '<Togable> '.a:name
  let bufNum = get(filter(range(1, bufnr('$')), 'bufname(v:val) == "'.bufName.'"'), 0, -1)
  if bufNum == -1 || bufloaded(bufNum) != 1
    execute 'silent '.pos.' term ++close ++kill=term ++type=conpty '.cmd
    execute 'silent file '.bufName
    execute 'silent set nobuflisted'
  else
    let bufWinNum = bufwinnr(bufNum)
    if bufWinNum == -1
      execute 'silent '.pos.' sbuffer '.bufNum
    else
      execute 'silent '.bufWinNum.' wincmd w'
      hide
    endif
  endif
endfunc

func! TogGitLog()
  let bufName = '<Togable> git logg'
  let bufNum = get(filter(range(1, bufnr('$')), 'bufname(v:val) == "<Togable> git logg"'), 0, -1)
  if bufNum == -1 || bufloaded(bufNum) != 1
    execute 'silent G log --all --graph --pretty=format:"%h - (%cr)%d %s <%an>" --abbrev-commit'
    execute 'silent file '.bufName
    execute 'silent set nobuflisted'
    execute 'silent set filetype=gitlog'
  else
    let bufWinNum = bufwinnr(bufNum)
    if bufWinNum != -1
      execute 'silent '.bufWinNum.' wincmd w'
      execute 'silent bdelete'
    endif
  endif
endfunc

func! BufferClose()
  let buffer_count = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
  let window_count = winnr('$')
  if window_count == 1
    if buffer_count != 1
      execute 'bp|bd #'
    endif
  else
    if buffer_count > window_count
      execute 'bp|bd #'
    else
      execute 'bd'
    endif
  endif
endfunc

func! GoInto()
  if exists('b:NERDTree')
    normal cdCD
  else
    execute 'LspDefinition'
  endif
endfunc

func! GoIntoUrl()
  let line = getline('.')
  let url = matchstr(line, 'http[s]\?:\/\/[[:alnum:]%\/_#.-]*')
  if len(url)
    call job_start('explorer '.url)
    return
  endif
  let repo = matchstr(line, '[0-9a-zA-Z._-][0-9a-zA-z_/-]\+[0-9a-zA-Z._-]')
  if len(repo)
    let group = split(repo, '/')[0]
    if group == 'FE' || group == 'zaihui' || group == 'BE'
      call job_start('explorer https://pasta.zaihui.com.cn/'.repo.'/-/merge_requests/')
    else
      call job_start('explorer https://github.com/'.repo)
    endif
  endif
endfunc

func! Reformat()
  if &ft == 'python'
    execute 'Black'
  elseif mode() == 'v'
    execute 'LspDocumentRangeFormat'
  else
    execute 'LspDocumentFormat'
  endif
endfunc

func! GUISetup()
  set autowrite
  if eval('@%') == ''
    cd ~/.vim
  endif
  nnoremap <silent> <S-F12> i
  tnoremap <silent> <S-F12> <C-W>N
  call TogableMap('<A-t>', 'django shell', 'python manage.py shell')
  call TogableMap('<A-S-t>', 'ipython', 'ipython')
  call TogableMap('<A-$>', 'yarn', 'cmd /k "yarn start"')
  call TogableMap('<A-4>', 'django runserver', 'python manage.py runserver')
  call TogableMap('<A-F12>', 'gitbash', 'C:/Users/lirian/scoop/apps/git/current/bin/bash.exe -l -i')
endfunc

if !exists('*RunFile')
  func! RunFile()
    write
    if &ft == 'python'
      let $PYTHONPATH='.'
      execute 'AsyncRun -raw python %'
    elseif &ft == 'go'
      execute 'AsyncRun -raw go run %'
    elseif &ft == 'vim'
      execute 'source $MYVIMRC'
    endif
  endfunc
endif

if has('gui_running')
  call GUISetup()
endif


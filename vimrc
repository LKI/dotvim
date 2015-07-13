" Enable Pathogen
execute pathogen#infect('modules/{}')
syntax on
filetype plugin indent on

" Load powerline plugin
set laststatus=2
if has("unix")
    set runtimepath+=~/.vim/modules/powerline/powerline/bindings/vim
elseif has("win32")
    set runtimepath+=~\vimfiles\modules\powerline\powerline\bindings\vim
endif

" Set default vim setting
set sw=4
set ts=4
set expandtab
set hlsearch
set incsearch

" Mappings
map ,t   <Esc>:w!<CR>:!perl -d %<CR>
map ,/   <Esc>*:vimgrep /<C-R>// **/*<CR>
nmap ,a  :w!<CR>:!python %<CR>
nmap ,c  :w!<CR>:!perl -c %<CR>
nmap ,d  :w!<CR>:bd<CR>
nmap ,n  :w!<CR>:bn<CR>
nmap ,v  :tabedit ~/.vimrc<CR>
nmap ,w  :w !sudo tee %<CR>
vmap ,r  :w !sh<CR>


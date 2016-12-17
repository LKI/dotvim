[![Build Status](https://travis-ci.org/LKI/dotvim.svg)](https://travis-ci.org/LKI/dotvim)

Linux/Unix Installation
-----------------------
Run the following command to make the dotvim effective:

    git clone --recurse-submodules git://github.com/LKI/dotvim.git ~/.vim

Then you create a symbol link to the .vim/vimrc file:

    ln -s ~/.vim/vimrc ~/.vimrc

Windows Installation
--------------------
Run the following command to make the dotvim effective:

    git clone --recurse-submodules git://github.com/LKI/dotvim.git ~/vimfiles
    copy ~/vimfiles/vimrc ~/_vimrc

Pre-requires
------------
Powerline requires [python 2.6, 2.7 or 3.0 above][1] in your path

Ctags requires [ctags][2] in your path

I use [Inconsolata-font][3] for theme

Useful Shortcuts
----------------
* I use `<Space>` as my `<Leader>` key:

`<Leader>v` : Open vimrc


* [tpope/commentary][commentary] is convienient for comments:

`Vgc` : Comment out current line


* I use [tpope/fugitive][fugitive] Mainly for `:Gblame`


* [tpope/surround][surround] is useful for surroundings:

`cs(]`  : Change surrounding `()` to `[]`

`ysiw"` : Add `""` to the word under cursor


* [tpope/vim-unimpaired][unimpaired], Tim Pope do this all the time for us.

`]b` : Go to next buffer

`[q` : Go to previous vimgrep match


* [godlygeek/tabular][tabular] will do auto line up:

`:Tab /:`   : Line up text buffer divided by `:`

`<Leader>=` : Line up text buffer divided by `=`


* [terryma/vim-expand-region][expand_region] will make visual selection easier:

`vvvv` : Expand visual selection

`VVVV` : Shrink visual selection

* [mattn/emmet][emmet] is used for HTML editing

`div.button.primary#submit<C-Y>,` will create a button with class _button,primary_ and id _submit_.


For more details, you may read [my vimrc](/vimrc) and submodules under [module dir](/modules).

Others
------

My dotvim require python in system path.
If you're using gvim in windows, make sure python and vim are both 32bit or both 64bit.

If you're a beginner, just clone and use it for weeks.

Feel free to fork your own dotvim repository, make changes and send a pull request.

I'm considering to use [Vundle][vundle], let's make it rock!

Inspired by [schnell18/dotvim][dotvim_justin]


[1]:https://www.python.org/downloads/
[2]:http://ctags.sourceforge.net/
[3]:https://github.com/Lokaltog/powerline-fonts/blob/master/Inconsolata/Inconsolata%20for%20Powerline.otf?raw=true

[commentary]:    https://github.com/tpope/vim-commentary
[fugitive]:      https://github.com/tpope/vim-fugitive
[surround]:      https://github.com/tpope/vim-surround
[unimpaired]:    https://github.com/tpope/vim-unimpaired
[tabular]:       https://github.com/godlygeek/tabular
[expand_region]: https://github.com/terryma/vim-expand-region
[emmet]:         https://github.com/mattn/emmet-vim
[dotvim_justin]: https://github.com/schnell18/dotvim
[vundle]:        https://github.com/VundleVim/Vundle.vim

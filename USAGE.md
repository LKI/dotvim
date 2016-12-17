# Useful Shortcuts

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


For more details, you may read [my vimrc](/vimrc).


[commentary]:    https://github.com/tpope/vim-commentary
[fugitive]:      https://github.com/tpope/vim-fugitive
[surround]:      https://github.com/tpope/vim-surround
[unimpaired]:    https://github.com/tpope/vim-unimpaired
[tabular]:       https://github.com/godlygeek/tabular
[expand_region]: https://github.com/terryma/vim-expand-region
[emmet]:         https://github.com/mattn/emmet-vim

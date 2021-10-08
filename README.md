# Linux/Unix Installation

Run the following command to make the dotvim effective:

    curl -s https://raw.githubusercontent.com/LKI/dotvim/master/install.sh | sh


# Windows Installation

Run the following command to make the dotvim effective:

    git clone --recurse-submodules git://github.com/LKI/dotvim.git ~/vimfiles
    copy ~/vimfiles/vimrc ~/_vimrc
    vim +PlugInstall +qall

# Others

* pre-requires
    * powerline requires [python 2.6, 2.7 or 3.0 above][python] in your path
    * if you're using gvim, make sure python/vim are matched in bit version
    * I use [Fira Code][firacode] for displaying special characters
* how to start
    * if you're a beginner, just clone it, and make it rock
    * check [usage][usage] for some useful shortcuts
    * feel free to fork your own dotvim repository, make changes and send a pull request
* about this dotvim
    * it's for text/python/perl/sql editting
    * I'm using [Vim Plug][vim-plug] to manage plugins
    * inspired by [schnell18/dotvim][dotvim_justin]


[python]:        https://www.python.org/downloads/
[firacode]:      https://github.com/tonsky/FiraCode
[usage]:         /USAGE.md
[dotvim_justin]: https://github.com/schnell18/dotvim
[vim-plug]:      https://github.com/junegunn/vim-plug

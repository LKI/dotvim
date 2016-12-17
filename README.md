[![Build Status](https://travis-ci.org/LKI/dotvim.svg)](https://travis-ci.org/LKI/dotvim)

Linux/Unix Installation
-----------------------
Run the following command to make the dotvim effective:

    curl -s https://raw.githubusercontent.com/LKI/dotvim/master/install.sh | sh

Windows Installation
--------------------
Run the following command to make the dotvim effective:

    git clone --recurse-submodules git://github.com/LKI/dotvim.git ~/vimfiles
    copy ~/vimfiles/vimrc ~/_vimrc
    vim +PluginInstall +qall

Pre-requires
------------
Powerline requires [python 2.6, 2.7 or 3.0 above][1] in your path

Ctags requires [ctags][2] in your path

I use [Inconsolata-font][3] for theme

Others
------

* Check [usage][usage] for some shortcuts
* powerline requires python in system path.
** If you're using gvim in windows, make sure python and vim are both 32bit or both 64bit.
* If you're a beginner, just clone and use it for weeks.
* Feel free to fork your own dotvim repository, make changes and send a pull request.
* I'm using [Vundle][vundle], let's rock!

Inspired by [schnell18/dotvim][dotvim_justin]


[1]:https://www.python.org/downloads/
[2]:http://ctags.sourceforge.net/
[3]:https://github.com/Lokaltog/powerline-fonts/blob/master/Inconsolata/Inconsolata%20for%20Powerline.otf?raw=true

[usage]:         /USAGE.md
[dotvim_justin]: https://github.com/schnell18/dotvim
[vundle]:        https://github.com/VundleVim/Vundle.vim

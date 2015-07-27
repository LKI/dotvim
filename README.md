[![Build Status](https://travis-ci.org/LKI/dotvim.svg)](https://travis-ci.org/LKI/dotvim)

Pre-requires
------------
Powerline requires [python 2.6, 2.7 or 3.0 above][1] in your path

Ctags requires [ctags][2] in your path

I use [Inconsolata-font][3] for theme

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

Others
------

If you're a beginner, just clone and use it for weeks.

Feel free to fork your own dotvim repository, make changes and send a pull request.

Inspired by @schnell18 

[1]:https://www.python.org/downloads/
[2]:http://ctags.sourceforge.net/
[3]:https://github.com/Lokaltog/powerline-fonts/blob/master/Inconsolata/Inconsolata%20for%20Powerline.otf?raw=true

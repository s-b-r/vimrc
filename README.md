vimrc
=====

My vim config.


Basic Setup
-----------

You can just copy and paste this whole config or parts of it into your vimrc. Most of these plugins install automatically due to the plugin manager, one or two need a little extra setup.

If you use only one of the above plugins, make it Nerdtree. (Although the plugin manager, which installs itself automatically, will even make that one installation easier.)

If any plugin doesn't work or needs extra setup, you should comment it out.

Tips/Advice
-----------

-In my config, cntrl-n to toggle Nerdtree on/off.

-One of the fancy highlighter plugins lets you highlight all occurences of the word under your cursor, As follows: 

highlight variables: space-]

highlight a specific word: space-m

reset highlights: space-M

-If you're coding in C++, I recommend also using Ctags. In complex projects, it will let you jump from a function to it's definition, and vice versa.
To generate ctags, enter following at command line, without quotes:

" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . "

-Also, the extremely quick and powerful C++ syntax checker plugin, YouCompleteMe, requires it's own config file, called 

.ycm_extra_conf.py

which I included also in this repo since I changed it minimally. I usually keep it in my home directory, right next to the .vimrc


-I use the following regex command in vim to makie incrementing lists of things (xyz_1,xyz_2,...):

"  :let i=1 | g/abc/s//\='xyz_'.i/ | let i=i+1  "



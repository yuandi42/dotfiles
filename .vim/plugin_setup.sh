#!/usr/bin/sh
# auto setup my vim plug-in, hasn't tested anyway. WIP.

# set up for start plug-ins, i.e., plug-ins which are added everytime my vim
# starts.
mkdir -p '~/.vim/pack/default/start'
cd '~/.vim/pack/default/start'
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/preservim/nerdtree.git
git clone https://github.com/mhinz/vim-startify.git
git clone https://github.com/rhysd/vim-healthcheck.git
git clone https://github.com/ryanoasis/vim-devicons.git
git clone https://github.com/tiagofumo/vim-nerdtree-syntax-highlight.git

# rename the plug-in directories. since built-in plugin manager load plug-ins in
# alphabetical order, I can control the loading order by renaming them.
mv -R vim-devicons z-vim-devicons 
# mv -R blabla a-blabla

# generate helptags for those plug-ins
for p in '~/.vim/pack/default/start/*'
do
    (vim -u NONE -c "helptags $p/doc" -c q)
done

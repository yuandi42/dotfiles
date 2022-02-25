#!/usr/bin/sh
# auto setup my vim plug-in, haven't tested anyway.
mkdir -p '~/.vim/pack/default/start'
cd '~/.vim/pack/default/start'
git clone https://github.com/vim-airline/vim-airline.git
vim -u NONE -c "helptags ~/.vim/pack/default/start/vim-airline/doc" -c q
git clone https://github.com/preservim/nerdtree.git
vim -u NONE -c "helptags ~/.vim/pack/default/start/nerdtree/doc" -c q

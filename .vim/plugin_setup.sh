#!/usr/bin/sh
# auto setup my vim plug-in, haven't tested anyway.
mkdir -p '~/.vim/pack/default/start'
cd '~/.vim/pack/default/start'
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/preservim/nerdtree.git
git clone https://github.com/mhinz/vim-startify.git
git clone https://github.com/rhysd/vim-healthcheck.git
git clone https://github.com/ryanoasis/vim-devicons.git
git clone https://github.com/tiagofumo/vim-nerdtree-syntax-highlight.git

vim -u NONE -c "helptags ~/.vim/pack/default/start/vim-airline/doc" -c q
vim -u NONE -c "helptags ~/.vim/pack/default/start/nerdtree/doc" -c q

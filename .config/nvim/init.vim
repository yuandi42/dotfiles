"" Gernal setting
set nocompatible
set number relativenumber
set clipboard=unnamedplus
set encoding=utf-8
set mouse=a
set scrolloff=5

" eyecandies maybe
set background=dark
set showmatch
set showcmd
set wildmenu
syntax on

" search setting
set hlsearch
set incsearch
set ignorecase
set smartcase
set shortmess-=S

" buffer and split
set hidden
set splitbelow
set splitright

" indent setting
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4

" folding setting
set fdm=indent
set foldlevel=99

" filetype setting
filetype plugin on

" change cursor in different mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" set ture colors
if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" remap space as leader key
nnoremap <space> <Nop>
let mapleader=" "

" clear hlsearch
nnoremap <silent> <esc><esc> :noh<CR>

" use Enter in normal mode
nnoremap <silent> <CR> i<CR><Esc>

" save my wrists!
noremap <leader>u <c-u>
noremap <leader>d <c-d>
noremap <leader>o <c-o>
noremap <leader>i <c-i>

" keybindings for tabs
noremap <leader>w <c-w>

" keybindings for buffers
noremap <silent> <leader>bp :bp<CR>
noremap <silent> <leader>bn :bn<CR>
noremap <silent> <leader>bh :bf<CR>
noremap <silent> <leader>bl :bl<CR>
noremap <leader>bd :bd<CR>
noremap <leader>bD :bd!<CR>
noremap <leader>bb :ls<CR>:b<space>

source $HOME/.config/nvim/plugins.vim

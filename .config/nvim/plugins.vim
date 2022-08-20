"" Plugins setting
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
    " Interface
    Plug 'morhetz/gruvbox'
    Plug 'nvim-lualine/lualine.nvim'

    " nerdtree
    Plug 'preservim/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'for': 'nerdtree' }
    Plug 'PhilRunninger/nerdtree-visual-selection', { 'for': 'nerdtree' }

    " fzf
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'

    " markdown preview
    " Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

    " Help me typing
    Plug 'tpope/vim-commentary'
    Plug 'tommcdo/vim-lion'
    Plug 'tpope/vim-surround'
    Plug 'easymotion/vim-easymotion'
    Plug 'justinmk/vim-sneak'
    Plug 'tpope/vim-repeat'
    Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!', 'WhichKeyVisual'] }

    Plug 'voldikss/vim-floaterm'
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
    Plug 'zhimsel/vim-stay'
    Plug 'lilydjwg/fcitx.vim'

    " Also interface.
    Plug 'ryanoasis/vim-devicons'
call plug#end()

" vim-plugin
nnoremap <silent> <leader>pi :PlugInstall<CR>
nnoremap <silent> <leader>pu :PlugUpdate<CR>
nnoremap <silent> <leader>pd :PlugDiff<CR>
nnoremap <silent> <leader>pc :PlugClean<CR>

" gruvbox
let g:gruvbox_italic=1
let g:gruvbox_transparent_bg=1
colorscheme gruvbox

" NERDTree
let NERDTreeBookmarksFile = expand("$HOME/.config/nvim/NERDTreeBookmarks")
let NERDTreeShowHidden = 1
nnoremap <silent> <leader>ft :NERDTreeToggle<CR>
nnoremap <silent> <leader>fc :NERDTreeCWD<CR>
nnoremap <silent> <leader>fv :NERDTreeToggleVCS<CR>
nnoremap <leader>ff :NERDTreeFind<space>
nnoremap <leader>fm :NERDTreeFromBookmark<space>
" nerdtree-visual-selection
let g:nerdtree_vis_confirm_open = 0
let g:nerdtree_vis_confirm_copy = 0
let g:nerdtree_vis_confirm_move = 0

" which-key
set timeoutlen=500
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :WhichKeyVisual '<Space>'<CR>
let g:which_key_use_floating_win = 1
" source $HOME/.config/nvim/key-desc.vim "TODO

" fzf
noremap <leader>fz :Files<space>
noremap <leader>fr :Files<CR>
noremap <leader>fp :Files $HOME/.config/nvim<CR>
noremap <silent> <leader>hh :Helptags<CR>

" floaterm
noremap <silent> <c-t> :WhichKey '<Space>'<CR>t
noremap <silent> <leader>tt :FloatermToggle<CR>
noremap <silent> <leader>tn :FloatermNew<CR>
noremap <silent> <leader>tf :FloatermNew vifm<CR>
noremap <silent> <leader>tg :FloatermNew lazygit<CR>

" lualine
luado require('lualine').setup()
set noshowmode

" vim-hexokinase
let g:Hexokinase_highlighters = [ 'virtual' ]

" vim-stay
set viewoptions=cursor,folds,slash,unix

" fcitx.vim
let g:fcitx5_remote = "/usr/bin/fcitx5-remote"

" vim-easymotion
noremap <Leader>ef <Plug>(easymotion-f)
" nmap <Leader>ef <Plug>(easymotion-overwin-f)
noremap  <Leader>eF <Plug>(easymotion-F)
" nmap <Leader>eF <Plug>(easymotion-overwin-f)

noremap <Leader>ew <Plug>(easymotion-w)
noremap <Leader>eb <Plug>(easymotion-b)
noremap <Leader>ee <Plug>(easymotion-e)

noremap <Leader>el <Plug>(easymotion-lineforward)
noremap <Leader>ej <Plug>(easymotion-j)
noremap <Leader>ek <Plug>(easymotion-k)
noremap <Leader>eh <Plug>(easymotion-linebackward)

noremap <Leader>es <Plug>(easymotion-overwin-f2)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

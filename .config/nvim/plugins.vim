"" Plugins setting
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
    " Interface
    Plug 'morhetz/gruvbox'
    Plug 'glepnir/dashboard-nvim'
    Plug 'nvim-lualine/lualine.nvim'

    " nerdtree
    Plug 'preservim/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'for': 'nerdtree' }
    Plug 'PhilRunninger/nerdtree-visual-selection', { 'for': 'nerdtree' }
   
    " fzf
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
   
    " nvim-cmp
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    
    Plug 'preservim/nerdcommenter'
    Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!', 'WhichKeyVisual'] }
    Plug 'voldikss/vim-floaterm'
    Plug 'zhimsel/vim-stay'
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
if !has("gui_running")
    highlight! Normal ctermbg=NONE guibg=NONE
endif

" dashboard
let g:dashboard_default_executive ='fzf'
nnoremap <silent> <leader>bB :Dashboard<CR>

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

" nerdcommenter
let g:NERDSpaceDelims = 1

" which-key
set timeoutlen=500
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :WhichKeyVisual '<Space>'<CR>
let g:which_key_use_floating_win = 1
" source $HOME/.config/nvim/key-desc.vim "TODO

" fzf
noremap <leader>fz :Files<space>
noremap <leader>fr :Files<CR>
noremap <silent> <leader>hh :Helptags<CR>

" nvim-cmp
" luafile $HOME/.config/nvim/cmp-setup.lua

" floaterm
noremap <silent> <c-t> :WhichKey '<Space>'<CR>t
noremap <silent> <leader>tt :FloatermToggle<CR>
noremap <silent> <leader>tn :FloatermNew<CR>
noremap <silent> <leader>tf :FloatermNew vifm<CR>
noremap <silent> <leader>tg :FloatermNew lazygit<CR>

" lualine
" luado require('lualine').setup()
luafile $HOME/.config/nvim/line-setup.lua

" vim-stay
set viewoptions=cursor,folds,slash,unix

"" Start plug-ins setting
" gruvbox
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_transparent_bg=1
colorscheme gruvbox
if !has("gui_running")
    highlight! Normal ctermbg=NONE guibg=NONE
endif

" airline
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" airline themes
let g:airline_theme='base16_gruvbox_dark_hard'

" NERDTree
let NERDTreeBookmarksFile = expand("$HOME/.vim/NERDTreeBookmarks")
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

" startify
noremap <leader>bs :Startify<CR>
let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- $HOME/.vim/NERDTreeBookmarks")
let g:startify_lists = [
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

" which-key
set timeoutlen=500
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :WhichKeyVisual '<Space>'<CR>
let g:which_key_use_floating_win = 1

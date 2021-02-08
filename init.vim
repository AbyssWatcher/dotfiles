call plug#begin("~/.config/nvim/site/plugged")
" Themes
Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'
" Plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
" Features
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Settings
syntax on " Syntax highlighting: ON
colorscheme onedark " Color scheme/theme: onedark
set number " Line numbers: ON
set tabstop=4 " Tab: 4 spaces
set shiftwidth=4 " The amount you indent: 4 spaces
"set showmatch " Shows matching brackets
set clipboard=unnamed " Allows for re-binding clipboard functions
set paste
" todo: 1. re-map ctrl+z 2. re-map ctrl+y 3.

" Key Bindings
" The <Leader> key is defaulted to \

" Use proper clipboard (:help clipboard)
set clipboard+=unnamedplus
" Source Vimrc Shortcut
nnoremap <Leader>sv :source $MYVIMRC<CR>
" Copy
" noremap <Leader>y "+y
" Paste
" noremap <Leader>p "+gP

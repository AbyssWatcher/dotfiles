""" AbyssWatcher's Neovim Init.vim

""" Vim-Plug (https://github.com/junegunn/vim-plug)
call plug#begin("~/.config/nvim/site/plugged")

" Themes
Plug 'joshdick/onedark.vim'

" Features
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

""" Settings
syntax on " Syntax highlighting: ON
colorscheme onedark
set number " Line numbers: ON
set tabstop=4 shiftwidth=4 smarttab autoindent
set clipboard=unnamed
set clipboard+=unnamedplus
" autoindent can mess with copy-pasting. Use F2 before pasting.
set pastetoggle=<F7> " Toggles between paste and nopaste.

""" Plugin Configuration
" Airline
" Fugitive
" Nerdtree
" Conquer of Completion (coc)

""" Key Bindings and Macros

" The <Leader> key is defaulted to \
" An alternative is mapping it to <SPACE>
let mapleader=" "
nnoremap <SPACE> <Nop>

" <SPACE> sv = Reloads Neovim's init.vim (without restarting).
nnoremap <Leader>sv :source $MYVIMRC<CR>

""" TO DO
" -Add indentation lines (like in VSCode).
" -Configure the correct language servers for Coc.
" -Learn how to use Fugitive (fix merge conflicts, etc).
" -Add: vim-polyglot, vim-devicons
" -Maybe Add: vim-snippets, vim-pydocstring, vim-surround

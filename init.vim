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
Plug 'preservim/nerdtree' " NERDTree (File Explorer)
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of Completion (Tab Completion)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fzf (Command-line Fuzzy Finder)
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

""" Settings
syntax on " Syntax highlighting: ON
colorscheme onedark
set number " Line numbers: ON
set tabstop=4 expandtab shiftwidth=4 autoindent
set clipboard=unnamed
set clipboard+=unnamedplus
" autoindent can mess with copy-pasting. Use F2 before pasting.
set pastetoggle=<F7> " Toggles between paste and nopaste.

autocmd FileType html setlocal sw=2 ts=2 expandtab
autocmd FileType javascript setlocal sw=2 ts=2 expandtab
autocmd FileType javascriptreact setlocal sw=2 ts=2 expandtab
autocmd FileType typescript setlocal sw=2 ts=2 expandtab
autocmd FileType typescriptreact setlocal sw=2 ts=2 expandtab
autocmd FileType json setlocal sw=2 ts=2 expandtab

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

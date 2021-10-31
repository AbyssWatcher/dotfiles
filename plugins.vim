" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

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
  Plug 'sheerun/vim-polyglot'

call plug#end()

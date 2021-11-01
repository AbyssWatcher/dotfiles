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
Plug 'sheerun/vim-polyglot'
Plug 'JamshedVesuna/vim-markdown-preview'

call plug#end()

""" Settings
" Colors and Themes
set termguicolors
colorscheme onedark

" General Editing
set tabstop=4 expandtab shiftwidth=4 autoindent
syntax on " Syntax highlighting: ON
set number " Line numbers: ON

" Clipboard
set clipboard=unnamed
set clipboard+=unnamedplus

" Folding
set foldcolumn=2

" File Type Specific
autocmd FileType text setlocal foldmethod=indent
autocmd FileType html setlocal sw=2 ts=2 expandtab
autocmd FileType css setlocal sw=2 ts=2 expandtab
autocmd FileType javascript setlocal sw=2 ts=2 expandtab
autocmd FileType javascriptreact setlocal sw=2 ts=2 expandtab
autocmd FileType typescript setlocal sw=2 ts=2 expandtab
autocmd FileType typescriptreact setlocal sw=2 ts=2 expandtab
autocmd FileType json setlocal sw=2 ts=2 expandtab

" Other
" autoindent can mess with copy-pasting. Use F2 before pasting.
set pastetoggle=<F7> " Toggles between paste and nopaste.
""" End Settings

""" Go
" Disable all linters as that is taken care of by coc.nvim.
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []
" Don't jump to errors after metalinter is invoked.
let g:go_jump_to_error = 0
" Run go imports on file save
let g:go_fmt_command = "goimports"
" Automatically highlight variable your cursor is on
let g:go_auto_sameids = 0
" Syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
""" End Go

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

""" Markdown Preview
let vim_markdown_preview_github=1

""" Key Bindings and Macros
" The <Leader> key is defaulted to \
" An alternative is mapping it to <SPACE>
let mapleader=" "
nnoremap <SPACE> <Nop>
" <SPACE> sv = Reloads Neovim's init.vim (without restarting).
nnoremap <Leader>sv :source $MYVIMRC<CR>
""" End Key Bindings and Macros

""" Mouse
set mouse=a
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()

    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction
""" End Mouse

""" Nerdtree
" Toggle side window with `CTRL+z`.
map <C-z> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1 " Show hidden files
""" End Nerdtree

""" .vimrc/init.vim Inspirations
" https://gist.github.com/miguelgrinberg/527bb5a400791f89b3c4da4bd61222e4

""" Plugin Configuration
" Airline
" Fugitive
" Nerdtree
" Conquer of Completion (coc)

""" TO DO
" -Add indentation lines (like in VSCode).
" -Configure the correct language servers for Coc (Python).
" -Learn how to use Fugitive (fix merge conflicts, etc).
" -Add: vim-polyglot, vim-devicons
" -Maybe Add: vim-snippets, vim-pydocstring, vim-surround

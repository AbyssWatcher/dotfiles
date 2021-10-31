source $HOME/.config/nvim/vim-plug/plugins.vim

""" Settings
syntax on " Syntax highlighting: ON
set background=dark
let g:onedark_termcolors=16
set termguicolors
colorscheme onedark
set number " Line numbers: ON
set tabstop=4 expandtab shiftwidth=4 autoindent
set clipboard=unnamed
set clipboard+=unnamedplus
" autoindent can mess with copy-pasting. Use F2 before pasting.
set pastetoggle=<F7> " Toggles between paste and nopaste.
set foldcolumn=2
set mouse=a

let g:airline_powerline_fonts = 1

autocmd FileType text setlocal foldmethod=indent
autocmd FileType html setlocal sw=2 ts=2 expandtab
autocmd FileType javascript setlocal sw=2 ts=2 expandtab
autocmd FileType javascriptreact setlocal sw=2 ts=2 expandtab
autocmd FileType typescript setlocal sw=2 ts=2 expandtab
autocmd FileType typescriptreact setlocal sw=2 ts=2 expandtab
autocmd FileType json setlocal sw=2 ts=2 expandtab

" Go Settings
" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []
" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0
" run go imports on file save
let g:go_fmt_command = "goimports"
" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0
" syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" Nerdtree Settings
" Toggle side window with `CTRL+z`.
map <C-z> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1 " Show hidden files

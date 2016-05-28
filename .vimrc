"---------------------------------------------------------------------------
"  DISPLAY / UI{{{
"
"---------------------------------------------------------------------------

" Show syntax highlight
syntax on

set laststatus=2

" visual autocomplete for command menu
set wildmenu

" Enable folding
 set foldmethod=syntax
 set foldlevel=99

"specify different areas of the screen where the splits should occur
set splitright

" Replace tabs with spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Whe you hit tab at start of line, indent added according to shiftwidth value
set smarttab

" Mouse
set mouse=a

" Auto reload changed files
set autoread

" Extra stuff
set encoding=utf-8
"set clipboard=unnamedplus "won't work if vim isn't compiled with clipboard parameter

" grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" Line management
set number
set cursorline

" Mute error bell
set novisualbell

" Enable display whitespace characters
set list

" Setting up how to display whitespace characters
set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯,nbsp:~

" Numbers of rows to keep to the left and to the right off the screen
set scrolloff=5

" Numbers of columns to keep to the left and to the right off the screen
set sidescrolloff=5

" Vim will move to the previous/next line after reaching first/last char in
" the line with this commnad (you can add 'h' or 'l' here as well)
" <,> stand for arrows in command mode and [,] arrows in visual mode
set whichwrap=b,s,<,>,[,],

set nocompatible              " be iMproved, required

" Instead of failing a command because of unsaved changes, instead raise a
" " dialogue asking if you wish to save changed files.
set confirm

" vim's autodetection of filetype interferes with vundle, the package manager
" " we wish to use.
filetype off                  " required

set noshowmode

"}}}
"---------------------------------------------------------------------------
" VUNDLE PLUGINS{{{
"
"---------------------------------------------------------------------------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'matze/vim-move'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'shougo/unite.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'hdima/python-syntax'
Plugin 'rking/ag.vim'
Plugin 'mhinz/vim-signify'
Plugin 'tmhedberg/simpylfold'
Plugin 'tpope/vim-repeat'
Plugin 'c.vim'
Plugin 'valloric/youcompleteme'
Plugin 'nvie/vim-flake8' 
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/indentpython.vim'
call vundle#end()            " required

"Activation of the filetype detection for VIM version > 7.3.430 
filetype on                  " required

"}}}
"---------------------------------------------------------------------------
" IDENTATION{{{
"
"---------------------------------------------------------------------------
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype plugin indent on
set autoindent

"}}}
"---------------------------------------------------------------------------
"  SEARCH / HIGHLIGHT{{{ 
"
"---------------------------------------------------------------------------

" Add the g flag to search/replace by default
set gdefault

" Highlight search results
set hlsearch

" Ignore case in search patterns
set ignorecase

" Override the 'ignorecase' option if the search patter ncontains upper case characters
set smartcase

" Live search. While typing a search command, show where the pattern
set incsearch

" Show matching brackets
set showmatch

"}}}
"---------------------------------------------------------------------------
" VUNDLE PLUGINS OPTIONS{{{
"
"---------------------------------------------------------------------------

"vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

"syntastic
  "General
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:airline#extensions#syntastic#enabled = 1
    let g:syntastic_enable_signs=1

    "C++
    let g:syntastic_cpp_compiler = 'clang++'
    let g:syntastic_cpp_compiler_options = ' -std=c++11  -stdlib=libc++'
    "let g:syntastic_cpp_check_header = 1
    "let g:syntastic_cpp_remove_include_errors = 1

    "Python
    let g:syntastic_python_pylint_quiet_messages= { 'level' : 'warnings' }
    "let g:syntastic_python_checkers = "['pylint']

    "Fortran
    let g:syntastic_fortran_compiler_options ='-std=f90'

"airline
  " Enable the list of buffers
    let g:airline#extensions#tabline#enabled = 1
  " Show just the filename
    let g:airline#extensions#tabline#fnamemod = ':t'
  " Use powerline fonts
    let g:airline_powerline_fonts = 1

"multicursor
let g:multicursor_insert_maps = 1
let g:multicursor_normal_maps = 1

"vim-move
let g:move_key_modifier = 'C'

"python-syntax
let python_highlight_all = 1

"signify 
let g:signify_vcs_list              = ['git']
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '!'
let g:signify_sign_changedelete      = g:signify_sign_change
let g:signify_sign_show_count = 1

" }}}
"---------------------------------------------------------------------------
"  COLORS / THEME{{{
"
"---------------------------------------------------------------------------
set t_Co=256
let g:airline_theme='onedark'
set background=dark
colorscheme onedark
"}}}
"---------------------------------------------------------------------------
"  Mappings{{{
"
"---------------------------------------------------------------------------

" Key leader
:let mapleader = ","

" maps Tagbar to F9
 map <silent> <F9> :TagbarToggle<CR>
 map! <silent> <F9> <ESC>:TagbarToggle<CR>

" maps NERDTree to F10
map <silent> <F10> :NERDTreeToggle<CR>
map! <silent> <F10> <ESC>:NERDTreeToggle<CR>

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Disable higlighting search result on Enter key
nnoremap <silent> <cr> :nohlsearch<cr><cr>

" Enable folding with the spacebar
nnoremap <space> za

" Use quick saving, also in Insert mode
nnoremap <F2> :w<cr>
inoremap <F2> <C-c>:w<cr>
vmap <F2> <esc>:w<CR>gv

"Set paste mode to F3
set pastetoggle=<F3>
"}}}
"--------------------------------------------------------------------------
"   FILE TYPES{{{
"
"--------------------------------------------------------------------------
augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
    augroup END

augroup filetype_py
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4
    autocmd BufNewFile,BufRead *.py setlocal softtabstop=4
    autocmd BufNewFile,BufRead *.py setlocal shiftwidth=4
    autocmd BufNewFile,BufRead *.py setlocal textwidth=79
    autocmd BufNewFile,BufRead *.py setlocal expandtab
    autocmd BufNewFile,BufRead *.py setlocal autoindent
    autocmd BufNewFile,BufRead *.py setlocal fileformat=unix
    autocmd BufNewFile,BufRead *.py setlocal colorcolumn=80
augroup END

"}}}
"--------------------------------------------------------------------------
"  FUNCTIONS{{{
"  
"--------------------------------------------------------------------------
"  Convenient command to see the difference between the current buffer and the
"  file it was loaded from, thus the changes you made.
"  Only define it when not defined already.
if !exists(":DiffOrig")
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                  \ | wincmd p | diffthis
endif

" Makes Vim jump to the last position when reopening a file
if has("autocmd")
          au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" }}}
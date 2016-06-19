"---------------------------------------------------------------------------
"  DISPLAY / UI{{{
"
"---------------------------------------------------------------------------
" The font used is Atom's one:
" https://github.com/abertsch/Menlo-for-Powerline

" Show syntax highlight
syntax on

" Allow changing buffer without saving it first
set hidden

" Always show the statusline
set laststatus=2

" Lower the delay of escaping out of other modes
" keycode times out fast, mapping times out in a bit more time
set timeout timeoutlen=1000 ttimeout ttimeoutlen=1

" visual autocomplete for command menu
set wildmenu
set wildmode=longest,list,full
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app

" Enable folding
 set foldmethod=syntax
 set foldlevel=99

"always splits to the right and below
set splitright
set splitbelow

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
" listchar=trail is not as flexible, use the below to highlight trailing
" whitespace
 highlight ExtraWhitespace ctermbg=red guibg=red
 match ExtraWhitespace /\s\+$/

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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'joshdick/onedark.vim'
Plugin 'joshdick/airline-onedark.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'matze/vim-move'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'shougo/unite.vim'
Plugin 'shougo/vimproc.vim'
Plugin 'majutsushi/tagbar'
Plugin 'hdima/python-syntax'
Plugin 'rking/ag.vim'
Plugin 'mhinz/vim-signify'
Plugin 'tmhedberg/simpylfold'
Plugin 'c.vim'
Plugin 'valloric/youcompleteme'
Plugin 'nvie/vim-flake8'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'sjl/gundo.vim'
Plugin 'raimondi/delimitmate'
Plugin 'ConradIrwin/vim-bracketed-paste'


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

" Override the 'ignorecase' option if the search pattern contains upper case characters
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

"===============================================================================
" Vim-cpp-enhanced-highlight
"===============================================================================
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

"===============================================================================
" Tagbar
"===============================================================================
let g:tagbar_autofocus=1

"===============================================================================
" Syntastic
"===============================================================================

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
    let g:syntastic_cpp_checkers = ['clang++']
    let g:syntastic_cpp_compiler_options = ' -std=c++11  -stdlib=libc++'
    let g:syntastic_cpp_check_header = 1
    let g:syntastic_cpp_remove_include_errors = 1

"Python
    let g:syntastic_python_pylint_quiet_messages= { 'level' : 'warnings' }
    "let g:syntastic_python_checkers = "['pylint']

"Fortran
    let g:syntastic_fortran_compiler_options ='-std=f90'

"===============================================================================
" Airline
"===============================================================================
  " Enable the list of buffers
    let g:airline#extensions#tabline#enabled = 1
  " Show just the filename
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#bufferline#enabled = 1
  " Use powerline fonts
    let g:airline#extensions#syntastic#enabled = 1
    let g:airline_powerline_fonts = 1
    let g:airline_theme='onedark'
    let g:airline_section_c = airline#section#create_left(['%{getcwd()}', 'file'])
"===============================================================================
" Multicursor
"===============================================================================
let g:multicursor_insert_maps = 1
let g:multicursor_normal_maps = 1

"===============================================================================
" Vim-move
"===============================================================================
let g:move_key_modifier = 'C'

"===============================================================================
" python-syntax
"===============================================================================
let python_highlight_all = 1

"===============================================================================
" Signify
"===============================================================================
let g:signify_vcs_list              = ['git']
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '!'
let g:signify_sign_changedelete      = g:signify_sign_change
let g:signify_sign_show_count = 1

"===============================================================================
" NERDTree
"===============================================================================

let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.pyc', '__pycache__', '\.cache', '\.idea']

"===============================================================================
" NERDCommenter
"===============================================================================
" Always leave a space between the comment character and the comment
let NERDSpaceDelims=1

"===============================================================================
" YouCompleteMe
"===============================================================================
let g:ycm_global_ycm_extra_conf = '/home/jp/.vim/bundle/youcompleteme/third_party/ycmd/cpp/ycm'

"===============================================================================
" Unite
"===============================================================================
" The prefix key.
nnoremap    [unite]   <Nop>
"nmap    <leader>r [unite]
" A simple mapping that will configure <leader>-f to browse for a file in the
" current working directory(start-insert = type to match):
nnoremap <leader>f :<C-u>Unite -start-insert file<CR>

" The popular recursive file search, starting insert automatically and using
" fuzzy file matching:
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>r :<C-u>Unite -start-insert file_rec<CR>
" With large projects use:
" nnoremap <leader>r :<C-u>Unite -start-insert file_rec/async:!<CR>

" Since you can pass in multiple sources into unite you can easily create a
" mapping that will open up a unite pane with the sources you frequently use.
" To see buffers, recent files then bookmarks:
nnoremap <silent> <leader>b :<C-u>Unite buffer bookmark<CR>

call unite#filters#matcher_default#use(['matcher_fuzzy'])
" nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
" nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
" nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
" nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
" nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
" nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Like ctrlp.vim settings.
call unite#custom#profile('default', 'context', {
\   'start_insert': 1,
\   'winheight': 10,
\   'direction': 'botright',
\ })

" The prefix key
" nmap    f [unite]

" nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir
        " \ -buffer-name=files buffer bookmark file<CR>
" nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir
        " \ -buffer-name=files buffer bookmark file<CR>
" nnoremap <silent> [unite]r  :<C-u>Unite
        " \ -buffer-name=register register<CR>
" nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
" nnoremap <silent> [unite]f
        " \ :<C-u>Unite -buffer-name=resume resume<CR>
" nnoremap <silent> [unite]ma
        " \ :<C-u>Unite mapping<CR>
" nnoremap <silent> [unite]me
        " \ :<C-u>Unite output:message<CR>
" nnoremap  [unite]f  :<C-u>Unite source<CR>
" For ack.
if executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts = '-i --no-heading --no-color -a -H'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '-i --no-heading --no-color -a -H'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '-i --vimgrep --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
endif

let g:unite_source_rec_max_cache_files = 99999

"===============================================================================
" UltiSnips
"===============================================================================
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"===============================================================================
" FZF
"===============================================================================
  let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Function'],
      \ 'fg+':     ['fg', 'PreCondit', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Type'],
      \ 'info':    ['fg', 'String'],
      \ 'prompt':  ['fg', 'Constant'],
      \ 'pointer': ['fg', 'Error'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

    " Default fzf layout
    " - down / up / left / right
    " - window (nvim only)
    let g:fzf_layout = { 'down': '~40%' }
    " [Buffers] Jump to the existing window if possible
    let g:fzf_buffers_jump = 1
    " [Tags] Command to generate tags file
    let g:fzf_tags_command = 'ctags -R'
    " Redefine :Ag command
autocmd VimEnter * command! -nargs=* Ag
      \ call fzf#vim#ag(<q-args>, '--color-path "33;1"', fzf#vim#default_layout)
    " Advanced customization using autoload functions
    autocmd VimEnter * command! Colors
      \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'})
" }}}
"---------------------------------------------------------------------------
"  COLORS / THEME{{{
"
"---------------------------------------------------------------------------
set t_Co=256
set background=dark
colorscheme onedark
"}}}
"---------------------------------------------------------------------------
"  Mappings{{{
"
"---------------------------------------------------------------------------
"===============================================================================
" Key leader Mappings
"===============================================================================

" Key leader
:let mapleader = ","

" <Leader>e: Fast editing of the .vimrc
nnoremap <Leader>e :e! ~/.vimrc<cr>

" <Leader>q: Quit all, very useful in vimdiff
nnoremap <Leader>q :qa<cr>

"===============================================================================
" Normal Mode Key Mappings
"===============================================================================

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Disable higlighting search result on Enter key
nnoremap <silent> <cr> :nohlsearch<cr><cr>

" Enable folding with the spacebar
nnoremap <space> za

" Use quick saving, also in Insert mode
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" | : Quick vertical splits
nnoremap <bar> :vsp<cr>

" Ctrl-f: fzf
nnoremap <c-f> :Ag

"Quick switch buffer
nnoremap <C-left> :bprev<CR>
nnoremap <C-right> :bnext<CR>

" Ctrl-p: Recent files
nnoremap <c-p> :History<CR>

"Allows moving through wrapped lines effectively
:nnoremap k gk
:nnoremap j gj

" <C-c>: Toggle comment
nmap <C-c> <Leader>c<space>

"===============================================================================
" Normal Mode Meta/Alt Key Mappings
"===============================================================================



"===============================================================================
" "F" Key Mappings
"===============================================================================

" Switch buffers with menu
:nnoremap <F5> :buffers<CR>:buffer<Space>

" Press F6 to toggle color column
nnoremap <silent><F6> :call <SID>ToggleColorColumn()<cr>

" maps Tagbar to F8
map <silent> <F8> :TagbarToggle<CR>
map! <silent> <F8> <ESC>:TagbarToggle<CR>

" maps NERDTree to F10
map <silent> <F10> :NERDTreeToggle<CR>
map! <silent> <F10> <ESC>:NERDTreeToggle<CR>

"===============================================================================
" Visual Mode Key Mappings
"===============================================================================

" Enter: Highlight visual selections
xnoremap <silent> <CR> y:let @/ = @"<cr>:set hlsearch<cr>

" Backspace: Delete selected and go into insert mode
xnoremap <bs> c

" <|>: Reselect visual block after indent
xnoremap < <gv
xnoremap > >gv

" Ctrl-r: Easier search and replace
vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>

" Ctrl-s: Easier substitue
vnoremap <c-s> :s/\%V//g<left><left><left>

" Ctrl-f: Find highlight word with FZF
vnoremap <c-f> "hy:Ag <c-r>h<cr>

" <C-c>: Toggle comment
xmap <C-c> <Leader>c<space>

"===============================================================================
" Normal Mode Shift Key Mappings
"===============================================================================

" _ : Quick horizontal splits
 nnoremap _ :sp<cr>

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
    " autocmd BufNewFile,BufRead *.py setlocal textwidth=79
    autocmd BufNewFile,BufRead *.py setlocal fileformat=unix
    " autocmd BufNewFile,BufRead *.py setlocal colorcolumn=80
    autocmd BufNewFile,BufRead *.py let s:color_column_old = 80
    " Remove any trailing whitespace that is in the file
    autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
    autocmd FileType python setlocal foldmethod=indent
augroup END

augroup filetype_f90
    autocmd!
    " autocmd BufNewFile,BufRead *.py setlocal textwidth=129
    autocmd BufNewFile,BufRead *.f90 setlocal fileformat=unix
    autocmd BufNewFile,BufRead *.f90 setlocal colorcolumn=130
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

" Make UltiSnips works nicely with YCM
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
                return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.
  imap <buffer> jj      <Plug>(unite_insert_leave)
  "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

  imap <buffer><expr> j unite#smart_map('j', '')
  imap <buffer> <TAB>   <Plug>(unite_select_next_line)
  imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
  imap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> '     <Plug>(unite_quick_match_default_action)
  imap <buffer><expr> x
          \ unite#smart_map('x', "\<Plug>(unite_quick_match_jump)")
  nmap <buffer> x     <Plug>(unite_quick_match_jump)
  nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
  nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
  imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
  nnoremap <silent><buffer><expr> l
          \ unite#smart_map('l', unite#do_action('default'))

  let unite = unite#get_current_unite()
  if unite.profile_name ==# 'search'
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r     unite#do_action('rename')
  endif

  nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
  nnoremap <buffer><expr> S      unite#mappings#set_current_sorters(
          \ empty(unite#mappings#get_current_sorters()) ?
          \ ['sorter_reverse'] : [])

  " Runs "split" action by <C-s>.
  imap <silent><buffer><expr> <C-s>     unite#do_action('split')
endfunction"}}}

" let s:color_column_old = 80
function! s:ToggleColorColumn()
    if s:color_column_old == 80
        let s:color_column_old = &colorcolumn
        windo let &colorcolumn = 80
    else
        windo let &colorcolumn=s:color_column_old
        let s:color_column_old = 80
    endif
endfunction

" }}}

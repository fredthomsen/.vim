"""""""""""""""""""""
"Fred Thomsen
"
"Personal .vimrc file
""""""""""""""""""""""

"""""""""
"main
"""""""""
set nocompatible "ignore shitty vi compatibilty
set encoding=utf-8
set fileencoding=utf-8

"windows compatibility
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    let $HOME="C:/Program Files/Vim"
    let $PATH=$PATH . ";C:/gnuwin32/bin"
else
    let $VIMSRC="$VIM/vim74"
endif

" Pathogen
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'

filetype plugin on
filetype indent on
syntax on

set history=5000 
set autoread "auto read changes made outside editor
set hid "no forcing save between buffer changes
set autochdir "auto change directory

let mapleader = ","
let g:mapleader = ","

map <leader>w :w!<CR> 
map <leader>e :e .<CR>
map <leader>q :q<CR>
map <leader>qa :qall<CR>
map <F6> :e#<CR>

""""""""
"UI
""""""""
set showmatch "matching parathesis or branket is flashed to
set mat=5 "flash length of match
set nu "line numbering
set noerrorbells "annoying as hell
set backspace=indent,eol,start "backspace for dummys
set lazyredraw "don't redraw while running macros
set clipboard=unnamed "share vim and system clipboard

if has("gui_running")
    set lines=999 columns=999 "fullscreen with gvim
    set guioptions-=T "kill toolbar
    set guioptions-=m "kill menu
    set guioptions-=r "kill scrollbar
    set guioptions-=l "kill more scrollbar
    set guioptions-=L "kill even more scrollbar

    let s:uname = system("uname")
        if s:uname == "Darwin\n"
            set guifont=Liberation\ Mono\ for\ Powerline:h12
    endif
endif

set wildmenu "command line compeletion
set wildignore=*.o,*.obj,*.a,*.so,*.dll,*.exe,*.jpg,*.gif,*.png,*.class,*~

if has('win32') || has('win64')
    set shell=cmd
else
    set shell=/bin/bash
endif

if has('cmdline_info')
    set ruler                   "always show current position 
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                 "show partial commands in status line and selected characters/lines in visual mode
endif

if has('statusline')
    set laststatus=2
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    set statusline+=%{fugitive#statusline()} " show git branch info
endif

""search
set ignorecase "case insensitive search
set smartcase "smart case search
set hls "set search highlighting

"find word under cursor
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

""indent
set autoindent  "don't make indenting things a pain
set smartindent
set tabstop=4 "tabs make 4 spaces
set softtabstop=4 "backspace deletes indent
set shiftwidth=4
set expandtab
set lbr "word wrap

"dont exit visual mode after indent/dedect
vnoremap < <gv
vnoremap > >gv

""auto closing braces brackets parathesis
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()

inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap [[     [
inoremap []     []

inoremap "      ""<Left>
inoremap '      ''<Left>

""exit insert mode fast
inoremap jk <esc>
inoremap kj <esc>

""comments
set comments=sl:/*,mb:\ *,elx:\ */

""tags
set tags=tags;/ "work up dir tree until tag file is found

"cycle between tags
map <C-y> :tprevious<CR>
map <C-u> :tnext<CR>
"down tag stack
map <C-l> <C-]>
"up tag stack
map <C-h> <C-[>

"regenerate tags
map <F5> :!ctags -R .<CR> 

""cscope
if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

""undo/redo
set undolevels=1000

""theme
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

""""""""
"buffers/tabs/windows
""""""""

""buffers
"Close the current buffer
map <leader>bd :bdelete<cr>

"Close all the buffers
map <leader>ba :1,300 bd!<cr>

"buffer left/right
map <C-j> :bp<CR>
map <C-k> :bn<CR>

""windows
map <C-f> <C-W>l
map <C-a> <C-W>h
map <C-d> <C-W>k
map <C-s> <C-W>j

""tabs
map <leader>tn :tabnew<cr>
map <leader>te :tabedit<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

set switchbuf=usetab

""""""""
"plugins
""""""""

""Nerd-Tree
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
autocmd VimEnter * wincmd w
map <leader>n :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$','\.o$','\.class$','\.swp$', 'tags$']

""tagbar
autocmd VimEnter * nested TagbarOpen

""supertab
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

""CtrlP
map <leader>p :CtrlP<CR>
map <leader>t :CtrlPTag<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>f :CtrlPMRUFiles<CR>
map <leader>m :CtrlPMixed<CR>

""syntastic
let g:syntastic_mode_map = { 'mode': 'active',
	\ 'active_filetypes': [],
	\ 'passive_filetypes': [] }

""airline
let g:airline_powerline_fonts = 1"

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

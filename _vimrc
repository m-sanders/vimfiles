" http://sontek.net/turning-vim-into-a-modern-python-ide#responses 

" map \ to , which is easier to each:
:let mapleader = ","

" NOOB MODE - no up down left right

inoremap <left> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <right> <nop>
nnoremap <left> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap j gj
nnoremap k gk

" tabs - i guess the python extension deals with this too?

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" general editor settings:

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
"set undofile
set relativenumber

" remove flashy beeping errors
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" improved native searching and moving:
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
" clean out a search nicely with ,space
nnoremap <leader><space> :noh<cr>

" long line handling:
" i know the standard says but its tempting to ignore it....
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" turns off backwards vi compatability
set nocompatible

" if i want help i will type it in with :help!

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" paste from clipboard:
map <leader>p "+p

" remap ; to : as sometimes you miss it then end up with a semi!
nnoremap ; :

" Save on losing focus

au FocusLost * :wa

" hard wrap text automagically:

nnoremap <leader>q gqip

"Reselect previously pasted text (iguess this only works with yanked and
"pasted:

nnoremap <leader>v V' ]

"Super fast exit interactive mode with jj - which never comes in pairs!
"
inoremap jj <ESC>

"rainbow parens - toggle with ,R
"let rainbow_paren
"nnoremap <leader>R
" set the font:

set guifont=Monaco:h10:cANSI

" color scheme :)
colorscheme molokai
let g:molokai_original = 1 

" This sets up vim to use plugins in a modular manner
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Code folding plugin: keypress za
set foldmethod =indent
set foldlevel=99

" Split scroll with ,sb
fu! SplitScroll()
    :wincmd v
    :wincmd w
    execute "normal! \<C-d>"
    :set scrollbind
    :wincmd w
    :set scrollbind
endfu
nmap <leader>sb :call SplitScroll()<CR>

" window splits: 
"  commands:
"    vert split Ctrl+w + v
"    horz split Ctrl+w + s
"    close: Ctrl + w + q
" map movement to Ctrl+movement keys for windows:
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Quit window
nnoremap <leader>q :q<CR>

"Remove trailing whitespace
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" =================================================
" Filetype specfic changes
" =================================================

au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

let g:SuperTabDefaultCompletionType = "context"

au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" task lists mark with TODO or FIXME
" leader is \ but also mapped to ,
map <leader>todo <Plug>TaskList

" gundo plugin - this does a revision history on all saves of the current file
" allowing you to revert back and forth
" Keypress: ,g

map <leader>g :GundoToggle<CR>

" Syntax highlighting and validation

syntax on
filetype on
filetype plugin indent on

" we are using pyflakes which notifies invalid syntax and un used imports
let g:pyflakes_use_quickfix=0

" pep8 bitch and moaner!
let g:pep8_map='<leader>8'

" supertab code completion
" hitting ,pw will open the documentation of the module under the cursor
au FileType python set omnifunc=pythoncomplete#Complete

set completeopt=menuone,longest,preview

" buffers - open a file with :e to place it in the buffer 
" we have mini buffers plugin to show all open buffers, to list buffers type :buffers
" switch them with :b<number> or its name
" close a buffer with :bd or :bw

" fuzzy text search
" use ,t (does this conflict with,td? tp pop it up and then you can fuzzy
" search the project.

" File browser
" open with ,n

map <leader>n :NERDTreeToggle<CR>

" refactoring and go to definition lookup ropevim for more commands as it does
" more!
" jump to: ,j
" rename: ,r

map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" searching with ack tool
" ,a to fuzzy search classes, variables modules etc

map <leader>a <Esc>:Ack!

" Git integration!
" Gblame - line by line comparison of who did what
" Gwrite stage the file (git add <filename>)
" Gread checkout the file (git checkout <filename>)
" Gcommit commit the file (git commit <filename>)
"

" Test integration - this is largely dependent on what you are doing
" but make green is a general runner for these things. a key press can be
" assigned to execute it:
" map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

map <unique> <silent> <Leader>mg :call MakeGreen()<cr>
" This gives you a green bar at the bottom if the tests all work

" More testing py.test
" This is slightly more involved than make green:
" ,tf execute tests in file
" ,tc execute tests in class
" ,tm execute tests in method
" cycle through errors:
" ,tn next error
" ,tp previous error
" ,te error

nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>

nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" if you are using a virtual env (never used it, but they're a good idea :)

"py << EOF
"import os.path
"import sys
"import vim
"
"if 'VIRTUAL_ENV' in os.environ:
"	project_base_dir = os.eviron['VIRTUAL_ENV']
"	sys.path.insert(0, project_base_dir)
"	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"	execfile(activate_this, dict(__file__=activate_this))
"EOF

" For django code completion:

"export DJANGO_SETTINGS_MODULE=project.settings

" python enhanced syntax highlighting:

:let python_highlight_all = 1

" replace the line below with rst style header of the same length
" keypress ,1 ,2 ,3 ,4
" 
nnoremap <leader>1 yypVr*
nnoremap <leader>2 yypVr=
nnoremap <leader>3 yypVr-
nnoremap <leader>4 yypVr+



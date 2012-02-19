" http://sontek.net/turning-vim-into-a-modern-python-ide#responses 

" set the font:

set guifont=Monaco:h9:cANSI

" map \ to , which is easier to each:
:let mapleader = ","

" color scheme :)
colorscheme vividchalk

" This sets up vim to use plugins in a modular manner
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Code folding plugin: keypress za
set foldmethod =indent
set foldlevel=99

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
let g:SuperTabDefaultCompletionType = "context"

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
" goto: ,j
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

py << EOF
import os.path
import sys
import vim

if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.eviron['VIRTUAL_ENV']
	sys.path.insert(0, project_base_dir)
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

" For django code completion:

"export DJANGO_SETTINGS_MODULE=project.settings







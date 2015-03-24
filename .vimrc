"------------------------------------------------"
" My Vim file
"
" Author: Marin Grgurev <marin.grgurev@gmail.com>
" Last change: 2015 March 17
"------------------------------------------------"
"
"------ Turn on the enhancements and improvements of Vi Improved ------"
set nocompatible    " no compatibility to venerable old vi

"------ Automatic reloading of .vimrc ------"
autocmd! bufwritepost .vimrc source %

"------ Better copy & paste ------"
set pastetoggle=<F2>
set clipboard=unnamed

"------ Easier moving of code blocks ------"
vnoremap < <gv
vnoremap > >gv

"------ Show whitespace ------"
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

"------ Set colorscheme ------"
colorscheme default

"------ Enable syntax highlighting ------"
filetype off
filetype plugin indent on
syntax on

"------ Console UI & Text display ------"
set cmdheight=1		" explicitly set the height of the command line
set showcmd 		" show (partial) command in status line
set mousehide 		" hide the mouse when typing text
set number		    " show line number
set nuw=4		    " setting the size of the character for row numbering
set ruler 		    " set the current position at the bottom of the screen
set scrolloff=5		" keep at least 5 lines above/below
set sidescrolloff=5 " keep at least 5 lines left/right
set shortmess=I 	" don't show intro
set vb t_vb= 		" remove sounds and flashing on erors
set guioptions-=T 	" remove top toolbar
set guifont=Monospace\ 9
set backspace=indent,eol,start "allow the backspace key to erase previously entered characters, autoindent, and newline
set tw=79		    " set width of document (used by gd)
set nowrap		    " don't automatically wrap on load
set fo-=t		    " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn guibg=Grey95

"------ Usefull settings ------"
set history=70
set undolevels=700

"------ Tab instead spaces ------"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

"------ Disable backup and swap files ------"
set nobackup
set nowritebackup
set noswapfile

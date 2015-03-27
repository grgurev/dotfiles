"-----------------------------------------------"
" My Vim file
"
" Author: Marin Grgurev <marin.grgurev@gmail.com>
" Last change: 2015 March 17
"------------------------------------------------"

"------ Section 1 ------"
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
set tw=80		    " set width of document (used by gd)
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

"------ Code folding ------"
"set foldmethod=manual
"set foldlevel=99

"------ Disable backup and swap files ------"
set nobackup
set nowritebackup
set noswapfile

" Map keys for easier window navigation
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"------ Section 2 ------"
"------ Plugin list ------"
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'rking/ag.vim'         " ag plugin
Plug 'Shougo/vimproc.vim'   " vimproc plugin, needed for Unite
Plug 'Shougo/unite.vim'     " Unite plugin
Plug 'nvie/vim-flake8'      " a static syntax and style checker for Python source code
Plug 'ervandew/supertab'    " plugin which allows you to use <Tab> for all your insert completion
Plug 'davidhalter/jedi-vim' " Python autocompletion with VIM

call plug#end()

"------ Plugin settings ------"
"------ Easy align interactive ------"
vnoremap <silent> <Enter> :EasyAlign<cr>

"------ Unite ------"
" enable to track search history
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :<C-u>Unite history/yank<CR>

try
    let g:unite_source_rec_async_command='ag --nocolor --nogroup --hidden -g ""'
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#filters#sorter_default#use(['sorter_rank'])
catch
endtry

" recursive file search using fuzzy file matching
nnoremap <silent> <space>f :Unite -start-insert file_rec/async<CR>

" search through buffer, bookmark
nnoremap <space>b :<C-u>Unite buffer bookmark<CR>

:nnoremap <space>r <Plug>(unite_restart)

"------ Silver search ------"
" --- type ° to search the word in all files in the current dir
nmap ° :Ag <c-r>=expand("<cword>")<CR><CR>
nnoremap <space>/ :Ag

"------ flake8 ------"
let g:flake8_quickfix_height=28

"------ supertab ------"
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
